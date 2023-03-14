

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
			cJMP(1050);			NOP; // prim_aes_encryption								// line 11
			`include "10_examples.sv"
					
			cHALT;			NOP;
			
			
			
			
//* // for aes_encryption
	LB(9);	
			
			cPRUN(0);		NOP;	// pload/halt
			cPRUN(1);		NOP;	// initial stuff
			cPRUN(2);		NOP;	// prim_set_addr_regs
			
			SEND_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS);
			cPRUN(5);		NOP;	// prim_wait_matrices	
			
			cPRUN(10);		NOP;	// prim_key_expansion
			cPRUN(6);		NOP;	// prim_cycle_counter_start_W_halt
			cPRUN(11);		NOP;	// prim_aes_encryption
			cPRUN(8);		NOP;	// prim_cycle_counter_stop		
			
			cPRUN(3);		NOP;	// res ready
			GET_MATRIX_ARRAY(300, 16, `ARRAY_NR_CELLS, 1);	
			
			cPRUN(4);		NOP;	// prim_set_interrupt


//*/



    
    