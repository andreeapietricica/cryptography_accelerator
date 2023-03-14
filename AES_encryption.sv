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
	cNOP;				SCANNOP;
	cHALT;				NOP;
//*/ end : prim_initialize










					//mandatory addr_reg setup 
//cNOP;				NOP;
//cVLOAD(0);		VLOAD(0);
//cADDRSTORE;		ADDRSTORE;	



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
	cSETVAL(0);																		NOP;
	cVLOAD(-1);																		NOP;
	cSETDEC;																		NOP;
	cVLOAD(0);																		NOP;
	
	LB(10_331);
		cWAITMATW(1);																	NOP;
		cBRCMPNValDEC(10_331,0);														NOP;
	
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






/* start : prim_delay_5
	name:
		prim_delay_5
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
	uses:
	    label 10_104 - function start;
//*/ 
//*	// code
LB(10104);
	cNOP;				NOP;
	cNOP;				NOP;
	cNOP;				NOP;
	cNOP;				NOP;
	cHALT;				NOP;
//*/ end : prim_delay_5




/* start : aes_encryption
	name:
		aes_encryption
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
	uses:
	    label 9000 - function start;
//*/ 
//*	// code

LB(9000);

`define C_SBOX_SIZE                         (256)
`define C_SBOX_ADDR_START                   (0)
`define C_INITIAL_KEY_START                 (300)
`define C_KEY_COLUMN_SIZE_IN_BYTES          (4)
`define C_RCON_ADDR_START                   (260)
`define C_MD5_MATRIX_ADDR_START             (280)

// AES-128
//`define C_INITIAL_KEY_SIZE                  (16)
//`define C_NUM_KEY_ROUNDS                    (10)
//`define C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN (12)
//`define C_RCON_OFFSET                       (0)
//`define C_NUM_ENCRYPTION_ROUNDS             (10)

// AES-192
`define C_INITIAL_KEY_SIZE                  (24)
`define C_NUM_KEY_ROUNDS                    (8)
`define C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN (20)
`define C_RCON_OFFSET                       (2)
`define C_NUM_ENCRYPTION_ROUNDS             (12)

// AES-256
//`define C_INITIAL_KEY_SIZE                  (32)
//`define C_NUM_KEY_ROUNDS                    (7)
//`define C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN (28)
//`define C_RCON_OFFSET                       (3)
//`define C_NUM_ENCRYPTION_ROUNDS             (14)

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

// ----------------CONSTANTS STORE --------------------------------------
 
// Store rcon table - used for key expansion
    cVLOAD(1);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 9);	                                 	    NOP;
    cVLOAD(2);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 8);	                                 	    NOP;
    cVLOAD(4);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 7);	                                 	    NOP;
    cVLOAD(8);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 6);	                                 	    NOP;
    cVLOAD(16);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 5);	                                 	    NOP;
    cVLOAD(32);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 4);	                                 	    NOP;
    cVLOAD(64);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 3);	                                 	    NOP;
    cVLOAD(128);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 2);	                                 	    NOP;
    cVLOAD(27);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START + 1);	                                 	    NOP;
    cVLOAD(54);                                                      	    NOP;
    cSTORE(`C_RCON_ADDR_START);	                                 	        NOP;

// Store MD5 matrix - used for encryption
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

// Store SBOX - used for both key expansion and data encryption

    cVLOAD(`C_SBOX_ADDR_START - 1);	                                 	    NOP; // Go to the start address of the SBOX
    cADDRSTORE;		                                                        NOP;
	cVLOAD(1);		                                                        NOP;
	cSETDEC;		                                                        NOP; // Set decrement value to 1
	cVLOAD(`C_SBOX_SIZE - 1);		                                        NOP;
	cSETVAL(0);                                                             NOP; // Set value register 0 to SBOX size
	
	// Store SBOX matrix
	LB(`C_LABEL_SBOX_STORE_LOOP);
		cPARAM;			                                                    NOP;  // Get parameter
        cRISTORE(1);                                                        NOP;  // Store to addr_reg + 1 and increment add_reg
        cBRValNZDEC(`C_LABEL_SBOX_STORE_LOOP, 0);                           NOP;  // Branch if value register is not 0


// ---------------- KEY EXPANSION --------------------------------------

// Store key given as parameter. Key size depends on the AES variant: 16 bytes for AES 128, 24 bytes for AES 192 and 32 bytes for AES 256
    cVLOAD(`C_INITIAL_KEY_START - 1);	                                    NOP; // Go to the start address of the key
    cADDRSTORE;		                                                        NOP;
	cVLOAD(`C_INITIAL_KEY_SIZE - 1);                                        NOP; // Set value register to the initial key size
	cSETVAL(0);                                                             NOP;
	
	LB(`C_LABEL_KEY_STORE_LOOP);
		cPARAM;			                                                    NOP;
        cRISTORE(1);                                                        NOP;
        cBRValNZDEC(`C_LABEL_KEY_STORE_LOOP, 0);                            NOP;

// SUBKEY GENERATION    
   
// Loop over the corresponding number of key expansion rounds based on the AES variant

    cVLOAD(`C_INITIAL_KEY_START);		                                    NOP; // Go to the start address of the key
    cSEL_ADDRREG(3);		                                                NOP;
    cADDRSTORE;		     		                                            NOP;
    cNOP;                                                                   NOP;
    cVLOAD(`C_NUM_KEY_ROUNDS - 1);		                                        NOP; // Store the number of rounds into val register 0

// Loop subkey generation
    LB(`C_LABEL_KEY_EXPANSION);  

// Generate i+4 (or i+6 or i+8) column key -  circular shift + substitute bytes + XOR column i XOR RconVal

// Circular upward shift
        cSTACK_PUSH_LOAD(0);                                                NOP;
 
        cADDRINC(`C_INITIAL_KEY_SIZE);                                      NOP;  // Go to the next column after the key ends with addr_eg3 (for first iteration addr=316)
        cADDRLOAD;                                                          NOP; 
        cSEL_ADDRREG(2);                                                    NOP; 
        cADDRSTORE;		                                                    NOP;
        cNOP;                                                               NOP;
        cADDRINC(-`C_KEY_COLUMN_SIZE_IN_BYTES);                             NOP;  // Go to the last column of the previous key with addr_reg3  (for first iteration addr=312)
        // shift
        LB(`C_LABEL_KEY_SHIFT_FIRST_COLUMN);                                     // Get values from the last column of the previous key and store them shifted in the first column of the current subkey
            cRLOAD(1);                                                      NOP;
            cRSTORE(4);                                                     NOP;
            cRLOAD(2);                                                      NOP;
            cRSTORE(5);                                                     NOP;
            cRLOAD(3);                                                      NOP;
            cRSTORE(6);                                                     NOP;
            cRLOAD(0);                                                      NOP;
            cRSTORE(7);                                                     NOP;
            
        cADDRINC(`C_KEY_COLUMN_SIZE_IN_BYTES - 1);                              NOP; // Go to addr = 315 (for the first iteration) with addr_reg2

        // SBOX substitution
        LB(`C_LABEL_KEY_SBOX_SUBSTITUTION);
            cVLOAD(`C_KEY_COLUMN_SIZE_IN_BYTES - 1);                        NOP;
            cSETVAL(1);                                                     NOP;  // Set value register 1 to 3 -> column size - 1
            LB(`C_LABEL_KEY_SBOX_SUBSTITUTION_LOOP);
                cRILOAD(1);                                                  NOP;  // Load a value from the column
                cSEL_ADDRREG(1);                                            NOP;
                cADDRSTORE;                                                 NOP;  //Store that value to addr_reg1     
                cNOP;                                                       NOP;  
                cRLOAD(0);                                                  NOP;  // Load the corresponding SBOX value 
                cSEL_ADDRREG(2);                                            NOP;  // Go back to the element to be replaced
                cRSTORE(0);                                                 NOP;  // Replace the element with its SBOX value
                cBRValNZDEC(`C_LABEL_KEY_SBOX_SUBSTITUTION_LOOP, 1);        NOP;
                
        // addr_reg2 is now at  the end of the last column from the previous key (addr = 319)
        // XOR between columns i-1 and i-4
        LB(`C_LABEL_XOR_Ki_COLUMN);      
            cADDRLOAD();                                                    NOP;
            cSEL_ADDRREG(1);  /*go to 319 with addr_reg1*/                  NOP;
            cADDRSTORE;		                                                NOP;
            cNOP;                                                           NOP;   
            cADDRINC(-`C_INITIAL_KEY_SIZE);                                 NOP; // Go to the end of column i-4 with addr_reg1 ( the first column from the previous key) 
            
            // XOR loop
            cVLOAD(`C_KEY_COLUMN_SIZE_IN_BYTES - 1);                        NOP;
            cSETVAL(1);                                                     NOP;  // Set value register 1 to 3 -> column size - 1
            LB(`C_LABEL_XOR_Ki_COLUMN_LOOP);
                cRLOAD(0); /*load value from 303*/                          NOP;  // The comments from left are valid only for the first subkey generation
                cADDRINC(-1);  /*go to 302 with addr_reg1*/                 NOP;
                cSEL_ADDRREG(2);  /*addr_reg2 at 319*/                      NOP;
                cRXOR(0);  /*xor between val from 303 and val from 319*/    NOP;
                cRSTORE(0);    /*store to 319*/                             NOP;
                cADDRINC(-1);    /* go to 318 with addr_reg2*/              NOP;   
                cSEL_ADDRREG(1);                                            NOP;
                cBRValNZDEC(`C_LABEL_XOR_Ki_COLUMN_LOOP, 1);                NOP;
         
      // XOR with the Rcon values   
      
            // addr_reg1 at 299 - for the first iteration
            // addr_reg2 at 315   - for the first iteration       
 
            // xor with rcon          
            cSTACK_LOAD_LAYER1();                                           NOP;  // load the round number.
            cSEL_ADDRREG(0);                                                NOP;
            cADDRSTORE;		                                                NOP;  // Store round number in addr_reg0
            cNOP;                                                           NOP;
            cADDRINC(`C_RCON_ADDR_START + `C_RCON_OFFSET);                  NOP;  // Use round number to access the corresponding rcon value
            cRLOAD(0);                                                      NOP;  // Load rcon value in acc
            cSEL_ADDRREG(2);                                                NOP; 
            cRIXOR(1);                                                      NOP;  // XOR rcon value with values from the first column of the current subkey
            cRSTORE(0);                                                     NOP;
     
      // Compute the remaining columns from the subkey
         LB(`C_LABEL_XOR_Kj_COLUMN);   // j = i+1, i+2, i+3
             // addr_reg2 at 316
             // addr_reg1 at 299
             
             cADDRLOAD();                                                   NOP;
             cSEL_ADDRREG(0);                                               NOP;
             cADDRSTORE;		                                            NOP;   // Copy address from addr_reg2 into addr_reg0
             cNOP;                                                          NOP;
             cADDRINC(3);  /*addr_reg0 at 319*/                             NOP;  // Go to the column i+1 with addr_reg0
             cSEL_ADDRREG(1);    /* go to 303 with addr_reg1*/              NOP;  // Go to the column i-3 with addr_reg1
             cADDRINC(4);    /* addr_reg1 at 303*/                          NOP;
             cVLOAD(`C_NUM_ELEMENTS_WITHOUT_FIRST_COLUMN - 1);              NOP;
             cSETVAL(1);                                                    NOP;  // Set value register 1 to 12 -> key size - 4

             LB(`C_LABEL_XOR_Kj_COLUMN_LOOP);
                                                 
//      only for AES 256 !!!
//      if i mod 4 == 0:
//        col_i = sbox(col_i-1)
//        col_i = col_i xor col_i-8                   
///////////////////////////////////////////////////////////////////////////////////////////////////        
               cVLOAD(`C_INITIAL_KEY_SIZE);                                 NOP;
               cVSUB(32);                                                   NOP;  // If AES key is not 256 bits, jump to normal computing of the column
               cBRNZ(`C_LABEL_XOR_Kj_COLUMN_NORMAL);                        NOP;
               cVLOAD(15);                                                  NOP;  // If the current round number is 15, 14, 13 or 12 compute the column based on the rules for 256 bit key
               cBRCMPVal(`C_LABEL_COMPUTE_256_4_TH_COLUMN, 1);              NOP;
               cVLOAD(14);                                                  NOP;
               cBRCMPVal(`C_LABEL_COMPUTE_256_4_TH_COLUMN, 1);              NOP;
               cVLOAD(13);                                                  NOP;
               cBRCMPVal(`C_LABEL_COMPUTE_256_4_TH_COLUMN, 1);              NOP;
               cVLOAD(12);                                                  NOP; 
               cBRCMPNVal(`C_LABEL_XOR_Kj_COLUMN_NORMAL, 1);                NOP;
                   
               LB(`C_LABEL_COMPUTE_256_4_TH_COLUMN);
                    //copy value from the previous column
                    cSEL_ADDRREG(2);                                        NOP;
                    cRLOAD(0);                                              NOP;
                    cSEL_ADDRREG(0);                                        NOP;
                    cADDRINC(1);                                            NOP;
                    cRSTORE(0);                                             NOP;
                    
                    // Replace with the SBOX value - but save addr_reg2 value to stack in the process, because all addr_regs are used                
                    cSEL_ADDRREG(2);                                        NOP;
                    cADDRLOAD();                                            NOP;
                    cSTACK_PUSH_LOAD(0);                                    NOP;  // Push addr reg2 to stack
                    cSEL_ADDRREG(0);                                        NOP;
                    cRLOAD(0);                                              NOP;
                    cSEL_ADDRREG(2);                                        NOP;
                    cADDRSTORE;                                             NOP;
                    cNOP;                                                   NOP;
                    cRLOAD(0);                                              NOP;  // Load SBOX value
                    cSEL_ADDRREG(0);                                        NOP;
                    cRSTORE(0);                                             NOP;  // Store SBOX value to 316 with addr_reg2*/
                    cSTACK_POP;  /*get addr2*/                              NOP;
                    cSEL_ADDRREG(2);                                        NOP;
                    cADDRSTORE;                                             NOP;
                    cNOP;                                                   NOP;
                    cADDRINC(1); /*go to 305 with addr_reg1*/               NOP; 
                    
                    // XOR between the current column and the column i - 8 
                    cSEL_ADDRREG(1);                                        NOP;
                    cRILOAD(1);                                             NOP;
                    cSEL_ADDRREG(0);                                        NOP;
                    cRXOR(0);                                               NOP;
                    cRSTORE(0);                                             NOP;
                    cBRValNZDEC(`C_LABEL_XOR_Kj_COLUMN_LOOP, 1);            NOP; 
            
                
                LB(`C_LABEL_XOR_Kj_COLUMN_NORMAL);
///////////////////////////////////////////////////////////////////////////////////////////////////////
 
                    cSEL_ADDRREG(1);                                        NOP;
                    cRILOAD(1);                                             NOP;
                    cSEL_ADDRREG(2); /*addr_reg2 at 316*/                   NOP;    // The addresses commented on the left are valid for the first round of AES-128              
                    cRXOR(0); /*xor between val from 304 and val from 316*/ NOP;
                    cADDRINC(1); /*go to 317 with addr_reg2*/               NOP;
                    cSEL_ADDRREG(0); /*addr_reg0 at 320*/                   NOP;
                    cRISTORE(1);   /*store to 320*/                         NOP;
                    cBRValNZDEC(`C_LABEL_XOR_Kj_COLUMN_LOOP, 1);            NOP;
         
            
//      addr_reg2 at 316
//      Pop the round number from stack
        cSEL_ADDRREG(3);                                                    NOP;
        cSTACK_POP;                                                         NOP;
        cNOP;                                                               NOP;
        cBRNZDEC(`C_LABEL_KEY_EXPANSION);                                   NOP;
        
        cHALT;																NOP;
        
// ---------------- BLOCK ENCRYPTION --------------------------------------------------------
/* 
    Start encryption - one per cell
*/

`define C_DATA_ADDR_START                  (300)
`define C_CURRENT_ROUNDS_NUM_STORE_ADDR    (299)

`define C_DATA_BLOCK_SIZE_IN_BYTES         (16)
`define C_DATA_COLUMNS_OR_ROWS_SIZE        (4)
`define C_MIX_COLUMN_XOR_VAL               (27)

`define C_LABEL_START_ENCRYPTION           (1050)
`define C_LABEL_CPY_SBOX_INTO_ARRAY        (1051)
`define C_LABEL_FIRST_ADD_ROUND_KEY        (1052)
`define C_LABEL_SBOX_SUBST_STEP            (1053)
`define C_LABEL_MIX_COLUMN_STEP            (1054)
`define C_LABEL_MIX_COLUMN_LOOP_ROWS       (1055)
`define C_LABEL_MIX_COLUMN_LOOP_ELEMENTS   (1056)
`define C_LABEL_MIX_COLUMN_VAL3            (1057)
`define C_LABEL_MIX_COLUMN_VAL1            (1058)
`define C_LABEL_MOVE_MATRIX_AFTEX_MIX_COLS (1059)
`define C_LABEL_ADD_ROUND_KEY_STEP_LOOP    (1060)
`define C_LABEL_ROUNDS_LOOP                (1061)
`define C_LABEL_ADD_ROUND_KEY_STEP         (1062)

LB(`C_LABEL_START_ENCRYPTION);

// Get the SBOX from controller

    cVLOAD(`C_SBOX_ADDR_START - 1);	                                 	    VLOAD(`C_SBOX_ADDR_START - 1);
    cADDRSTORE;		                                                        ADDRSTORE;
	cVLOAD(`C_SBOX_SIZE - 1);		                                        NOP;
	cSETVAL(0);                                                             NOP;  // Set value register 0 to SBOX size -1
	
	//store matrix
	LB(`C_LABEL_CPY_SBOX_INTO_ARRAY); 
        cRILOAD(1);                                                         NOP;  // Load value in acc controller
        cNOP;                                                               NOP;
        cNOP;                                                               CLOAD; // Get value from cooperand  and then store it into array
        cBRValNZDEC(`C_LABEL_CPY_SBOX_INTO_ARRAY, 0);                       RISTORE(1);
    
// Get the initial key from controller and xor with data -> first ADD ROUND KEY function

    cVLOAD(`C_INITIAL_KEY_START - 1);	                                 	VLOAD(`C_DATA_ADDR_START - 1);
    cADDRSTORE;		                                                        ADDRSTORE;
	cVLOAD(`C_DATA_BLOCK_SIZE_IN_BYTES - 1);		                        NOP;
	cSETVAL(0);                                                             NOP;  // Set value register 0 to data block size -1
	
    cRILOAD(1);                                                             NOP;  // Load value in acc controller
    cNOP;                                                                   NOP; 
	//store matrix
	LB(`C_LABEL_FIRST_ADD_ROUND_KEY);
        cNOP;                                                               CLOAD; // Get value from cooperand  and then XOR it with data in array
        cRILOAD(1);                                                         RIXOR(1);
        cBRValNZDEC(`C_LABEL_FIRST_ADD_ROUND_KEY, 0);                       RSTORE(0);
 
    cADDRINC(-1);                                                           NOP;    // The addres remained ahead after the last iteration
   
   // Rounds begin      
   cVLOAD(`C_NUM_ENCRYPTION_ROUNDS - 1);                                    NOP;

   LB(`C_LABEL_ROUNDS_LOOP); 
      cSTORE(`C_CURRENT_ROUNDS_NUM_STORE_ADDR);                             NOP;
 
    // S-BOX substitution step  
      
    cVLOAD(`C_DATA_BLOCK_SIZE_IN_BYTES - 1);                                VLOAD(0);
    cSETVAL(1);                                                             ADDRSTORE;
    cVLOAD(`C_DATA_ADDR_START);                                             NOP;
    cNOP;                                                                   CRLOAD;
    
    LB(`C_LABEL_SBOX_SUBST_STEP);
        cNOP;                                                               ADDRSTORE;  // value from 300 becomes address
        cNOP;                                                               NOP;
        cNOP;                                                               RLOAD(0);   // Load SBOX value
        cNOP;                                                               VSTACK_PUSH_LOAD(0);  // Push 0 in acc and store into addr_reg in order to have offset 0
        cNOP;                                                               ADDRSTORE;
        cNOP;                                                               STACK_POP;  // Get the SBOX value from stack and store into the corresponding location
        cVADD(1);                                                           CRSTORE;
        cBRValNZDEC(`C_LABEL_SBOX_SUBST_STEP, 1);                           CRLOAD; 

    //  Shift rows step

    cVLOAD(`C_DATA_ADDR_START + 1);                                         NOP;
    cVADD(12);                                                              CRLOAD;           // load from 301 and go to 312
    cVADD(-4);                                                              CRSWAP_ACC_MEM;   // swap 312 with 301
    cVADD(-4);                                                              CRSWAP_ACC_MEM;   // swap 309 with 312
    cVADD(-4);                                                              CRSWAP_ACC_MEM;   // swap 305 with 309
    cVADD(1);       /* go to 302  */                                        CRSWAP_ACC_MEM;   // swap 301 with 305 and go to 302
    
    cVADD(8);                                                               CRLOAD;           // load from 302 and go to 310
    cVADD(-8);                                                              CRSWAP_ACC_MEM;   // swap 310 with 302 and go to 302
    cVADD(4);                                                               CRSTORE;          // store 310 into 302 and go to 306
    cVADD(8);                                                               CRLOAD;           // load from 306 and go to 314
    cVADD(-8);                                                              CRSWAP_ACC_MEM;   // swap 314 with 306 and go to 306
    cVLOAD(`C_DATA_ADDR_START + 3); /* or cVADD(-3);*/                      CRSTORE;          // store 314 into 306 and go to 303
    
    cVADD(4);                                                               CRLOAD;            // load from 303 and go to 307
    cVADD(4);                                                               CRSWAP_ACC_MEM;    // swap 307 with 303 and go to 311
    cVADD(4);                                                               CRSWAP_ACC_MEM;    // swap 311 with 307 and go to 315
    cVADD(-12);                                                             CRSWAP_ACC_MEM;    // swap 315 with 311 and go to 303
    cNOP;                                                                   CRSTORE;           // store 315 into 303
    

    // Check if this is the last round
    cLOAD(`C_CURRENT_ROUNDS_NUM_STORE_ADDR);                                NOP;
    cBRZ(`C_LABEL_ADD_ROUND_KEY_STEP);                                      NOP;
    
// Mix columns
// Multiply in GF(2^8) MD5 matrix with every column of the data block
// Multiply with 1 -> value stays the same
// Multiply with 2 -> Shift left by 1 and then XOR with value 0x1B if the MSB was 1
// Multiply with 3 -> Same for multiplying with 2, then XOR with the original value

    cVLOAD(`C_MD5_MATRIX_ADDR_START - 1);	                                VLOAD(`C_DATA_ADDR_START - 1);
    cSEL_ADDRREG(2);		                                                NOP;
    cADDRSTORE;		                                                        ADDRSTORE;
    cVLOAD(`C_DATA_COLUMNS_OR_ROWS_SIZE - 1);		                        NOP;
    cSETVAL(0);                                                             NOP;

    LB(`C_LABEL_MIX_COLUMN_STEP);    // loop over data columns
        cVLOAD(`C_DATA_COLUMNS_OR_ROWS_SIZE - 1);                           NOP;

        LB(`C_LABEL_MIX_COLUMN_LOOP_ROWS);   // loop over rows from MD5 matrix
           cVSTACK_PUSH_LOAD(`C_DATA_COLUMNS_OR_ROWS_SIZE-1);               VLOAD(0);
            cSETVAL(1);                                                     NOP;
               LB(`C_LABEL_MIX_COLUMN_LOOP_ELEMENTS);  // loop over elements from row (for MD5 matrix) and column (for data)
                   cRILOAD(1);                                              NOP;
                   // if val == 2
                   cVXOR(2);                                                RISTACK_PUSH_LOAD(1);
                   cBRNZ(`C_LABEL_MIX_COLUMN_VAL3);  /* go to val == 3*/    NOP;
                   // algorithm for x2 
                   cNOP;                                                    VMULT(2);                      
                   cNOP;                                                    STACK_DUPLICATE;       
                   cNOP;                                                    SHRIGHT_FIXED_AMOUNT;
                   cNOP;                                                    VMULT(`C_MIX_COLUMN_XOR_VAL);
                   cJMP(`C_LABEL_MIX_COLUMN_VAL1);                          SXOR;              
                   
               LB(`C_LABEL_MIX_COLUMN_VAL3);  //  if val == 3 
                   cRLOAD(0);                                               NOP;
                   cVXOR(3);                                                NOP;
                   cBRNZ(`C_LABEL_MIX_COLUMN_VAL1);  /*go to val = 1 */     NOP;
                   // algorithm for x3
                   cNOP;                                                    VMULT(2);                      
                   cNOP;                                                    STACK_DUPLICATE;       
                   cNOP;                                                    SHRIGHT_FIXED_AMOUNT;
                   cNOP;                                                    VMULT(`C_MIX_COLUMN_XOR_VAL);
                   cNOP;                                                    SXOR; 
                   cNOP;                                                    RXOR(0);
                                 
               LB(`C_LABEL_MIX_COLUMN_VAL1);  //  if val == 1
                   cNOP;                                                    SXOR;   // add (xor) with the other values from column
                   cBRValNZDEC(`C_LABEL_MIX_COLUMN_LOOP_ELEMENTS, 1);       VAND(255);
           
           // finished one line x one column
           cSTACK_POP;                                                      ADDRINC(13);
           cNOP;                                                            NOP;  
           cNOP;                                                            CRSTORE; // store results starting from 316. Columns are reversed;
           cBRNZDEC(`C_LABEL_MIX_COLUMN_LOOP_ROWS);                         ADDRINC(-17); // go to 300 again
        // finished matrix x one column   
       cADDRINC(-`C_DATA_BLOCK_SIZE_IN_BYTES);                              ADDRINC(4);   // go to the next column and reiterate matrix
       cBRValNZDEC(`C_LABEL_MIX_COLUMN_STEP, 0);                            NOP;
       
  
  
  // Move result after mix columns     
              
    cVLOAD(`C_DATA_COLUMNS_OR_ROWS_SIZE - 1);                               VLOAD(0);
    cSETVAL(0);                                                             ADDRSTORE;     
                                      
    cVLOAD(`C_DATA_ADDR_START + `C_DATA_BLOCK_SIZE_IN_BYTES);               NOP;
    cNOP;                                                                   NOP; 
    LB(`C_LABEL_MOVE_MATRIX_AFTEX_MIX_COLS);
        cVADD(1);                                                           CRLOAD;   // load val from 316
        cVADD(1);                                                           CRSTACK_PUSH_LOAD;  // load val from 317
        cVADD(1);                                                           CRSTACK_PUSH_LOAD; // load val from 318
        cVADD(-19);                                                         CRSTACK_PUSH_LOAD; // load val from 319  -- this is the first value from the result
        // store from 300
        cVADD(1);                                                           CRSTACK_STORE_POP;
        cVADD(1);                                                           CRSTACK_STORE_POP; 
        cVADD(1);                                                           CRSTACK_STORE_POP;
        cVADD(17);  /* go to the second column*/                            CRSTORE;
        cBRValNZDEC(`C_LABEL_MOVE_MATRIX_AFTEX_MIX_COLS, 0);                NOP;
    
   // Add round key step
    LB(`C_LABEL_ADD_ROUND_KEY_STEP);  // Add round key
    // get key i from controller and xor with data - round function
    cSEL_ADDRREG(3);                                                        VLOAD(`C_DATA_ADDR_START - 1);
    cVLOAD(`C_DATA_BLOCK_SIZE_IN_BYTES - 1);		                        ADDRSTORE;
    cSETVAL(0);                                                             NOP;

    // XOR matrix with key
    cRILOAD(1);                                                             NOP;
    cNOP;                                                                   NOP;
    LB(`C_LABEL_ADD_ROUND_KEY_STEP_LOOP);
        cNOP;                                                               CLOAD;
        cRILOAD(1);                                                         RIXOR(1);
        cBRValNZDEC(`C_LABEL_ADD_ROUND_KEY_STEP_LOOP, 0);                   RSTORE(0);

    cADDRINC(-1);                                                           NOP;    // The address remained ahead after the last iteration
    
    // check round number      
    cLOAD(`C_CURRENT_ROUNDS_NUM_STORE_ADDR);                                NOP;
    cBRNZDEC(`C_LABEL_ROUNDS_LOOP);                                         NOP;

	cHALT;				                                                    NOP;
    




