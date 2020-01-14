// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================

//==================================================================================================
//  Filename      : axi_lite_bridge.v
//  Created On    : 2015-10-20
//  Revision      :
//  Author        : Xiaohua Liang & Matthew Matl (Modified by Tigar Cyr and Chris Grimm
//  Company       : Princeton University
//  Email         : xiaohua@princeton.edu & mmatl@princeton.edu
//
//  Description   : Translate the incoming AXI-Lite message (in the Piton Messaging
//                  Protocol, via a val/rdy interface) to a series of NOC
//                  requests.
//==================================================================================================

//Code is incomplete. We were not able to test the functionality of this bridge due to the inability to get NVDLA to make a memory request from the memory interface block.

`include "define.tmp.h"
`define C_M_AXI_LITE_DATA_WIDTH  `NOC_DATA_WIDTH
`define C_M_AXI_LITE_ADDR_WIDTH  32
`define C_M_AXI_LITE_RESP_WIDTH  2
// this is non-standard
`define C_M_AXI_LITE_SIZE_WIDTH  3
`define NOC2_FLIT_STATE_WIDTH    3

module axilite_noc_bridge #(
    // SLAVE_RESP_BYTEWIDTH = 0 enables variable width accesses
    // note that the accesses are still 64bit, but the
    // write-enables are generated according to the access size
    parameter SLAVE_RESP_BYTEWIDTH = 4,
    // swap endianess, needed when used in conjunction with a little endian core like Ariane
    parameter SWAP_ENDIANESS       = 0,
			    
    parameter NOCDECODER_DP_DATA_WIDTH  = 4,
			    
    // shift unaligned read data
    parameter ALIGN_RDATA          = 1
) (
    // Clock + Reset
    input wire 					clk,
    input wire 					rst,
   
    //input for NVDLA position
    input [`NOC_CHIPID_WIDTH-1:0] 		chip_id,
    input [`NOC_X_WIDTH -1:0] 			x_id,
    input [`NOC_Y_WIDTH -1:0] 			y_id,

    // Memory Splitter <- AXI SPI
    output reg 					bridge_splitter_val,
    output reg [`NOC_DATA_WIDTH-1:0] 		bridge_splitter_data,
    input wire 					splitter_bridge_rdy,
   
    // Memory Splitter -> AXI SPI
    input wire 					splitter_bridge_val,
    input wire [`NOC_DATA_WIDTH-1:0] 		splitter_bridge_data,
    output wire 				bridge_splitter_rdy,

    // AXI Write Address Channel Signals
    input wire [`C_M_AXI_LITE_ADDR_WIDTH-1:0] 	axi_awaddr,
    input wire 					axi_awvalid,
    output wire 				axi_awready,

    // AXI Write Data Channel Signals
    input wire [`C_M_AXI_LITE_DATA_WIDTH-1:0] 	axi_wdata,
    input wire [`C_M_AXI_LITE_DATA_WIDTH/8-1:0] axi_wstrb,
    input wire 					axi_wvalid,
    output wire 				axi_wready,

    // AXI Read Address Channel Signals
    input wire [`C_M_AXI_LITE_ADDR_WIDTH-1:0] 	axi_araddr,
    input wire 					axi_arvalid,
    output 					axi_arready,

    // AXI Read Data Channel Signals
    output wire [`C_M_AXI_LITE_DATA_WIDTH-1:0] 	axi_rdata,
    output reg [`C_M_AXI_LITE_RESP_WIDTH-1:0] 	axi_rresp,
    output reg 					axi_rvalid,
    input wire 					axi_rready,

    // AXI Write Response Channel Signals
    output reg [`C_M_AXI_LITE_RESP_WIDTH-1:0] 	axi_bresp,
    output reg 					axi_bvalid,
    input wire 					axi_bready
);

//==============================================================================
// Local Parameters
//==============================================================================

// States for Incoming Piton Messages
localparam MSG_STATE_INVAL      = 3'd0; // Invalid Message
localparam MSG_STATE_HEADER_0   = 3'd1; // Header 0
localparam MSG_STATE_HEADER_1   = 3'd2; // Header 1
localparam MSG_STATE_HEADER_2   = 3'd3; // Header 2
localparam MSG_STATE_DATA       = 3'd4; // Data Lines

// Types for Incoming Piton Messages
localparam MSG_TYPE_INVAL       = 2'd0; // Invalid Message
localparam MSG_TYPE_LOAD        = 2'd1; // Load Request
localparam MSG_TYPE_STORE       = 2'd2; // Store Request

// States for Buffer Status
localparam BUF_STATUS_INCOMP    = 2'd0; // Buffer not yet filled by one complete request/response
localparam BUF_STATUS_COMP      = 2'd1; // Buffer contains a complete but unsent request
localparam BUF_STATUS_WAITRESP  = 2'd2; // Request sent via AXI, waiting on response
localparam BUF_STATUS_RESPSEND  = 2'd3; // Response waiting to forward back to memory splitter

// ACK's
localparam LOAD_ACK = 1'd0;
localparam STORE_ACK = 1'd1;

//==============================================================================
// Local Variables
//==============================================================================


 // Meta-registers for tracking incoming Piton packets (used in parsing)
 reg  [2:0]                          splitter_io_msg_state_f;
 reg  [1:0]                          splitter_io_msg_type_f;
 reg  [`MSG_LENGTH_WIDTH-1:0]        splitter_io_msg_counter_f;


// Helper Signals for saving requests

 wire [2:0]                   axi_io_msg_type_mux_out;


 //Helper signals for reading requests from AXI
   wire			     axi_store_request;
   wire                      axi_load_request;
   
   reg [`C_M_AXI_LITE_ADDR_WIDTH-1:0] address;
   reg [`NOC_X_WIDTH-1:0]    dest_xpos;
   reg [`NOC_Y_WIDTH-1:0]    dest_ypos;
   reg [`NOC_CHIPID_WIDTH-1:0] dest_chipid;
   reg [`NOC_FBITS_WIDTH-1:0]  dest_fbits;
   reg [`NOC_X_WIDTH-1:0]      src_xpos;
   reg [`NOC_Y_WIDTH-1:0]      src_ypos;
   reg [`NOC_CHIPID_WIDTH-1:0] src_chipid;
   reg [`NOC_FBITS_WIDTH-1:0]  src_fbits;
   reg [`MSG_LENGTH_WIDTH-1:0] msg_length;
   reg [`MSG_TYPE_WIDTH-1:0]   msg_type;
   reg [`MSG_MSHRID_WIDTH-1:0] msg_mshrid;
   reg [`MSG_OPTIONS_1]        msg_options_1;
   reg [`MSG_OPTIONS_2_]       msg_options_2;
   reg [`MSG_OPTIONS_3_]       msg_options_3;
   reg [`MSG_OPTIONS_4]        msg_options_4;

   reg sending;

   reg [`NOC_DATA_WIDTH-1:0] noc2encoder_req_data_f;

   reg 			     noc2encoder_req_val;
   reg [`NOC_DATA_WIDTH-1:0] noc2encoder_req_data;
   
   reg [`NOC_DATA_WIDTH-1:0] flit;
   reg [`NOC2_FLIT_STATE_WIDTH-1:0] flit_state;
   reg [`NOC2_FLIT_STATE_WIDTH-1:0] flit_state_next;

//Helper signals for reading responses from NOC


 wire                         splitter_io_go;
 wire                         splitter_io_load_go;
 wire                         splitter_io_store_go;

 wire                         splitter_io_msg_is_load;
 wire                         splitter_io_msg_is_store;
 wire                         splitter_io_msg_is_load_next;
 wire                         splitter_io_msg_is_store_next;

 wire [2:0]                   splitter_io_msg_state_next;
 wire [2:0]                   splitter_io_msg_type_mux_out;
 wire [2:0]                   splitter_io_msg_type_next;
 wire [`MSG_LENGTH_WIDTH-1:0] splitter_io_msg_counter_next;


 // Buffer registers for store response
 reg  [`NOC_DATA_WIDTH-1:0]          b_resp_buf_header0_f;
 reg  [`NOC_DATA_WIDTH-1:0]          b_resp_buf_header1_f;
 reg  [`NOC_DATA_WIDTH-1:0]          b_resp_buf_header2_f;
 reg  [1:0]                          b_resp_buf_status_f;

// Buffer registers for load response
 reg  [`NOC_DATA_WIDTH-1:0]          r_resp_buf_header0_f;
 reg  [`NOC_DATA_WIDTH-1:0]          r_resp_buf_header1_f;
 reg  [`NOC_DATA_WIDTH-1:0]          r_resp_buf_header2_f;
 reg  [`NOC_DATA_WIDTH-1:0]          r_resp_buf_data0_f;
 wire [1:0]                          r_resp_buf_status;
 reg  [1:0]                          r_data_resp_buf_status_f;

   //Helper Signals for sending responses

 wire                         axi_b_go;
 wire                         axi_r_go;


//Pass through signals
    
   assign axi_awready = splitter_bridge_rdy;
   assign axi_arready = splitter_bridge_rdy;
   assign axi_wready = splitter_bridge_rdy;
   assign bridge_splitter_rdy = axi_rready| axi_bready;
 
   
   
   
//==============================================================================
// Read Requests From AXI
//==============================================================================

   assign axi_store_request = axi_awvalid & axi_wvalid;

   assign axi_load_request = axi_arvalid;

   // What type of message is arriving currently?
   assign axi_io_msg_type_mux_out =
				   (!axi_store_request & !axi_load_request) ? MSG_TYPE_INVAL :
				   (axi_store_request) ? MSG_TYPE_STORE  :
				   (axi_load_request ) ? MSG_TYPE_LOAD :
                                   MSG_TYPE_INVAL;
 
always @ (*)
begin  
   

    dest_xpos = 0;
    dest_ypos = 0;
    dest_chipid = 0;
    dest_fbits = `NOC_FBITS_MEM;

    src_xpos = x_id;
    src_ypos = y_id;
    src_chipid = chip_id;
    src_fbits = `NOC_FBITS_L1;


    msg_mshrid = 0;

    msg_options_1 = 0;
    msg_options_2 = 0;
    msg_options_3 = 0;
    msg_options_4 = 0;

   case (axi_io_msg_type_mux_out)
     MSG_TYPE_STORE:
       begin
	  address = axi_awaddr;
	  msg_type = `MSG_TYPE_STORE_MEM;
          msg_length = 3; // 2 extra req headers + 1 data (64b)
	  sending = axi_store_request;
	  noc2encoder_req_val = axi_store_request;
	  noc2encoder_req_data = axi_wdata;
	  
       end
     MSG_TYPE_LOAD:
       begin
	 address = axi_araddr;
	 msg_type = `MSG_TYPE_LOAD_MEM;
         msg_length = 2; // 2 extra req headers
	 sending = axi_load_request;
	 noc2encoder_req_val = axi_load_request;
	 noc2encoder_req_data = 0;
	  
       end
     default:
       begin
	  address = 0;
	  msg_length = 0;
	  msg_type = 0;
	  sending = 0;
	  noc2encoder_req_val = 0;
	  noc2encoder_req_data = 0;
       end
   endcase // case (axi_io_msg_type_mux_out)

   bridge_splitter_val = sending;
   
end  

always @ (posedge clk)
begin
    if (rst)
      begin
       //Overkill on reset in order to debug high impedence signals
       noc2encoder_req_data_f <= 0;
       bridge_splitter_val <= 0;
       address <= {`C_M_AXI_LITE_ADDR_WIDTH{1'b0}};
       dest_xpos <= {`NOC_X_WIDTH{1'b0}};
       dest_ypos <= {`NOC_Y_WIDTH{1'b0}};
       dest_chipid <= {`NOC_CHIPID_WIDTH{1'b0}};
       dest_fbits  <= {`NOC_FBITS_WIDTH{1'b0}};
       src_xpos <= {`NOC_X_WIDTH{1'b0}};
       src_ypos <= {`NOC_Y_WIDTH{1'b0}};
       src_chipid <= {`NOC_CHIPID_WIDTH{1'b0}};
       src_fbits <={`NOC_FBITS_WIDTH{1'b0}};
       msg_length <= {`MSG_LENGTH_WIDTH{1'b0}};
       msg_type <= MSG_TYPE_INVAL;
       msg_mshrid <={`MSG_MSHRID_WIDTH{1'b0}};
       msg_options_1 <= 0;
       msg_options_2 <= 0;
       msg_options_3 <= 0;
       msg_options_4 <= 0;
       sending <= 1'b0;
       noc2encoder_req_val <= 1'b0;
       noc2encoder_req_data <= {`NOC_DATA_WIDTH{1'b0}};
    end
    else if (noc2encoder_req_val)
    begin
        noc2encoder_req_data_f <= noc2encoder_req_data;
    end
end

//==============================================================================
// Forward Requests to NOC
//==============================================================================

always @ (posedge clk)
begin
    if (rst)
    begin
       flit_state <= 0;
       flit_state_next <= 0;
       flit <= {`NOC_DATA_WIDTH{1'b0}};
       bridge_splitter_data <= {`NOC_DATA_WIDTH{1'b0}};
       
    end
    else
    begin
        flit_state <= flit_state_next;
    end
end

always @ (*)
begin

    // flit filling logic
    flit[`NOC_DATA_WIDTH-1:0] = 0; // so that the flit is not a latch
    if (flit_state == MSG_STATE_HEADER_0)
    begin
        flit[`MSG_DST_CHIPID] = dest_chipid;
        flit[`MSG_DST_X] = dest_xpos;
        flit[`MSG_DST_Y] = dest_ypos;
        flit[`MSG_DST_FBITS] = dest_fbits;
        flit[`MSG_LENGTH] = msg_length;
        flit[`MSG_TYPE] = msg_type;
        flit[`MSG_MSHRID] = msg_mshrid;
        flit[`MSG_OPTIONS_1] = msg_options_1;
    end
    else if (flit_state == MSG_STATE_HEADER_1)
    begin
        flit[`MSG_ADDR_] = address;
        flit[`MSG_OPTIONS_2_] = msg_options_2;
    end
    else if (flit_state == MSG_STATE_HEADER_2)
    begin
        flit[`MSG_SRC_CHIPID_] = src_chipid;
        flit[`MSG_SRC_X_] = src_xpos;
        flit[`MSG_SRC_Y_] = src_ypos;
        flit[`MSG_SRC_FBITS_] = src_fbits;
        flit[`MSG_OPTIONS_3_] = msg_options_3;
    end
    else if (flit_state == MSG_STATE_DATA)
    begin
        flit[`NOC_DATA_WIDTH-1:0] = noc2encoder_req_data_f;
    end
    bridge_splitter_data = flit;

end

always @ (*)
begin
    // next flit state logic
    flit_state_next = flit_state;
    if (sending)
    begin
        if (splitter_bridge_rdy)
        begin
            if (flit_state != msg_length)
                flit_state_next = flit_state + 1;
            else
                flit_state_next = MSG_STATE_HEADER_0;
        end
    end
    else
    begin
        flit_state_next = MSG_STATE_HEADER_0;
    end

end 

//==============================================================================
// Receive NOC Response and Create NVDLA Response
//==============================================================================


// What type of message is arriving currently?
    assign splitter_io_msg_type_mux_out =
        (!splitter_bridge_val) ? MSG_TYPE_INVAL :
        (splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_STORE_MEM_ACK ) ? MSG_TYPE_STORE  :
         (splitter_bridge_data[`MSG_TYPE] == `MSG_TYPE_LOAD_MEM_ACK   ) ? MSG_TYPE_LOAD :
                                                                            MSG_TYPE_INVAL;

   // What type of message will we be receiving?
    assign splitter_io_msg_type_next =
        (splitter_io_msg_state_next == MSG_STATE_INVAL   ) ? MSG_TYPE_INVAL               :
        (splitter_io_msg_state_next == MSG_STATE_HEADER_0) ? splitter_io_msg_type_mux_out :
                                                             splitter_io_msg_type_f       ;

    // Is the current message a load or a store?
    assign splitter_io_msg_is_load       = (splitter_io_msg_type_f    == MSG_TYPE_LOAD );
    assign splitter_io_msg_is_store      = (splitter_io_msg_type_f    == MSG_TYPE_STORE);

    // Is the incoming message a load or a store?
    assign splitter_io_msg_is_load_next  = (splitter_io_msg_type_next == MSG_TYPE_LOAD );
    assign splitter_io_msg_is_store_next = (splitter_io_msg_type_next == MSG_TYPE_STORE);

    // Should we read data from splitter_bridge_data?
    assign splitter_io_go = splitter_bridge_val && bridge_splitter_rdy;

   // Should we read a load request (store request)?
    assign splitter_io_load_go  = splitter_io_msg_is_load_next  && splitter_io_go && (r_resp_buf_status == BUF_STATUS_INCOMP);
    assign splitter_io_store_go = splitter_io_msg_is_store_next && splitter_io_go && (b_resp_buf_status_f   == BUF_STATUS_INCOMP);

   // Next-State logic for incoming message parser
    assign splitter_io_msg_state_next =
        (splitter_io_msg_state_f == MSG_STATE_INVAL   ) ? MSG_STATE_HEADER_0  :
        (splitter_io_msg_state_f == MSG_STATE_HEADER_0) ? MSG_STATE_HEADER_1  :
        (splitter_io_msg_state_f == MSG_STATE_HEADER_1) ? MSG_STATE_HEADER_2  :
        (splitter_io_msg_counter_f == 0               ) ? MSG_STATE_HEADER_0  :
        (splitter_io_msg_state_f == MSG_STATE_HEADER_2) ? MSG_STATE_DATA      :
        (splitter_io_msg_state_f == MSG_STATE_DATA    ) ? MSG_STATE_DATA      :
                                                          MSG_STATE_INVAL     ;


   // Next-value logic for message counter
    assign splitter_io_msg_counter_next =
        (splitter_io_msg_state_next == MSG_STATE_HEADER_0) ? splitter_bridge_data[`MSG_LENGTH] :
                                                             splitter_io_msg_counter_f - 1'b1  ;

   //--------------------------------------------------------------------------
   // Sequential Block for Splitter FSM State
   //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            splitter_io_msg_state_f   <= MSG_STATE_INVAL;
            splitter_io_msg_type_f    <= MSG_TYPE_INVAL;
            splitter_io_msg_counter_f <= {`MSG_LENGTH_WIDTH{1'b0}};
        end
        else begin
            splitter_io_msg_state_f   <= splitter_io_go ? splitter_io_msg_state_next
                                                        : splitter_io_msg_state_f;
            splitter_io_msg_type_f    <= splitter_io_go ? splitter_io_msg_type_next
                                                        : splitter_io_msg_type_f;
            splitter_io_msg_counter_f <= splitter_io_go ? splitter_io_msg_counter_next
                                                        : splitter_io_msg_counter_f;
        end
    end

    //--------------------------------------------------------------------------
    // Read headers and data for a store acknowledge (goes to b axi) 
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            b_resp_buf_header0_f <= {`NOC_DATA_WIDTH{1'b0}};
            b_resp_buf_header1_f <= {`NOC_DATA_WIDTH{1'b0}};
            b_resp_buf_header2_f <= {`NOC_DATA_WIDTH{1'b0}};
            b_resp_buf_status_f  <= BUF_STATUS_INCOMP;
        end
        else begin
            b_resp_buf_header0_f <= (splitter_io_store_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_0)) ? splitter_bridge_data :
                                                                                          b_resp_buf_header0_f  ;
            b_resp_buf_header1_f <= (splitter_io_store_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_1)) ? splitter_bridge_data :
                                                                                          b_resp_buf_header1_f  ;
            b_resp_buf_header2_f <= (splitter_io_store_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_2)) ? splitter_bridge_data :
                                                                                          b_resp_buf_header2_f  ;
            b_resp_buf_status_f  <= (splitter_io_store_go &
                                    (splitter_io_msg_state_next == MSG_STATE_HEADER_2)) ? BUF_STATUS_COMP      :
                                    (axi_b_go)                                        ? BUF_STATUS_INCOMP    :
                                                                                         b_resp_buf_status_f   ;
        end
    end

    //--------------------------------------------------------------------------
    // Read headers and data for a load acknowledge (read data to axi)
    //--------------------------------------------------------------------------
    wire    r_status_update;
    assign  r_status_update =   splitter_io_load_go &
                                (splitter_io_msg_state_next == MSG_STATE_DATA) &
                                (splitter_io_msg_counter_f == `MSG_LENGTH_WIDTH'd1);

    always @(posedge clk) begin
        if (rst) begin
            r_resp_buf_header0_f     <= {`NOC_DATA_WIDTH{1'b0}};
            r_resp_buf_header1_f     <= {`NOC_DATA_WIDTH{1'b0}};
            r_resp_buf_header2_f     <= {`NOC_DATA_WIDTH{1'b0}};
            r_resp_buf_data0_f       <= {`NOC_DATA_WIDTH{1'b0}};
            //r_addr_resp_buf_status_f <= BUF_STATUS_INCOMP;
            r_data_resp_buf_status_f <= BUF_STATUS_INCOMP;
        end
        else begin
            r_resp_buf_header0_f     <= (splitter_io_load_go &
                                        (splitter_io_msg_state_next == MSG_STATE_HEADER_0)) ? splitter_bridge_data    :
                                                                                              r_resp_buf_header0_f     ;
            r_resp_buf_header1_f     <= (splitter_io_load_go &
                                        (splitter_io_msg_state_next == MSG_STATE_HEADER_1)) ? splitter_bridge_data    :
                                                                                              r_resp_buf_header1_f     ;
            r_resp_buf_header2_f     <= (splitter_io_load_go &
                                        (splitter_io_msg_state_next == MSG_STATE_HEADER_2)) ? splitter_bridge_data    :
                                                                                              r_resp_buf_header2_f     ;
            r_resp_buf_data0_f       <= (splitter_io_load_go &
                                        (splitter_io_msg_state_next == MSG_STATE_DATA))     ? splitter_bridge_data    :
                                                                                              r_resp_buf_data0_f       ;
           // r_addr_resp_buf_status_f <= w_status_update                                      ? BUF_STATUS_COMP         :
           //                            m_axi_aw_go                                          ? BUF_STATUS_INCOMP       :
           //                                                                                   w_addr_req_buf_status_f ;
            r_data_resp_buf_status_f <= r_status_update                                      ? BUF_STATUS_COMP         :
                                        axi_r_go                                             ? BUF_STATUS_INCOMP       :
                                                                                              r_data_resp_buf_status_f ;
        end
    end

    // Calculate Store Request Status
    assign r_resp_buf_status =
        //((w_addr_req_buf_status_f == BUF_STATUS_INCOMP) &&
         (r_data_resp_buf_status_f == BUF_STATUS_INCOMP)     ? BUF_STATUS_INCOMP :
                                                               BUF_STATUS_COMP   ;

   
//==============================================================================
// Send Piton Response Back to AXILITE
//==============================================================================


   wire [`NOC_DATA_WIDTH-1:0]          paddings;
   reg [`C_M_AXI_LITE_DATA_WIDTH-1:0]  axi_rdata_tmp;

   assign paddings = 0;
   
   always @ (posedge clk)
     begin
	if (rst)
	  begin
	     axi_rdata_tmp <= {`C_M_AXI_LITE_DATA_WIDTH{1'b0}};
	     axi_rresp <= {`C_M_AXI_LITE_RESP_WIDTH{1'b0}};
	     axi_rvalid <= 1'b0;
	     axi_bresp <= {`C_M_AXI_LITE_RESP_WIDTH{1'b0}};
	     axi_bvalid <= 1'b0;
	  end
     end

    // Calculate Valid, Resp, Data signals
    always @ (*) begin
        // Write Response Channel
       axi_bvalid = (b_resp_buf_status_f == BUF_STATUS_COMP);
                // && (w_addr_resp_buf_status_f == BUF_STATUS_INCOMP);
       axi_bresp = 2'b00;

        // Read Response Channel
       axi_rvalid = (r_resp_buf_status == BUF_STATUS_COMP);
               // && (r_resp_buf_status_f == BUF_STATUS_INCOMP);
       axi_rresp = 2'b00;
       axi_rdata_tmp = r_resp_buf_data0_f[`C_M_AXI_LITE_DATA_WIDTH-1:0];
    end

    generate
        if (SWAP_ENDIANESS) begin
            initial begin : p_endianess_check
              if (!(`C_M_AXI_LITE_DATA_WIDTH == 64 && `NOC_DATA_WIDTH == 64))
                  $fatal(1,"swapped endianess only works for 64bit NOC and AXI bus");
            end
            // this only works for 64bits
            // the byte enables are already generated correctly and need not be swapped
            assign axi_rdata[56 +: 8] = axi_rdata_tmp[ 0 +: 8];
            assign axi_rdata[48 +: 8] = axi_rdata_tmp[ 8 +: 8];
            assign axi_rdata[40 +: 8] = axi_rdata_tmp[16 +: 8];
            assign axi_rdata[32 +: 8] = axi_rdata_tmp[24 +: 8];
            assign axi_rdata[24 +: 8] = axi_rdata_tmp[32 +: 8];
            assign axi_rdata[16 +: 8] = axi_rdata_tmp[40 +: 8];
            assign axi_rdata[ 8 +: 8] = axi_rdata_tmp[48 +: 8];
            assign axi_rdata[ 0 +: 8] = axi_rdata_tmp[56 +: 8];
        end else begin
            assign axi_rdata = axi_rdata_tmp;
        end
    endgenerate

    assign axi_r_go = axi_rvalid && axi_rready;
    assign axi_b_go  = axi_bvalid & axi_bready;

endmodule
