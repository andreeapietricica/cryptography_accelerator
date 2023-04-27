

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
   
`ifdef AES_ECB_16CELLS_16BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(11);		NOP;	// prim_aes_ecb
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_ECB_16CELLS_16BL	

 // ------------------------------------------------------------------	ecb 32bl		
`ifdef AES_ECB_16CELLS_32BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion
	
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  //AES_ECB_16CELLS_32BL

// ------------------------------------------------------------------	ecb 64bl		

`ifdef AES_ECB_16CELLS_64BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);

			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt

`endif // AES_ECB_16CELLS_64BL

// ------------------------------------------------------------------	ecb 128bl		

`ifdef AES_ECB_16CELLS_128BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 8


			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
`endif  //AES_ECB_16CELLS_128BL

// ------------------------------------------------------------------	ecb 256bl	

`ifdef AES_ECB_16CELLS_256BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 10 while block 9 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 9
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 16



			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
`endif  //AES_ECB_16CELLS_256BL
		
		
// ------------------------------------------------------------------	ecb 512bl	

`ifdef AES_ECB_16CELLS_512BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 10 while block 9 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 9
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 17 while block 16 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 16
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 18 while block 17 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 17
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 19 while block 18 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 18
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 20 while block 19 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 19
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 21 while block 20is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 20
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 22 while block 21 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 21
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 23 while block 22 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 22
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 24 while block 23 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 23
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 25 while block 24 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 24
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 26 while block 25 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 25
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 27 while block 26 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 26
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 28 while block 27 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 27
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 29 while block 28 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 28
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 30 while block 29 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 29
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 31 while block 30 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 30
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 32 while block 31 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 31
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 32


			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  //AES_ECB_16CELLS_512BL

// ------------------------------------------------------------------	ecb 1024bl	

`ifdef AES_ECB_16CELLS_1024BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 10 while block 9 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 9
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 17 while block 16 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 16
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 18 while block 17 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 17
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 19 while block 18 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 18
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 20 while block 19 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 19
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 21 while block 20is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 20
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 22 while block 21 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 21
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 23 while block 22 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 22
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 24 while block 23 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 23
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 25 while block 24 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 24
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 26 while block 25 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 25
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 27 while block 26 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 26
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 28 while block 27 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 27
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 29 while block 28 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 28
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 30 while block 29 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 29
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 31 while block 30 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 30
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 32 while block 31 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 31
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 33 while block 32 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 32
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 34 while block 33 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 33
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 35 while block 34 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 34
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 36 while block 35 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 35
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 37 while block 36 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 36
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 38 while block 37 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 37
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 39 while block 38 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 38
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 40 while block 39 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 39
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 41 while block 40 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 40
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 42 while block 41 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 41
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 43 while block 42 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 42
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 44 while block 43 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 43
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 45 while block 44 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 44
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 46 while block 45 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 45
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 47 while block 46 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 46
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 48 while block 47 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 47
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 49 while block 48 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 48
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 50 while block 49 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 49
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 51 while block 50 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 50
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 52 while block 51 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 51
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 53 while block 52 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 52
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 54 while block 53 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 53
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 55 while block 54 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 54
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 56 while block 55 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 55
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 57 while block 56 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 56
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 58 while block 57 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 57
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 59 while block 58 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 58
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 60 while block 59 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 59
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 61 while block 60 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 60
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 62 while block 61 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 61
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 63 while block 62 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 62
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 64 while block 63 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 63
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 64


			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  //AES_ECB_16CELLS_1024BL


   // ------------------------------------------------------------------	ecb 32cells 32bl	
   
`ifdef AES_ECB_32CELLS_32BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(11);		NOP;	// prim_aes_ecb
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_ECB_32CELLS_32BL	

 // ------------------------------------------------------------------	ecb 32cells 64bl
`ifdef AES_ECB_32CELLS_64BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion
	
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  //AES_ECB_32CELLS_64BL

// ------------------------------------------------------------------	ecb 32cells 128bl
`ifdef AES_ECB_32CELLS_128BL

						cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 1 is encrypted
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);

			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  //AES_ECB_32CELLS_128BL

// ------------------------------------------------------------------	ecb 32cells 256bl
`ifdef AES_ECB_32CELLS_256BL

            cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 8


			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt

`endif  //AES_ECB_32CELLS_256BL

// ------------------------------------------------------------------	ecb 32cells 512bl
`ifdef AES_ECB_32CELLS_512BL
            cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 10 while block 9 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 9
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 16



			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			

`endif  //AES_ECB_32CELLS_512BL

// ---------------------------------------------------------------------------------ecb 32 cells 1024 bl

`ifdef AES_ECB_32CELLS_1024BL
            cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 10 while block 9 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 9
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 17 while block 16 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 16
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 18 while block 17 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 17
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 19 while block 18 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 18
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 20 while block 19 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 19
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 21 while block 20is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 20
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 22 while block 21 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 21
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 23 while block 22 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 22
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 24 while block 23 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 23
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 25 while block 24 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 24
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 26 while block 25 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 25
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 27 while block 26 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 26
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 28 while block 27 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 27
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 29 while block 28 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 28
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 30 while block 29 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 29
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 31 while block 30 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 30
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 32 while block 31 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 31
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 32


			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  // AES_ECB_32CELLS_1024BL

  // ------------------------------------------------------------------	ecb 64 cells 64bl	
   
`ifdef AES_ECB_64CELLS_64BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(11);		NOP;	// prim_aes_ecb
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_ECB_64CELLS_64BL	

 // ------------------------------------------------------------------	ecb 64 cells 128bl		
`ifdef AES_ECB_64CELLS_128BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion
	
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  //AES_ECB_64CELLS_128BL

// ------------------------------------------------------------------	ecb 64 cells 256bl		

`ifdef AES_ECB_64CELLS_256BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);

			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt

`endif // AES_ECB_64CELLS_256BL

// ------------------------------------------------------------------	ecb 64 cells 512 bl		

`ifdef AES_ECB_64CELLS_512BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 8


			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
`endif  //AES_ECB_64CELLS_512BL

// ------------------------------------------------------------------	ecb 64cells 1024bl
`ifdef AES_ECB_64CELLS_1024BL
            cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);   // send block 10 while block 9 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1); // get result from block 9
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 16



			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			

`endif  //AES_ECB_64CELLS_1024BL

 // ------------------------------------------------------------------	ecb 128 cells 128 BL	
   
`ifdef AES_ECB_128CELLS_128BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(11);		NOP;	// prim_aes_ecb
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_ECB_128CELLS_128BL	

 // ------------------------------------------------------------------	ecb 128 cells 256 BL		
`ifdef AES_ECB_128CELLS_256BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion
	
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb

			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif  //AES_ECB_128CELLS_256BL

// ------------------------------------------------------------------	ecb 128 cells 512 BL	

`ifdef AES_ECB_128CELLS_512BL

			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);

			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt

`endif // AES_ECB_128CELLS_512BL

// ------------------------------------------------------------------	ecb 128 cells 1024 BL		

`ifdef AES_ECB_128CELLS_1024BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			cPRUN(10);		NOP;	// prim_key_expansion

			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 1
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
            cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
						
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);   // send block 3 while block 2 is encrypted		
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1); // get result from block 2
            
            cPRUN(2);		NOP;	// prim_set_addr_regs            
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
				
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			SEND_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted		
			cPRUN(3);		NOP;	// res ready             
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(11);		NOP;	// prim_aes_ecb
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);    // get result from block 8


			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			cPRUN(4);		NOP;	// prim_set_interrupt
`endif  //AES_ECB_128CELLS_1024BL


// CTR--------------------------------------------------------------------------------------------

 // ------------------------------------------------------------------	ctr 16 cells 16bl	
   
`ifdef AES_CTR_16CELLS_16BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_16CELLS_16BL	


  // ------------------------------------------------------------------	ctr 16 cells 32bl	

`ifdef AES_CTR_16CELLS_32BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_16CELLS_32BL	

  // ------------------------------------------------------------------	ctr 16 cells 64bl	

`ifdef AES_CTR_16CELLS_64BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_16CELLS_64BL	


 // ------------------------------------------------------------------	ctr 16 cells 128bl	

`ifdef AES_CTR_16CELLS_128BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_16CELLS_128BL	

 // ------------------------------------------------------------------	ctr 16 cells 256bl	

`ifdef AES_CTR_16CELLS_256BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 10 while block 9 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 9
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
            cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);   // get result from block 16
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_16CELLS_256BL		

// ------------------------------------------------------------------	ctr 16 cells 512bl	
   
`ifdef AES_CTR_16CELLS_512BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 10 while block 9 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 9
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 17 while block 16 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 16
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 18 while block 17 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 17
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 19 while block 18 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 18
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 20 while block 19 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 19
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 21 while block 20 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 20
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 22 while block 21 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 21
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 23 while block 22 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 22
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 24 while block 23 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 23
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 25 while block 24 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 24
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 26 while block 25 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 25
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 27 while block 26 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 26
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 28 while block 27 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 27
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 29 while block 28 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 28
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 30 while block 29 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 29
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 31 while block 30 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 30
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 32 while block 31 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 31
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);   // get result from block 32
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_16CELLS_512BL	


// ------------------------------------------------------------------	ctr 16 cells 1024bl	
   
`ifdef AES_CTR_16CELLS_1024BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 10 while block 9 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 9
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 17 while block 16 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 16
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 18 while block 17 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 17
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 19 while block 18 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 18
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 20 while block 19 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 19
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 21 while block 20 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 20
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 22 while block 21 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 21
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 23 while block 22 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 22
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 24 while block 23 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 23
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 25 while block 24 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 24
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 26 while block 25 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 225
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 27 while block 26 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 26
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 28 while block 27 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 27
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 29 while block 28 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 28
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 30 while block 29 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 29
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 31 while block 30 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 30
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 32 while block 31 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 31
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 33 while block 32 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 32
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 34 while block 33 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 33
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 35 while block 34 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 34
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 36 while block 35 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 35
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 37 while block 36 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 36
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 38 while block 37 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 37
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 39 while block 38 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 38
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 40 while block 39 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 39
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 41 while block 40 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 40
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 42 while block 41 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 41
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 43 while block 42 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 42
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 44 while block 43 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 43
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 45 while block 44 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 44
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 46 while block 45 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 45
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 47 while block 46 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 46
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 48 while block 47 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 47
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 49 while block 48 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 48
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 50 while block 49 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 49
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 51 while block 50 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 50
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 52 while block 51 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 51
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 53 while block 52 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 52
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 54 while block 53 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 53
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 55 while block 54 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 54
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 56 while block 55 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 55
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 57 while block 56 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 56
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 58 while block 57 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 57
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 59 while block 58 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 58
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 60 while block 59 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 59
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 61 while block 60 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 60
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 62 while block 61 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 61
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 63 while block 62 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 62
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 64 while block 63 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 63
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
		
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);   // get result from block 64
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
`endif //AES_CTR_16CELLS_1024BL	


   // ------------------------------------------------------------------	ctr 32 cells 32bl
      
 `ifdef AES_CTR_32CELLS_32BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_32CELLS_32BL	


  // ------------------------------------------------------------------	ctr 32 cells 64bl	
   
`ifdef AES_CTR_32CELLS_64BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_32CELLS_64BL	

  // ------------------------------------------------------------------	ctr 32 cells 128bl	
   
`ifdef AES_CTR_32CELLS_128BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_32CELLS_128BL	


 // ------------------------------------------------------------------	ctr 32 cells 256bl	
   
`ifdef AES_CTR_32CELLS_256BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_32CELLS_256BL	

 // ------------------------------------------------------------------	ctr 32 cells 512bl	
   
`ifdef AES_CTR_32CELLS_512BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 10 while block 9 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 9
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_32CELLS_512BL	

// ------------------------------------------------------------------	ctr 32 cells 1024bl	
   
`ifdef AES_CTR_32CELLS_1024BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 10 while block 9 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 9
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 17 while block 16 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 16
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 18 while block 17 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 17
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 19 while block 18 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 18
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 20 while block 19 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 19
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 21 while block 20 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 20
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 22 while block 21 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 21
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 23 while block 22 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 22
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 24 while block 23 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 23
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 25 while block 24 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 24
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 26 while block 25 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 25
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 27 while block 26 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 26
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 28 while block 27 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 27
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 29 while block 28 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 28
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 30 while block 29 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 29
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 31 while block 30 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 30
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 32 while block 31 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 31
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);   // get result from block 32
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_32CELLS_1024BL	

    
    
   // ------------------------------------------------------------------	ctr 64 cells 64bl
      
 `ifdef AES_CTR_64CELLS_64BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_64CELLS_64BL	


  // ------------------------------------------------------------------	ctrv64 cells 128bl	
   
`ifdef AES_CTR_64CELLS_128BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);      // get result from block 2
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_64CELLS_128BL	

  // ------------------------------------------------------------------	ctr 64 cells 256bl	
   
`ifdef AES_CTR_64CELLS_256BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_64CELLS_256BL	


 // ------------------------------------------------------------------	ctr 64 cells 512bl	
   
`ifdef AES_CTR_64CELLS_512BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_64CELLS_512BL	

 // ------------------------------------------------------------------	ctr 64 cells 1024bl	
   
`ifdef AES_CTR_64CELLS_1024BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 9 while block 8 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 8
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 10 while block 9 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 9
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 11 while block 10 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 10
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 12 while block 11 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 11
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 13 while block 12 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 12
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 14 while block 13 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 13
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 15 while block 14 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 14
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 16 while block 15 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 15
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);      // get result from block 16
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_64CELLS_1024BL	


  // ------------------------------------------------------------------	ctr 128 cells 128bl
      
 `ifdef AES_CTR_128CELLS_128BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
 
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_128CELLS_128BL	


  // ------------------------------------------------------------------	ctr 128 cells 256bl	
   
`ifdef AES_CTR_128CELLS_256BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_128CELLS_256BL	

  // ------------------------------------------------------------------	ctr 128 cells 512bl	
   
`ifdef AES_CTR_128CELLS_512BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_128CELLS_512BL	


 // ------------------------------------------------------------------	ctr 128 cells 1024bl	
   
`ifdef AES_CTR_128CELLS_1024BL
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(14);		NOP;	// prim_init_encr_index
					
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 2 while block 1 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 1
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 3 while block 2 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 2
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 4 while block 3 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 3
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 5 while block 4 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 4
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 6 while block 5 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 5
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(400, 16, `ARRAY_NR_CELLS);  // send block 7 while block 6 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);     // get result from block 6
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			
			SEND_MATRIX_ARRAY(900, 16, `ARRAY_NR_CELLS);  // send block 8 while block 7 is encrypted
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);     // get result from block 7
			
			cPRUN(2);		NOP;	// prim_set_addr_regs
			cPRUN(5);		NOP;	// prim_wait_matrices	
			cPRUN(12);		NOP;	// prim_aes_ctr
			cPRUN(13);		NOP;	// prim_aes_ctr_xor
			
			cPRUN(3);		NOP;	// res ready			
			GET_MATRIX_ARRAY(800, 16, `ARRAY_NR_CELLS, 1);
			
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_CTR_128CELLS_1024BL	


// ---------------------------------------------------------------- key expansion analysis

`ifdef AES_KEY_EXP
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
					
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt
			
`endif //AES_KEY_EXP	
