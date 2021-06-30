set obj [get_filesets sources_1]
set BLACKPARROT_RTL_IMPL_FILES [list \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/include/bp_top_pkg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_launch_sync_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_ptr_gray.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_dma.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_miss.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf_queue.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_in.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_large.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_pseudo_large.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1rw_large.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_flow_counter.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_one_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_dynamic.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_passthrough.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_2_to_2.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_dynamic.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_passthrough.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_shift_reg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_two_fifo.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_replacement.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_tag_array.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync_synth.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_cin.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_ripple_carry.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_arb_fixed.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_concentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_buf.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_buf_ctrl.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_circular_ptr.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_concentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_down.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_overflow_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_cycle_counter.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode_with_v.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_chain.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en_bypass.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en_bypass.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_set_clear.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_edge_detect.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_encode_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_expand_bitmask.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_hash_bank.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_hash_bank_reverse.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lfsr.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_decode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_encode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_bitwise.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_butterfly.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_one_hot.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_segmented.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_muxi2_gatestack.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nor2.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nor3.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nand.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce_segmented.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_left.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_right.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_round_robin_arb.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_scan.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_strobe.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_swap.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_thermometer_count.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_transpose.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_unconcentrate_static.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_xnor.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_mesh_stitch.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_repeater_node.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_in.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_in.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_out.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_decoder_dor.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_input_control.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_output_control.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/addRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/compareRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/divSqrtRecFN_small.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/fNToRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/HardFloat_primitives.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/HardFloat_consts.vi" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/HardFloat_rawFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/iNToRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/isSigNaNRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/mulAddRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/mulRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/recFNToFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/recFNToIN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/recFNToRecFN.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/RISCV/HardFloat_specialize.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/RISCV/HardFloat_specialize.vi" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_fifo_1r1w_rolly.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_bus_pack.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_pma.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_mmu.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_tlb.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_calculator_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_csr.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_int.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_long.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_mem.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_sys.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_aux.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_ctl.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_fma.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_fp_to_rec.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_ptw.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_rec_to_fp.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_cmd_queue.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_detector.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_director.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_instr_decoder.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_issue_queue.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_regfile.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_scheduler.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_scoreboard.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_dcache/bp_be_dcache.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_dcache/bp_be_dcache_decoder.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_dcache/bp_be_dcache_wbuf.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_bht.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_btb.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_icache.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_instr_scan.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_pc_gen.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_req.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_cmd.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cce_to_cache.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_alu.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_arbitrate.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_branch.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_lru_extract.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_segment.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_tag_checker.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_fsm.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_gad.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_decode.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_predecode.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_ram.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_stall.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/test/common/bp_cce_mmio_cfg_loader.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_msg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_pending_bits.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_pma.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_reg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_spec_bits.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_src_sel.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_io_cce.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_wrapper.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_uce.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_pce.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_addr_to_cce_id.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_id_to_cord.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_bidir.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_client.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_master.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cord_to_id.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_lce_id_to_cord.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_cmd.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_req.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_resp.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_cmd.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_resp.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_lite_to_stream.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_stream_to_lite.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_lite_to_burst.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_burst_to_lite.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_loopback.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_nd_socket.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_vdp.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_tile.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_tile_node.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_complex.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_vdp.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_tile.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_tile_node.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_complex.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cfg.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_minimal.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_complex.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_clint_slice.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_l2e_tile.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_l2e_tile_node.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_complex.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_link_to_lce.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile_node.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_mem_complex.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_multicore.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_unicore.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile_node.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_piton_top.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_async_noc_link.sv" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_cache_dma_to_wormhole.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_dff_reset_half.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_wormhole_to_cache_dma_fanout.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_links.vh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_defines.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_instr_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_core_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_core_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_log_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_csr_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_bedrock_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_bedrock_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cache_engine_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cache_engine_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cfg_bus_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cfg_bus_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_addr_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_addr_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_ctl_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_pce_l15_if.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_cce_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_cce_inst_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_cce_inst_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_wormhole_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/include/bp_top_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_decompress.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache_defines.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache_pkgdef.svh" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_pkg.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_reverse.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_rx.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_tx.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_clkgate_optional.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dlatch.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v" \
    "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v" \
]
add_files -norecurse -fileset $obj $BLACKPARROT_RTL_IMPL_FILES

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_links.vh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_defines.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj
set_property -name "is_global_include" -value "1" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_pkg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_pkg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_pkg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_pkg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/include/bp_top_pkg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_launch_sync_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_async/bsg_async_ptr_gray.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_dma.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_miss.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_sbuf_queue.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_in.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_channel_tunnel_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_1_to_n_tagged.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_large.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_pseudo_large.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_1rw_large.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_fifo_tracker.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_flow_counter.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_one_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_dynamic.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_parallel_in_serial_out_passthrough.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_1_to_n.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_2_to_2.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_round_robin_n_to_1.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_dynamic.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_full.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_serial_in_parallel_out_passthrough.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_shift_reg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_dataflow/bsg_two_fifo.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_replacement.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_cam_1r1w_tag_array.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1r1w_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

#set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v"
#
#set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
#set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

#set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_bit_synth.v"
#
#set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
#set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_1rw_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_2r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_mem/bsg_mem_3r1w_sync_synth.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_cin.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_adder_ripple_carry.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_arb_fixed.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_concentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_buf.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_buf_ctrl.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_circular_ptr.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_concentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_clear_up_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_down.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_set_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_overflow_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_counter_up_down_variable.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_crossbar_o_by_i.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_cycle_counter.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_decode_with_v.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_chain.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_en_bypass.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en_bypass.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_en.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dff_reset_set_clear.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_edge_detect.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_encode_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_expand_bitmask.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_hash_bank.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_hash_bank_reverse.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_idiv_iterative_controller.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lfsr.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_decode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_lru_pseudo_tree_encode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_bitwise.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_butterfly.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_one_hot.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_mux_segmented.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_muxi2_gatestack.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nor2.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nand.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_nor3.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_priority_encode_one_hot_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_reduce_segmented.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_left.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_rotate_right.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_round_robin_arb.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_scan.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_strobe.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_swap.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_transpose.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_thermometer_count.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_unconcentrate_static.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_xnor.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_mesh_stitch.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_repeater_node.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_in.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_concentrator_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_in.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_adapter_out.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_decoder_dor.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_input_control.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_output_control.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/addRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/compareRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/divSqrtRecFN_small.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/fNToRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/HardFloat_primitives.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/HardFloat_consts.vi"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/HardFloat_rawFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/iNToRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/isSigNaNRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/mulAddRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/mulRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/recFNToFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/recFNToIN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/recFNToRecFN.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/RISCV/HardFloat_specialize.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/HardFloat/source/RISCV/HardFloat_specialize.vi"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_aviary_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_instr_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_core_if.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_core_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_log_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_rv64_csr_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_bedrock_if.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_bedrock_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cache_engine_if.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cache_engine_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cfg_bus_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_cfg_bus_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_addr_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/include/bp_common_addr_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_ctl_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_dcache_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/include/bp_be_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/include/bp_top_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_top.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_calculator_top.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_csr.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_fp_to_rec.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_rec_to_fp.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_int.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_aux.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_ctl.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_fma.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_long.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_mem.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_pipe_sys.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_calculator/bp_be_ptw.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_cmd_queue.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_detector.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_director.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_instr_decoder.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_issue_queue.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_regfile.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_scheduler.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_checker/bp_be_scoreboard.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_dcache/bp_be_dcache.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_dcache/bp_be_dcache_decoder.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_be/src/v/bp_be_dcache/bp_be_dcache_wbuf.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_pce_l15_if.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_cce_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_cce_inst_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_cce_inst_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/include/bp_me_wormhole_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_noc_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_noc/bsg_wormhole_router_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_alu.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_arbitrate.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_branch.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_lru_extract.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_segment.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_dir_tag_checker.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_fsm.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_gad.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_decode.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_predecode.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_ram.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_inst_stall.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/test/common/bp_cce_mmio_cfg_loader.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_msg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_pending_bits.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_pma.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_reg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_spec_bits.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_src_sel.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_io_cce.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_cce_wrapper.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_decompress.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache_defines.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/include/bp_fe_icache_pkgdef.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "Verilog Header" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_bht.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_btb.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_icache.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_instr_scan.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_pc_gen.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_fe/src/v/bp_fe_top.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_req.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/lce/bp_lce_cmd.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_uce.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cce/bp_pce.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/cache/bp_me_cce_to_cache.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_addr_to_cce_id.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_id_to_cord.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_bidir.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_client.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cce_to_mem_link_master.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_cord_to_id.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_lce_id_to_cord.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_cmd.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_req.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_lce_resp.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_cmd.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_me_wormhole_packet_encode_mem_resp.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_lite_to_stream.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_stream_to_lite.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_lite_to_burst.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_me/src/v/wormhole/bp_burst_to_lite.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_loopback.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_nd_socket.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_vdp.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_tile.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_tile_node.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cacc_complex.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_vdp.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_tile.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_tile_node.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_sacc_complex.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_cfg.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_minimal.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_core_complex.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_clint_slice.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_l2e_tile.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_l2e_tile_node.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_complex.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_link_to_lce.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_io_tile_node.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_pkg.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_mem_complex.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_multicore.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_unicore.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_tile_node.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_top/src/v/bp_piton_top.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_fifo_1r1w_rolly.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_bus_pack.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_mmu.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_pma.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bp_tlb.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_array_reverse.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_async_noc_link.sv"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_cache_dma_to_wormhole.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_dff_reset_half.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/bp_common/src/v/bsg_wormhole_to_cache_dma_fanout.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_rx.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_cache/bsg_cache_to_axi_tx.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_clkgate_optional.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "${DV_ROOT}/design/chip/tile/blackparrot/external/basejump_stl/bsg_misc/bsg_dlatch.v"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

