
`define SIMULATION_FUNCTION_PERFORMED "aes_encryption"

`define SIMULATION_TEST_NAME "128_ecb_16cells_32bl"
//`define SIMULATION_TEST_NAME "256_ctr_64cells_64bl"
//`define SIMULATION_TEST_NAME "128_key_expansion"

`define AES128   (1)
//`define AES192   (1)
//`define AES256   (1)

//------TESTS-------- (should be completed as follows:
// - update SIMULATION_TEST_NAME with the corresponding name, depending on the aes version and number of cells and blocks
// - change SIMULATION_NR_LINES_DATA_OUT_READ to 16, 32, 64, 128, 256, 512 or 1024 using the logic: (NumBlocks/NumCells) * 16
// - change ARRAY_NR_CELLS from PARAMETERS.vh to the desired number of cells

//ECB
`define AES_ECB_16CELLS_16BL (1)
//`define AES_ECB_16CELLS_32BL (1)
//`define AES_ECB_16CELLS_64BL (1)
//`define AES_ECB_16CELLS_128BL (1)
//`define AES_ECB_16CELLS_256BL (1)
//`define AES_ECB_16CELLS_512BL (1)
//`define AES_ECB_16CELLS_1024BL (1)

//`define AES_ECB_32CELLS_32BL    (1)
//`define AES_ECB_32CELLS_64BL   (1)
//`define AES_ECB_32CELLS_128BL   (1)
//`define AES_ECB_32CELLS_256BL   (1)
//`define AES_ECB_32CELLS_512BL   (1)
//`define AES_ECB_32CELLS_1024BL   (1)

//`define AES_ECB_64CELLS_64BL (1)
//`define AES_ECB_64CELLS_128BL (1)
//`define AES_ECB_64CELLS_256BL (1)
//`define AES_ECB_64CELLS_512BL (1)
//`define AES_ECB_64CELLS_1024BL (1)

//`define AES_ECB_128CELLS_128BL (1)
//`define AES_ECB_128CELLS_256BL (1)
//`define AES_ECB_128CELLS_512BL (1)
//`define AES_ECB_128CELLS_1024BL (1)


//CTR
//`define AES_CTR_16CELLS_16BL   (1)
//`define AES_CTR_16CELLS_32BL   (1)
//`define AES_CTR_16CELLS_64BL   (1)
//`define AES_CTR_16CELLS_128BL   (1)
//`define AES_CTR_16CELLS_256BL   (1)
//`define AES_CTR_16CELLS_512BL   (1)
//`define AES_CTR_16CELLS_1024BL   (1)

//`define AES_CTR_32CELLS_32BL   (1)
//`define AES_CTR_32CELLS_64BL   (1)
//`define AES_CTR_32CELLS_128BL   (1)
//`define AES_CTR_32CELLS_256BL   (1)
//`define AES_CTR_32CELLS_512BL   (1)
//`define AES_CTR_32CELLS_1024BL   (1)

//`define AES_CTR_64CELLS_64BL   (1)
//`define AES_CTR_64CELLS_128BL   (1)
//`define AES_CTR_64CELLS_256BL   (1)
//`define AES_CTR_64CELLS_512BL   (1)
//`define AES_CTR_64CELLS_1024BL   (1)

//`define AES_CTR_128CELLS_128BL   (1)
//`define AES_CTR_128CELLS_256BL   (1)
//`define AES_CTR_128CELLS_512BL   (1)
//`define AES_CTR_128CELLS_1024BL   (1)

//`define AES_KEY_EXP    (1)