



/* start : prim_initialize
	name:
		prim_initialize
	info:
		Initial configurations for xpu accelerator.
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
		
	uses:
	    label 10_350 - function start;
//*/
//*	// code
	
LB(10_350);
	cNOP;				ACTIVATE;
	cSEL_ADDRREG(0); 	NOP;
	cNOP;				SCANNOP(0);
	cHALT;				NOP;
//*/ end : prim_initialize












/* start : prim_set_addr_regs
	name:
		prim_set_addr_regs
	info:
		set addr reg for both controller and array.
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
	2 parameters:
		array address
		controller address	
	uses:
	    label 10_300 - function start;
//*/ 
//*	// code
	
		
LB(10_300);
	cPARAM;			NOP;
	cPARAM;			NOP;
	cADDRSTORE;		NOP;	
	cNOP;			CLOAD;
	cNOP;			ADDRSTORE;
	
	cHALT;			NOP;
//*/ end : prim_set_addr_regs









/* start : prim_set_interrupt
	name:
		prim_set_interrupt
	info:
		Calls set interrupt asm instruction to generate an interrupt towards the mid level
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
		
	uses:
	    label 10_320 - function start;
//*/ 
//*	// code
	
		
LB(10320);
	cSETINT;    NOP;

	cHALT;		NOP;
//*/ end : prim_set_interrupt







/* start : prim_set_res_ready
	name:
		prim_set_res_ready
	info:
		Calls result ready asm instruction to signal a matrix can be read out via IO path
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
		
	uses:
	    label 10_310 - function start;
//*/ 
//*	// code
	
		
LB(10310);
	cRESREADY;      NOP;

	cHALT;			NOP;
//*/ end : prim_set_res_ready












/* start : prim_wait_matrices
	name:
		prim_wait_matrices
	info:
		used to call wait_matrix (cWAITMATW) asm instruction in order to make accelerator wait for IO data 
	requiremens hardware:
		none
	requirements variables/parameters locations:
		1 parameters, stored at :
			CODE_PRIM_WAIT_MATRICES_NR_MATRICES_LOCATION : stored in ctrl memory : location for parameter storage
		1 ram data, stored at :
			CODE_PRIM_WAIT_MATRICES_LOOP_COUNTER_LOCATION : stored in ctrl memory : main loop counter
		requires 0 matrices :
	uses:
	    label 10_330 - function start;
	    label 10_331 - main loop
//*/ 
//*	// code

	`define CODE_PRIM_WAIT_MATRICES_NR_MATRICES_LOCATION (`CONTROLLER_INSTR_MEM_SIZE/2 -1)
	`define CODE_PRIM_WAIT_MATRICES_LOOP_COUNTER_LOCATION (`CODE_PRIM_WAIT_MATRICES_NR_MATRICES_LOCATION -1)
	
LB(10_330);
	cPARAM;																			NOP;	
	cRSTORE(`CODE_PRIM_WAIT_MATRICES_NR_MATRICES_LOCATION);							NOP;	// mem[] = addr_mat0
	
	cVSUB(1);																		NOP;
	cSETCompVal;																	NOP;
	cVLOAD(-1);																		NOP;
	cSETDEC;																		NOP;
	cVLOAD(0);																		NOP;
	
	LB(10_331);
		cWAITMATW(1);																	NOP;
		cBRNValDEC(10_331);																NOP;
	
	cHALT;																			NOP;
//*/ // end : prim_wait_matrices











/* start : prim_cycle_counter_start_W_halt
	name:
		prim_cycle_counter_start_W_halt
	info:
		Starts the clock cycle counter for time measurements.
		Does not keep counting when in halt state.
	requiremens hardware:
		`define RESOURCE_FEATURE_TESTING (1)
	requirements variables/parameters locations:
		0 parameters:
		requires 0 matrices :
	uses:
	    label 10_360 - function start;
//*/ 
//*	// code

LB(10_360);
	cCC_START_W_HALT;																NOP;
	
	cHALT;																			NOP;
//*/ // end : prim_cycle_counter_start_W_halt





/* start : prim_cycle_counter_start_WO_halt
	name:
		prim_cycle_counter_start_WO_halt
	info:
		Starts the clock cycle counter for time measurements.
		Keeps counting even when in halt state.
	requiremens hardware:
		`define RESOURCE_FEATURE_TESTING (1)
	requirements variables/parameters locations:
		0 parameters:
		requires 0 matrices :
	uses:
	    label 10_361 - function start;
//*/ 
//*	// code

LB(10_361);
	cCC_START_WO_HALT;																NOP;
	
	cHALT;																			NOP;
//*/ // end : prim_cycle_counter_start_WO_halt







/* start : prim_cycle_counter_stop
	name:
		prim_cycle_counter_stop
	info:
		Stops the clock cycle counter for time measurements.
	requiremens hardware:
		`define RESOURCE_FEATURE_TESTING (1)
	requirements variables/parameters locations:
		0 parameters:
		requires 0 matrices :
	uses:
	    label 10_362 - function start;
//*/ 
//*	// code

LB(10_362);
	cCC_STOP;																		NOP;
	
	cHALT;																			NOP;
//*/ // end : prim_cycle_counter_stop






/* start : prim_cycle_counter_reset
		prim_cycle_counter_reset
	info:
		Resets the clock cycle counter for time measurements to value "0".
	requiremens hardware:
		`define RESOURCE_FEATURE_TESTING (1)
	requirements variables/parameters locations:
		0 parameters:
		requires 0 matrices :
	uses:
	    label 10_363 - function start;
//*/ 
//*	// code

LB(10_363);
	cCC_RESET;																		NOP;
	
	cHALT;																			NOP;
//*/ // end : prim_cycle_counter_reset






/* start : prim_temp_andreea_learning
	name:
		prim_temp_andreea_learning
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
	uses:
	    label 9000 - function start;
//*/ 
//*	// code

`define C_SBOX_SIZE                         (256)
`define C_SBOX_ADDR_START                   (0)
`define C_INITIAL_KEY_START                 (300)
`define C_KEY_COLUMN_SIZE_IN_BYTES          (4)
`define C_RCON_ADDR                         (260)
`define C_MD5_MATRIX_ADDR_START             (280)

// AES-128
`define C_INITIAL_KEY_SIZE                  (16)
`define C_NUM_ROUNDS                        (10)
`define C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN (12)
`define C_RCON_OFFSET                         (0)

//// AES-192
//`define C_INITIAL_KEY_SIZE                  (24)
//`define C_NUM_ROUNDS                        (8)
//`define C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN (20)
//`define C_RCON_OFFSET                       (2)

//// AES-256
//`define C_INITIAL_KEY_SIZE                  (32)
//`define C_NUM_ROUNDS                        (7)
//`define C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN (28)
//`define C_RCON_OFFSET                       (3)

`define C_LABEL_SBOX_STORE_LOOP             (9001)
`define C_LABEL_KEY_STORE_LOOP              (9002)
`define C_LABEL_KEY_EXPANSION               (9003)
`define C_LABEL_KEY_SHIFT_FIRST_COLUMN      (9004)
`define C_LABEL_KEY_SBOX_SUBSTITUTION       (9005)
`define C_LABEL_KEY_SBOX_SUBSTITUTION_LOOP  (9006)
`define C_LABEL_XOR_Ki_COLUMN               (9007)
`define C_LABEL_XOR_Ki_COLUMN_LOOP          (9008)
`define C_LABEL_XOR_Kj_COLUMN               (9009)
`define C_LABEL_XOR_Kj_COLUMN_LOOP          (9010)
`define C_LABEL_COMPUTE_256_4_TH_COLUMN     (9011)
`define C_LABEL_XOR_Kj_COLUMN_NORMAL        (9012)

LB(9000);

//subkey generation

//store rcon value
    cVLOAD(1);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 9);	                                 	        NOP;
    cVLOAD(2);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 8);	                                 	        NOP;
    cVLOAD(4);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 7);	                                 	        NOP;
    cVLOAD(8);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 6);	                                 	        NOP;
    cVLOAD(16);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 5);	                                 	        NOP;
    cVLOAD(32);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 4);	                                 	        NOP;
    cVLOAD(64);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 3);	                                 	        NOP;
    cVLOAD(128);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 2);	                                 	        NOP;
    cVLOAD(27);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR + 1);	                                 	        NOP;
    cVLOAD(54);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR);	                                 	            NOP;
    
    
//store MD5 matrix - used for encryption
    cVLOAD(2);                                                      	    NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START);	                                 	NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 5);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 10);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 15);	                                NOP;
    cVLOAD(3);                                                      	    NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 1);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 6);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 11);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 12);	                                NOP;
    cVLOAD(1);                                                      	    NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 2);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 3);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 4);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 7);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 8);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 9);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 13);	                                NOP;
    cSTORE(`C_MD5_MATRIX_ADDR_START + 14);	                                NOP;

    
//store SBOX

    cVLOAD(`C_SBOX_ADDR_START - 1);	                                 	    NOP;
    cADDRSTORE;		                                                        NOP;
	cVLOAD(1);		                                                        NOP;
	cSETDEC;		                                                        NOP;
	cVLOAD(`C_SBOX_SIZE - 1);		                                            NOP;
	
	//store matrix
	LB(`C_LABEL_SBOX_STORE_LOOP);
	    cSTACK_PUSH_LOAD(0);                                                NOP;
		cPARAM;			                                                    NOP;
        cRISTORE(1);                                                        NOP;
        cSTACK_POP;                                                         NOP;
        cNOP;                                                               NOP;
        cBRNZDEC(`C_LABEL_SBOX_STORE_LOOP);                                 NOP;


//store key
    cVLOAD(`C_INITIAL_KEY_START - 1);	                                    NOP;
    cADDRSTORE;		                                                        NOP;
	cVLOAD(1);		                                                        NOP;
	cSETDEC;		                                                        NOP;
	cVLOAD(`C_INITIAL_KEY_SIZE - 1);	/*C_INITIAL_KEY_SIZE*/	            NOP;
	
	LB(`C_LABEL_KEY_STORE_LOOP);
	    cSTACK_PUSH_LOAD(0);                                                NOP;
		cPARAM;			                                                    NOP;
        cRISTORE(1);                                                        NOP;
        cSTACK_POP;                                                         NOP;
        cNOP;                                                               NOP;
        cBRNZDEC(`C_LABEL_KEY_STORE_LOOP);                                  NOP;
    // good until here 
// Generate i+4 (or i+6 or i+8) key

// circular upward shift
    cVLOAD(`C_INITIAL_KEY_START);		                                    NOP;
    cSEL_ADDRREG(3);		                                                NOP;
    cADDRSTORE;		     		                                            NOP;
    cNOP;                                                       NOP;
    cNOP;                                                       NOP;  
    cVLOAD(`C_NUM_ROUNDS - 1);		                                            NOP;

    LB(`C_LABEL_KEY_EXPANSION);  
// circular upward shift
 
// cSEL_ADDRREG(3); 
        cSTACK_PUSH_LOAD(0);                                                NOP;

        cADDRINC(`C_INITIAL_KEY_SIZE);  /* go to 316 with addr_reg3*/       NOP;
        cADDRLOAD;                                                          NOP;
        cNOP;                                                       NOP;
        cNOP;                                                       NOP;
        cSEL_ADDRREG(2);                                                    NOP;
        cNOP;                                                       NOP;
        cNOP;                                                       NOP;
        cADDRSTORE;		                                                    NOP; 
        cNOP;                                                       NOP;
        cNOP;                                                       NOP;
        cADDRINC(-`C_KEY_COLUMN_SIZE_IN_BYTES); /*go to 312 with addr_reg2*/NOP;
        // shift
        LB(`C_LABEL_KEY_SHIFT_FIRST_COLUMN); 
            cRLOAD(1);                                                      NOP;
            cRSTORE(4);                                                     NOP;
            cRLOAD(2);                                                      NOP;
            cRSTORE(5);                                                     NOP;
            cRLOAD(3);                                                      NOP;
            cRSTORE(6);                                                     NOP;
            cRLOAD(0);                                                      NOP;
            cRSTORE(7);                                                     NOP;
            
        cADDRINC(`C_KEY_COLUMN_SIZE_IN_BYTES);  /*go to 316*/               NOP;

        LB(`C_LABEL_KEY_SBOX_SUBSTITUTION);
            cVLOAD(`C_KEY_COLUMN_SIZE_IN_BYTES - 1);                            NOP;
            LB(`C_LABEL_KEY_SBOX_SUBSTITUTION_LOOP);
                cRSTACK_PUSH_LOAD(0);   /*load value from 316*/             NOP; 
                cSEL_ADDRREG(1);                                            NOP;
                cADDRSTORE;	/*store value from 316 to addr_reg1	*/          NOP;
                cNOP;                                                       NOP;
                cNOP;                                                       NOP;  
                cRLOAD(0);      /*load SBOX value*/                         NOP;  // RLOAD not done
                cSEL_ADDRREG(2);    /*go to 316*/                           NOP;
                cRSTORE(0);   /*store SBOX value to 316 with addr_reg2*/    NOP;
                cADDRINC(1);   /*go to 317*/                                NOP;
                
                cSTACK_POP;                                                 NOP;
                cNOP;                                                       NOP;
                cBRNZDEC(`C_LABEL_KEY_SBOX_SUBSTITUTION_LOOP);              NOP;
                
        // good until here
        // addr_reg2 at 320
        cADDRINC(-1);   /*go to 319*/                                 NOP;
        LB(`C_LABEL_XOR_Ki_COLUMN);      
            cADDRLOAD();                                                NOP;
            cNOP;                                                       NOP;
            cNOP;                                                       NOP;
            cSEL_ADDRREG(1);  /*go to 319 with addr_reg1*/                  NOP;
            cADDRSTORE;		                                                NOP;
            cNOP;                                                       NOP;
            cNOP;                                                       NOP;   
            cADDRINC(-`C_INITIAL_KEY_SIZE);  /* go to 303 with addr_reg1*/  NOP;
            
            cVLOAD(`C_KEY_COLUMN_SIZE_IN_BYTES - 1);                            NOP;
            LB(`C_LABEL_XOR_Ki_COLUMN_LOOP);
                cRSTACK_PUSH_LOAD(0); /*load value from 303 and push acc*/  NOP;  
                cADDRINC(-1);  /*go to 302 with addr_reg1*/                 NOP;
                cSEL_ADDRREG(2);  /*addr_reg2 at 319*/                      NOP;
                cRXOR(0);  /*xor between val from 303 and val from 319*/    NOP;
                cRSTORE(0);    /*store to 319*/                             NOP;
                cADDRINC(-1);    /* go to 318 with addr_reg2*/              NOP;   
                cSEL_ADDRREG(1);                                            NOP;
                cSTACK_POP;                                                 NOP;
                cNOP;                                                       NOP;
                cBRNZDEC(`C_LABEL_XOR_Ki_COLUMN_LOOP);                      NOP;
            
            // addr_reg1 at 299 
            cADDRINC(1); /* addr_reg1 at 300*/                              NOP;
            // addr_reg2 at 315         
            cSEL_ADDRREG(2);                                                NOP;
            cADDRINC(1); /* addr_reg2 at 316*/                              NOP;
            
            // xor with rcon          
            cSTACK_LOAD_LAYER1();                                            NOP;
            cNOP;                                                       NOP;
            cSEL_ADDRREG(0);                                                NOP;
            cADDRSTORE;		                                             NOP;
            cNOP;                                                       NOP;
            cNOP;                                                       NOP;
//            cADDRINC(`C_RCON_ADDR);                     NOP;
            cADDRINC(`C_RCON_ADDR + `C_RCON_OFFSET);                     NOP;
            cRLOAD(0);                                                     NOP;
            cSEL_ADDRREG(2);                                                NOP; 
            cRXOR(0);                                                       NOP;
            cRSTORE(0);                                                     NOP;
     
      
         LB(`C_LABEL_XOR_Kj_COLUMN);   // j = i+1, i+2, i+3
             // addr_reg2 at 316
             // addr_reg1 at 300
                 
             cADDRLOAD();                                                    NOP;
             cNOP;                                                       NOP;
             cNOP;                                                       NOP;
             cSEL_ADDRREG(0);                                                NOP;
             cADDRSTORE;		                                             NOP; 
             cNOP;                                                       NOP;
             cNOP;                                                       NOP;  
             cADDRINC(4);  /*addr_reg0 at 320*/                              NOP;
             cSEL_ADDRREG(1);    /* go to 304 with addr_reg1*/               NOP;
             cADDRINC(4);    /* addr_reg1 at 304*/                           NOP;
             cVLOAD(`C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN - 1);               NOP;
             LB(`C_LABEL_XOR_Kj_COLUMN_LOOP);
                 cRSTACK_PUSH_LOAD(0);/*load value from 303  and push acc */  NOP;     // not necessary with R  
                         
                         
                         
//      only for AES 256 !!!
//      if i mod 4 == 0:
//        col_i = sbox(col_i-1)
//        col_i = col_i xor col_i-8                   
                 ///////////////////////////////////////////////////////////////////////////////////////////////////        
               cVLOAD(`C_INITIAL_KEY_SIZE);                                 NOP;
               cVSUB(32);                                                   NOP;
               cBRNZ(`C_LABEL_XOR_Kj_COLUMN_NORMAL);                        NOP;
               cSTACK_LOAD_LAYER1();                                       NOP;
               cNOP;                                                       NOP;
               cVSUB(15);                                                   NOP;
               cBRZ(`C_LABEL_COMPUTE_256_4_TH_COLUMN);                      NOP;
               cSTACK_LOAD_LAYER1();                                       NOP;
               cNOP;                                                       NOP;
               cVSUB(14);                                                   NOP;
               cBRZ(`C_LABEL_COMPUTE_256_4_TH_COLUMN);                      NOP;
               cSTACK_LOAD_LAYER1();                                       NOP;
               cNOP;                                                       NOP;
               cVSUB(13);                                                   NOP;
               cBRZ(`C_LABEL_COMPUTE_256_4_TH_COLUMN);                      NOP;
               cSTACK_LOAD_LAYER1();                                       NOP;
               cNOP;                                                       NOP;
               cVSUB(12);                                                   NOP; 
               cBRNZ(`C_LABEL_XOR_Kj_COLUMN_NORMAL);                      NOP;
                   
               LB(`C_LABEL_COMPUTE_256_4_TH_COLUMN);
                    //copy value from previous column
                    cSEL_ADDRREG(2);                                                NOP;
                    cRLOAD(0);                                                      NOP;
                    cSEL_ADDRREG(0);                                            NOP;
                    cRSTORE(0);                                                     NOP;
                    
                    // sbox value
        
                    cSEL_ADDRREG(2);    /*go to 316*/                           NOP;
                    cADDRLOAD();                                                NOP;
                    cNOP;                                                       NOP;
                    cNOP;                                                       NOP;
                    cSTACK_PUSH_LOAD(0);/*push addr reg2 and load val to replace*/   NOP; 
                    cSEL_ADDRREG(0);                                            NOP;
                    cRLOAD(0);                                                  NOP;
                    cSEL_ADDRREG(2);    /*go to 316*/                           NOP;
                    cADDRSTORE;	/*store value from 316 to addr_reg1	*/          NOP;
                    cNOP;                                                       NOP;
                    cNOP;                                                       NOP; 
                    cRLOAD(0);      /*load SBOX value*/                         NOP;  // RLOAD not done
                    cSEL_ADDRREG(0);                                            NOP;
                    cRSTORE(0);   /*store SBOX value to 316 with addr_reg2*/    NOP;
                    cSTACK_POP;  /*get addr2*/                                  NOP;
                    cNOP;                                                       NOP;
                    cSEL_ADDRREG(2);    /*go to 316*/                           NOP;
                    cADDRSTORE;	/*store value from 316 to addr_reg1	*/          NOP;
                    cNOP;                                                       NOP;
                    cNOP;                                                       NOP; 
                    
                    // xor
                    cSEL_ADDRREG(1);                                             NOP;
                    cRLOAD(0);                                                   NOP;
                    cSEL_ADDRREG(0); /*addr_reg0 at 320*/                        NOP;
                    cRXOR(0); /*xor between val from 304 and val from 316*/      NOP;
                    cRSTORE(0);   /*store to 320*/                               NOP;
                    
                    cADDRINC(1); /*go to 305 with addr_reg1*/                    NOP;
                    cSEL_ADDRREG(1);                                             NOP;
                    cADDRINC(1); /*go to 305 with addr_reg1*/                    NOP;
                    cSEL_ADDRREG(2);                                             NOP;
                    cADDRINC(1); /*go to 305 with addr_reg1*/                    NOP;
                    cSTACK_POP;                                                  NOP;
                    cNOP;                                                        NOP;
                    cBRNZDEC(`C_LABEL_XOR_Kj_COLUMN_LOOP);                       NOP;  /// HERE!!!!!!!
            
                
                LB(`C_LABEL_XOR_Kj_COLUMN_NORMAL);
                /////////////////////////////////////////////////////////////////////////////////////////
          
                    cSEL_ADDRREG(1);                                             NOP;
                    cRLOAD(0);                                                   NOP;
                    cADDRINC(1); /*go to 305 with addr_reg1*/                    NOP;
                    cSEL_ADDRREG(2); /*addr_reg2 at 316*/                        NOP;                    
                    cRXOR(0); /*xor between val from 304 and val from 316*/      NOP;
                    cADDRINC(1); /*go to 317 with addr_reg2*/                    NOP;
                    cSEL_ADDRREG(0); /*addr_reg0 at 320*/                        NOP;
                    cRSTORE(0);   /*store to 320*/                               NOP;
                    cADDRINC(1);   /*go to 321 with addr_reg0*/                  NOP;
    
                    cSTACK_POP;                                                  NOP;
                    cNOP;                                                        NOP;
                    cBRNZDEC(`C_LABEL_XOR_Kj_COLUMN_LOOP);                       NOP;  /// HERE!!!!!!!
         
            
        // addr_reg2 at 316
        cSEL_ADDRREG(3);                                                     NOP;
        cSTACK_POP;                                                          NOP;
        cNOP;                                                                NOP;
        cBRNZDEC(`C_LABEL_KEY_EXPANSION);                                    NOP;
        
        
//    cRESREADY;			NOP;
//	cHALT;				NOP;

// pt incarcare din controller in celule
//cNOP;        NOP;
//cLOAD(X);    NOP;
//cNOP;        NOP;// sau aici , not sure
//cNOP;        CLOAD;// incarca acumulatorul controlerului in acumulatorul fiecarei celule
//cNOP;        NOP;
//cNOP;        NOP;
//cNOP;        NOP;
//cNOP;        NOP;


/* 
    Start encryption - one per cell
*/

`define C_DATA_ADDR_START                             300
//`define C_DATA_ADDR_START                             300

LB(1050);

//get SBOX from controller

    cVLOAD(`C_SBOX_ADDR_START - 1);	                                 	    VLOAD(`C_SBOX_ADDR_START - 1);
    cADDRSTORE;		                                                        ADDRSTORE;
	cVLOAD(1);		                                                        NOP;
	cSETDEC;		                                                        NOP;
	cVLOAD(`C_SBOX_SIZE - 1);		                                        NOP;
	
	//store matrix
	LB(1051);
	    cSTACK_PUSH_LOAD(0);                                                NOP;
        cRILOAD(1);                                                         NOP;
        cNOP;                                                               NOP;
        cSTACK_POP;                                                         CLOAD;
        cNOP;                                                               RISTORE(1);
        cBRNZDEC(1051);                                                     NOP;

	
	
//// Store MD5 matrix  -- TODO: decide if this should be moved in controller
//    cNOP;                                                                    VLOAD(0);
//    cNOP;                                                                    ADDRSTORE;
//    cVLOAD(`C_MD5_MATRIX_ADDR_START);                                        VLOAD(2);
//    cNOP;                                                                    NOP;
//    cVADD(5);                                                                CRSTORE;
//    cVADD(5);                                                                CRSTORE;
//    cVADD(5);                                                                CRSTORE;
//    cNOP;                                                                    CRSTORE;
//    cVADD(-1);                                                               VLOAD(1);
//    cVADD(-1);                                                               CRSTORE;
//    cVADD(-4);                                                               CRSTORE;
//    cVADD(-1);                                                               CRSTORE;
//    cVADD(-1);                                                               CRSTORE;
//    cVADD(-3);                                                               CRSTORE;
//    cVADD(-1);                                                               CRSTORE;
//    cVADD(-1);                                                               CRSTORE;
//    cNOP;                                                                    CRSTORE;
//    cVADD(-1);                                                               VLOAD(3);
//    cVADD(5);                                                                CRSTORE;
//    cVADD(5);                                                                CRSTORE;
//    cVADD(1);                                                                CRSTORE;
//    cNOP;                                                                CRSTORE;
    
    
// get key 0 from controller and xor with data - first round function


    cVLOAD(`C_INITIAL_KEY_START - 1);	                                 	VLOAD(`C_DATA_ADDR_START - 1);
    cADDRSTORE;		                                                        ADDRSTORE;
//	cVLOAD(1);		                                                        NOP;
//	cSETDEC;		                                                        NOP;
	cVLOAD(`C_INITIAL_KEY_SIZE - 1);		                                            NOP;
	
	//store matrix
	LB(1052);
	    cSTACK_PUSH_LOAD(0);                                                NOP;
        cRILOAD(1);                                                        NOP;
         cNOP;                                                             NOP;
        cSTACK_POP;                                                         CLOAD;
        cNOP;                                                               RIXOR(1);
        cBRNZDEC(1052);                                              RSTORE(0);
        
        
// S-BOX substitution   
        
    cVLOAD(`C_DATA_ADDR_START);                                                    VLOAD(0);
    cVSTACK_PUSH_LOAD(16-1);                                        ADDRSTORE;

    LB(1053);
        cSTACK_SWAP();                                             NOP;
        cNOP;                                                      NOP;
        cNOP;                                                      CRLOAD;   // acc_array = mem [addr_reg + acc_controller];
        cNOP;                                                      ADDRSTORE;  // value from 300 becomes address
        cNOP;                                                      NOP;
        cNOP;                                                      RLOAD(0);
        cNOP;                                                      VSTACK_PUSH_LOAD(0);
        cNOP;                                                      ADDRSTORE;
        cNOP;                                                      STACK_POP;
        cVADD(1);                                                  CRSTORE; 
        cSTACK_SWAP();                                             NOP;
        cNOP;                                                      NOP;
        cBRNZDEC(1053);                                            NOP;
   
   
//  Shift rows

    cVLOAD(`C_DATA_ADDR_START + 1);                                              NOP;  //  
    cVADD(12);                                                    CRLOAD;   // load from 301 and go to 312
    cVADD(-4);                                                    CRSWAP_ACC_MEM;   // swap 312 with 301
    cVADD(-4);                                                    CRSWAP_ACC_MEM;   // swap 309 with 312
    cVADD(-4);                                                    CRSWAP_ACC_MEM;   // swap 305 with 309
    cVADD(1);       /* go to 302  */                              CRSWAP_ACC_MEM;   // swap 301 with 305 and go to 302
    
    cVADD(8);                                                     CRLOAD;  // load from 302 and go to 310
    cVADD(-8);                                                    CRSWAP_ACC_MEM;   // swap 310 with 302 and go to 302
    cVADD(4);                                                     CRSTORE;   // store 310 into 302 and go to 306
    cVADD(8);                                                     CRLOAD;    // load from 306 and go to 314
    cVADD(-8);                                                    CRSWAP_ACC_MEM;  // swap 314 with 306 and go to 306
    cVLOAD(`C_DATA_ADDR_START + 3); /* or cVADD(-3);*/                           CRSTORE;        // store 314 into 306 and go to 303
    
    cVADD(4);                                                     CRLOAD;   // load from 303 and go to 307
    cVADD(4);                                                     CRSWAP_ACC_MEM;   // swap 307 with 303 and go to 311
    cVADD(4);                                                     CRSWAP_ACC_MEM;   // swap 311 with 307 and go to 315
    cVADD(-12);                                                   CRSWAP_ACC_MEM;   // swap 315 with 311 and go to 303
    cNOP;                                                         CRSTORE;        // store 315 into 303
    


// Mix columns

    cVLOAD(`C_MD5_MATRIX_ADDR_START - 1);	                      VLOAD(`C_DATA_ADDR_START - 1);
    cSEL_ADDRREG(2);		                                      NOP;
    cADDRSTORE;		                                              ADDRSTORE;
	cVLOAD(4 - 1);		                                            NOP;
	LB(1054);    // loop over data columns
	    cVSTACK_PUSH_LOAD(4-1);                                         NOP;
	    LB(1055);   // loop over rows from MD5 matrix
	       cVSTACK_PUSH_LOAD(4-1);                                         NOP;
	           LB(1056);  // loop over elements from row (for MD5 matrix) and column (for data)
                   cRISTACK_PUSH_LOAD(1);                                         VLOAD(0);
                   
                   // if val == 2
                   cVXOR(2);                                                   RISTACK_PUSH_LOAD(1);
                   cBRNZ(1057);  /* go to val == 3*/                           NOP;
                   // algoritm pt 2 
                   cNOP;                                                       VMULT(2);                      
                   cNOP;                                                       STACK_DUPLICATE;       
                   cNOP;                                                       SHRIGHT_FIXED_AMOUNT;
                   cNOP;                                                       VMULT(27);
                   cNOP;                                                       SXOR;              
                   cJMP(1058);                                                 NOP;
                   
               LB(1057);  //  if val == 3 
                   cRLOAD(0);                                              NOP;
                   cVXOR(3);                                              NOP;
                   cBRNZ(1058);  // go to val = 1
                   // algoritm pt 3
                   cNOP;                                                       STACK_DUPLICATE;  
                   cNOP;                                                       VMULT(2);                      
                   cNOP;                                                       STACK_DUPLICATE;       
                   cNOP;                                                       SHRIGHT_FIXED_AMOUNT;
                   cNOP;                                                       VMULT(27);
                   cNOP;                                                       SXOR; 
                   cNOP;                                                       SXOR;
                                 
               LB(1058);  //  if val == 1
                   cSTACK_POP;                                                 SXOR;   // add (xor) with the other values from column
                   cNOP;                                                       VAND(255);
                   cBRNZDEC(1056);                                             NOP;
	       
	       // finished one line x one column
	       cSTACK_POP;                                                 ADDRINC(13);
           cNOP;                                                       NOP;
           cNOP;                                                       CRSTORE; // store results starting from 316. Columns are reversed;
           cBRNZDEC(1055);                                             ADDRINC(-17); // go to 300 again
        // finished matrix x one column   
       cADDRINC(-16);                                              ADDRINC(4);   // go to the next column and reiterate matrix
       cSTACK_POP;                                                 NOP;
       cNOP;                                                       NOP;
       cBRNZDEC(1054);                                             NOP;
	
	

//    cVLOAD(`C_MD5_MATRIX_ADDR_START - 1);	                      VLOAD(`C_DATA_ADDR_START - 1);
//    cSEL_ADDRREG(2);		                                      NOP;
//    cADDRSTORE;		                                              ADDRSTORE;
////	cVLOAD(4 - 1);		                                            NOP;
	
//	//store matrix
////	LB(1054);
////	    cSTACK_PUSH_LOAD(0);                                         NOP;
//        cRILOAD(1);                                                  NOP;
//         cNOP;                                                       NOP;
//        cRILOAD(1);                                                  CLOAD;
//        cNOP;                                                        RIMULT(1);
//        cNOP;                                                        CSTACK_PUSH_LOAD();
//        cRILOAD(1);                                                  RIMULT(1);
//        cNOP;                                                        SADD();
//        cNOP;                                                        CSTACK_PUSH_LOAD();
//        cRILOAD(1);                                                  RIMULT(1);
//        cNOP;                                                        SADD();
//        cNOP;                                                        CSTACK_PUSH_LOAD();
//        cRILOAD(1);   /* or nop*/                                    RIMULT(1);
//        cNOP;                                                        SADD();
//        cNOP;                                                        RSTORE(`C_DATA_ADDR_START);
////        cBRNZDEC(1054);                                              NOP;




          
// // xor data with key
//    cVLOAD(1);		                                                        NOP;
//	cSETDEC;		                                                        NOP;
//	cVLOAD(`C_INITIAL_KEY_SIZE - 1);		                                NOP;   
    
//    LB(1053);
//        cSTACK_PUSH_LOAD(0);                                                NOP;
//        cRILOAD(1);                                                        NOP;
//         cNOP;                                                             NOP;
//        cSTACK_POP;                                                         CLOAD;
//        cNOP;                                                               RISTORE(1);
//        cBRNZDEC(1052);                                                  RISTORE(1);
        
    
    
    
    
    cRESREADY;			NOP;
	cHALT;				NOP;
    





