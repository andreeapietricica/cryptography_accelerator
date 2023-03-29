

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
			cJMP(9000);			NOP; // prim_key_expansion								// line 10
			cJMP(1050);			NOP; // prim_aes_ecb								    // line 11
			cJMP(1100);			NOP; // prim_aes_ctr								    // line 12
			cJMP(1102);			NOP; // prim_aes_ctr_xor						        // line 13
			cJMP(1200);			NOP; // prim_init_encr_index						    // line 14
			`include "10_examples.sv"
					
			cHALT;			NOP;
			
			
			
LB(9);		// Change the test name to 128_ctr or 192_ctr or 256_ctr in parameters_simulation
// for aes_encryption_ecb_mode
   // ------------------------------------------------------------------	ecb 16bl	
//			cPRUN(0);		NOP;	// pload/halt
//			cPRUN(1);		NOP;	// initial stuff
//			cPRUN(2);		NOP;	// prim_set_addr_regs
					
//			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
//			cPRUN(5);		NOP;	// prim_wait_matrices	
			
//			cPRUN(10);		NOP;	// prim_key_expansion
 
//			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
//			cPRUN(11);		NOP;	// prim_aes_ecb
//			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
//			cPRUN(4);		NOP;	// prim_set_interrupt
			
			

// ------------------------------------------------------------------	ecb 32bl		

//			cPRUN(0);		NOP;	// pload/halt
//			cPRUN(1);		NOP;	// initial stuff
//			cPRUN(2);		NOP;	// prim_set_addr_regs
			
//			cPRUN(10);		NOP;	// prim_key_expansion

//			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
//			cPRUN(5);		NOP;	// prim_wait_matrices	
//			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
//            cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			
//			cPRUN(3);		NOP;	// res ready             
//			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
//			cPRUN(8);		NOP;	// prim_cycle_counter_stop
//			cPRUN(4);		NOP;	// prim_set_interrupt
			
//// ------------------------------------------------------------------	ecb 64bl		

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
            cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(11);		NOP;	// prim_aes_ecb

			
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	

			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	

			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 4 while block 3 is encrypted
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	

			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);

		
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt

// ------------------------------------------------------------------	ecb 128bl		

//			cPRUN(0);		NOP;	// pload/halt
//			cPRUN(1);		NOP;	// initial stuff
//			cPRUN(2);		NOP;	// prim_set_addr_regs
			
//			cPRUN(10);		NOP;	// prim_key_expansion

//			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
//			cPRUN(5);		NOP;	// prim_wait_matrices	
//			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
//            cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(11);		NOP;	// prim_aes_ecb

			
//			cPRUN(3);		NOP;	// res ready             
//			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
//			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
//			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 
			
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);
//			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 4 
			
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
//			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);
//			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 6 
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
//			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 7 
			
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);
//			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 8 
			
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);

	
//			cPRUN(8);		NOP;	// prim_cycle_counter_stop
//			cPRUN(4);		NOP;	// prim_set_interrupt
	
		//var 3 ----------------------------------------------------------------------------
//	        cPRUN(0);		NOP;	// pload/halt
//			cPRUN(1);		NOP;	// initial stuff
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
//			cPRUN(5);		NOP;	// prim_wait_matrices	
			
//			cPRUN(10);		NOP;	// prim_key_expansion

//			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
//			cPRUN(2);		NOP;	// prim_set_addr_regs
//			cPRUN(11);		NOP;	// prim_aes_ecb	
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
						
//			cPRUN(2);		NOP;	// prim_set_addr_regs
				
//			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);
//			cPRUN(5);		NOP;	// prim_wait_matrices	

//			cPRUN(11);		NOP;	// prim_aes_ecb	
//			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);	
			
//			cPRUN(4);		NOP;	// prim_set_interrupt		
	
	// var 5------------------------------------------------------------------------------		
// * // for aes_encryption_ctr_mode		
//    LB(9);		// Change the test name to 128_ctr or 192_ctr or 256_ctr in parameters_simulation
//`define EVEN_BLOCK	1		
//			cPRUN(0);		NOP;	// pload/halt
//			cPRUN(1);		NOP;	// initial stuff
//			cPRUN(2);		NOP;	// prim_set_addr_regs
			
//			SEND_MATRIX_ARRAY(400 + 512, 16, `ARRAY_NR_CELLS);
//			cPRUN(5);		NOP;	// prim_wait_matrices	
			
//			cPRUN(10);		NOP;	// prim_key_expansion
//			cPRUN(14);		NOP;	// prim_init_encr_index

//			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
//			cPRUN(12);		NOP;	// prim_aes_ctr
//			cPRUN(13);		NOP;	// prim_aes_ctr_xor
//			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
//			cPRUN(3);		NOP;	// res ready
//			GET_MATRIX_ARRAY(300 + 512, 16, `ARRAY_NR_CELLS, 1);	
			
//			cPRUN(4);		NOP;	// prim_set_interrupt


//*/



    
    