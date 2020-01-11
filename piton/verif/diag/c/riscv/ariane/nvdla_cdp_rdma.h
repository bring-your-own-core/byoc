#ifndef NVDLA_CDP_RDMA_HEADER
#define NVDLA_CDP_RDMA_HEADER
#define CDP_RDMAS_STATUS 0xe000
#define CDP_RDMAS_POINTER 0xe004
#define CDP_RDMAD_OP_ENABLE 0xe008
#define CDP_RDMAD_DATA_CUBE_WIDTH 0xe00c
#define CDP_RDMAD_DATA_CUBE_HEIGHT 0xe010
#define CDP_RDMAD_DATA_CUBE_CHANNEL 0xe014
#define CDP_RDMAD_SRC_BASE_ADDR_LOW 0xe018
#define CDP_RDMAD_SRC_BASE_ADDR_HIGH 0xe01c
#define CDP_RDMAD_SRC_LINE_STRIDE 0xe020
#define CDP_RDMAD_SRC_SURFACE_STRIDE 0xe024
#define CDP_RDMAD_SRC_DMA_CFG 0xe028
#define CDP_RDMAD_SRC_COMPRESSION_EN 0xe02c
#define CDP_RDMAD_OPERATION_MODE 0xe030
#define CDP_RDMAD_DATA_FORMAT 0xe034
#define CDP_RDMAD_PERF_ENABLE 0xe038
#define CDP_RDMAD_PERF_READ_STALL 0xe03c
#endif
