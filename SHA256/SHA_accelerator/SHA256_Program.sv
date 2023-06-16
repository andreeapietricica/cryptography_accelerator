

/***************************************************************************************
THE PROGRAM: normal testing from example file 
***************************************************************************************/
// THE PROGRAM USED TO INITIALIZE THE ACCELERATOR			
//*


	LB(0);			
			cPLOAD(0);			NOP;			// line not counted ( not saved in controller mem)
			cHALT;				NOP;			// line 0
			
	LB(1);
			cJMP(10_350);		NOP; // prim_initialize									// line 1
			cJMP(10_300);		NOP; // prim_set_addr_regs								// line 2
			cJMP(10_310);		NOP; // prim_set_res_ready								// line 3
			cJMP(10_320);		NOP; // prim_set_interrupt								// line 4
			cJMP(10_330);		NOP; // prim_wait_matrices								// line 5
			cJMP(10_360);		NOP; // prim_cycle_counter_start_W_halt					// line 6
			cJMP(10_361);		NOP; // prim_cycle_counter_start_WO_halt				// line 7
			cJMP(10_362);		NOP; // prim_cycle_counter_stop							// line 8
			cJMP(10_363);		NOP; // prim_cycle_counter_reset						// line 9
			cJMP(9000);			NOP; // prim_init_values								// line 10
			cJMP(9003);			NOP; // prim_init_values								// line 11
			`include "10_examples.sv"
					
			cHALT;			NOP;
			
			
			
LB(9);		// Change the test name to 128_ctr or 192_ctr or 256_ctr in parameters_simulation

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 16 blocks, 16 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_16_BLOCKS_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
		cPRUN(11);		NOP;	// sha compression
		cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_16_BLOCKS_16_CELLS			

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 32 blocks, 16 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_32_BLOCKS_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_32_BLOCKS_16_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 64 blocks, 16 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_64_BLOCKS_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_64_BLOCKS_16_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 128 blocks, 16 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_16_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 256 blocks, 16 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_16_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 512 blocks, 16 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_16_CELLS

// ------------------------------------------------------------------	sha 256 1 block fixed message - 1024 blocks, 16 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_16_CELLS


// ------------------------------------------------------------------	sha 256 1 block fixed message - 32 blocks, 32 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_32_BLOCKS_32_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
		cPRUN(11);		NOP;	// sha compression
		cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_32_BLOCKS_32_CELLS			

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 64 blocks, 32 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_64_BLOCKS_32_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_64_BLOCKS_32_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 128 blocks, 32 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_32_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_32_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 256 blocks, 32 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_32_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_32_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 512 blocks, 32 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_32_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_32_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 1024 blocks, 32 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_32_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_32_CELLS


// ------------------------------------------------------------------	sha 256 1 block fixed message - 64 blocks, 64 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_64_BLOCKS_64_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
		cPRUN(11);		NOP;	// sha compression
		cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_64_BLOCKS_64_CELLS			

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 128 blocks, 64 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_64_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_64_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 256 blocks, 64 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_64_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_64_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 512 blocks, 64 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_64_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_64_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 1024 blocks, 64 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_64_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_64_CELLS

// ------------------------------------------------------------------	sha 256 1 block fixed message - 128 blocks, 128 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_128_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
		cPRUN(11);		NOP;	// sha compression
		cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_128_BLOCKS_128_CELLS			

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 256 blocks, 128 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_128_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_1_BLOCK_FIXED_MESG_256_BLOCKS_128_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 512 blocks, 128 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_128_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_512_BLOCKS_128_CELLS

 // ------------------------------------------------------------------	sha 256 1 block fixed message - 1024 blocks, 128 cells	
`ifdef  SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_128_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_1_BLOCK_FIXED_MESG_1024_BLOCKS_128_CELLS

// ------------------------------------------------------------------	sha 256 2 block fixed message - 16 msg, 16 cells	
`ifdef  SHA256_2_BLOCK_FIXED_MESG_16_MESG_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_2_BLOCK_FIXED_MESG_16_MESG_16_CELLS

// ------------------------------------------------------------------	sha 256 4 block fixed message - 16 msg, 16 cells	
`ifdef  SHA256_4_BLOCK_FIXED_MESG_16_MESG_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_4_BLOCK_FIXED_MESG_16_MESG_16_CELLS


// ------------------------------------------------------------------	sha 256 8 block fixed message - 16 msg, 16 cells	
`ifdef  SHA256_8_BLOCK_FIXED_MESG_16_MESG_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
        cPRUN(3);		NOP;	// res ready
        
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // SHA256_8_BLOCK_FIXED_MESG_16_MESG_16_CELLS

// ------------------------------------------------------------------	sha 256 16 block fixed message - 16 mesg, 16 cells	
`ifdef  SHA256_16_BLOCK_FIXED_MESG_16_MESG_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_16_BLOCK_FIXED_MESG_16_MESG_16_CELLS

// ------------------------------------------------------------------	sha 256 32 block fixed message - 16 mesg, 16 cells	
`ifdef  SHA256_32_BLOCK_FIXED_MESG_16_MESG_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
				
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
				
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_32_BLOCK_FIXED_MESG_16_MESG_16_CELLS


// ------------------------------------------------------------------	sha 256 64 block fixed message - 16 msgs, 16 cells	
`ifdef  SHA256_64_BLOCK_FIXED_MESG_16_MESG_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_64_BLOCK_FIXED_MESG_16_MESG_16_CELLS

// ------------------------------------------------------------------	sha 256 128 block fixed message - 16 msgs, 16 cells	
`ifdef  SHA256_128_BLOCK_FIXED_MESG_16_MESG_16_CELLS

        cPRUN(0);		NOP;	// pload/halt
        cPRUN(1);		NOP;	// initial stuff
        cPRUN(2);		NOP;	// prim_set_addr_regs
        
         // Initialize values (hash values and round constants)
        cPRUN(10);		NOP;	// prim_init_values
        
        cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
        
        SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		
		cPRUN(3);		NOP;	// res ready
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression

	    SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
	    SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
	    cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		SEND_MATRIX_ARRAY(399, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
		
		
		SEND_MATRIX_ARRAY(799, 18, `ARRAY_NR_CELLS);
		cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(200, 8, `ARRAY_NR_CELLS, 1);
		
		
        cPRUN(2);		NOP;	// prim_set_addr_regs
		cPRUN(5);		NOP;	// prim_wait_matrices
		cPRUN(11);		NOP;	// sha compression
				
        cPRUN(3);		NOP;	// res ready
		GET_MATRIX_ARRAY(600, 8, `ARRAY_NR_CELLS, 1);	
        
        cPRUN(8);		NOP;	// prim_cycle_counter_stop
        cPRUN(4);		NOP;	// prim_set_interrupt
		
`endif  // SHA256_128_BLOCK_FIXED_MESG_16_MESG_16_CELLS