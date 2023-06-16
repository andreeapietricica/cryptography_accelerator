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


//LB(1300);
//`ifndef EVEN_BLOCK
//    `define EVEN_BLOCK
//`endif	


/* start : sha2_algorithm
	name:
		sha2_algorithm
	requirements hardware:
		none
	requirements variables/parameters locations:
		none
	uses:
	    label 9000 - function start;
//*/ 
//*	// code

`define C_LABEL_INITIALIZE_VALUES                 (9000)
    `define C_LABEL_HASH_VALUES_INIT_STORE_LOOP   (9001)
    `define C_LABEL_ROUND_CONSTANTS_STORE_LOOP    (9002)
    
`define C_LABEL_SHA_ALGORITHM                     (9003)
    `define C_LABEL_RESET_HASH_LOOP               (9004)
    `define C_LABEL_MESSAGE_SCHEDULE              (9005)
    `define C_LABEL_COPY_MESSAGE_LOOP             (9006)
    `define C_LABEL_EXPAND_MESSAGE_LOOP           (9007)
    `define C_LABEL_COMPRESSION_FUNCTION          (9008)
    `define C_LABEL_INIT_ABCDEFGH_LOOP            (9009)
    `define C_LABEL_COMPRESSION_LOOP              (9010)


`define C_INITIAL_HASH_VALUES_ADDR                (0)
`define C_ROUND_CONSTANTS_ADDR                    (20)
`define C_INPUT_DATA_START_ADDR                   (10)  // address where the address value of the message will be stored in controller
`define C_VAR_ABCDEFGH_ADDR                       (30)
`define C_W_SCHEDULE_ARRAY_ADDR                   (40)

`define C_MESSAGE_SIZE_IN_32BIT_WORDS             (16)
`define C_W_FINAL_SIZE_IN_32BIT_WORDS             (64)

`define C_ROUND_CONSTANTS_NUM                 (64)
`define C_HASH_VALUES_NUM                     (8)

`define C_NOT_CONSTANT_ADDR   1000
	
LB(`C_LABEL_INITIALIZE_VALUES);

// ----------------------- STORE INITIAL HASH VALUES ----------------------------------------------


    // Store h1-h7 initial values
    cVLOAD(`C_INITIAL_HASH_VALUES_ADDR - 1);	                            NOP; // Go to the start address of the round constants
    cADDRSTORE;		                                                        NOP;
    cVLOAD(1);		                                                        NOP;
	cSETDEC;		                                                        NOP; // Set decrement value to 1
	cVLOAD(`C_HASH_VALUES_NUM - 1);		                                    NOP;
	cSETVAL(0);                                                             NOP; // Set value register 0 to round constants number
	
	// Store initial hash values - h[0:7]
	LB(`C_LABEL_HASH_VALUES_INIT_STORE_LOOP);
		cPARAM;			                                                    NOP;  // Get parameter
        cRISTORE(1);                                                        NOP;  // Store to addr_reg + 1 and increment add_reg
        cBRValNZDEC(`C_LABEL_HASH_VALUES_INIT_STORE_LOOP, 0);               NOP;  // Branch if value register is not 0

// ----------------------- STORE ROUNDS CONSTANTS ----------------------------------------------

    cVLOAD(`C_ROUND_CONSTANTS_ADDR - 1);	                                NOP; // Go to the start address of the round constants
    cADDRSTORE;		                                                        NOP;
	cVLOAD(`C_ROUND_CONSTANTS_NUM - 1);		                                NOP;
	cSETVAL(0);                                                             NOP; // Set value register 0 to round constants number
	
	// Store round constants values - K[0:63]
	LB(`C_LABEL_ROUND_CONSTANTS_STORE_LOOP);
		cPARAM;			                                                    NOP;  // Get parameter
        cRISTORE(1);                                                        NOP;  // Store to addr_reg + 1 and increment add_reg
        cBRValNZDEC(`C_LABEL_ROUND_CONSTANTS_STORE_LOOP, 0);                NOP;  // Branch if value register is not 0
        
        
    // Prepare a constant that will be needed for not operations: 32'b1111_1111_1111_1111_1111_1111_1111_1111
	cNOP;		                                                            VLOAD(65535);   // Can be loaded an immediate value of max 24 bits
	cNOP;		                                                            SHIFT_LEFT(16);
	cNOP;		                                                            VADD(65535);
	cNOP;		                                                            STORE(`C_NOT_CONSTANT_ADDR);
        
   cHALT;																    NOP;
   
   
// ----------------------- SHA2 ALGORITHM BEGIN ----------------------------------------------

LB(`C_LABEL_SHA_ALGORITHM);

    cVLOAD(1);		                                                        VLOAD(-1);
	cSETDEC;		                                                        ADDRSTORE;
	
	// Get input message address from parameter
	cPARAM;		                                                            NOP;
	cSTORE(`C_INPUT_DATA_START_ADDR);		                                NOP; // Store begin address of the message

// Check if the first value from the input data is 0 or 1
// 1 -> this is the beggining of a new message, so hash values must be reinitialized
// 0 -> this is the continuation of a message, so has values should not be reinitialized
//    cLOAD(`C_INPUT_DATA_START_ADDR);		                                NOP; // Store begin address of the message

    cVLOAD(`C_INITIAL_HASH_VALUES_ADDR - 1);                                CRLOAD;   // load hash reset indicator. It is placed right before the message
    cADDRSTORE;                                                             WHERENZERO;
    cVLOAD(`C_HASH_VALUES_NUM - 1);		                                    NOP;
	cSETVAL(0);                                                             VLOAD(`C_INITIAL_HASH_VALUES_ADDR - 1);  // Set value register 0 to data block size -1
    // Copy hash values from controller
    cRILOAD(1);                                                             ADDRSTORE;
    cNOP;	      	                                                        NOP;
    
    LB(`C_LABEL_RESET_HASH_LOOP);
        cRILOAD(1);                                                         CLOAD;
        cBRValNZDEC(`C_LABEL_RESET_HASH_LOOP, 0);                           RISTORE(1);                                              

    cNOP;                                                                   ENDWHERE;


LB(`C_LABEL_MESSAGE_SCHEDULE);

// Copy initial message to the W array beginning
    cVLOAD(`C_MESSAGE_SIZE_IN_32BIT_WORDS - 1);                             VLOAD(0);  // Set value register 0 to data block size -1
    cSETVAL(0);                                                             ADDRSTORE;
    cVLOAD(`C_W_SCHEDULE_ARRAY_ADDR - 1);		                            NOP;
 
    cSTACK_PUSH_LOAD(`C_INPUT_DATA_START_ADDR);                            NOP;
    cNOP;		                                                            NOP;
 
    LB(`C_LABEL_COPY_MESSAGE_LOOP);
        cSTACK_POP;		                                                    CRLOAD;
        cNOP;                                                               ADDRINC(1);
        cSTACK_PUSH_LOAD(`C_INPUT_DATA_START_ADDR);		                CRSTORE;
        cBRValNZDEC(`C_LABEL_COPY_MESSAGE_LOOP, 0);                         NOP;
    
// Create message schedule - expand W message to 64 elements of 32 bits each
    /*
    For i from w[16…63]:

    s0 = (w[i-15] rightrotate 7) xor (w[i-15] rightrotate 18) xor (w[i-15] rightshift 3)
    s1 = (w[i- 2] rightrotate 17) xor (w[i- 2] rightrotate 19) xor (w[i- 2] rightshift 10)
    w[i] = w[i-16] + s0 + w[i-7] + s1
    */
    cVLOAD(`C_W_FINAL_SIZE_IN_32BIT_WORDS - `C_MESSAGE_SIZE_IN_32BIT_WORDS - 1);	VLOAD(`C_W_SCHEDULE_ARRAY_ADDR + `C_MESSAGE_SIZE_IN_32BIT_WORDS);
	cSETVAL(0);                                                             ADDRSTORE;  // Set value register 0 to data 64 - 16 - the number of remaining elements in W
	
	cNOP;		                                                            NOP;                  
	LB(`C_LABEL_EXPAND_MESSAGE_LOOP);
	   // Compute s0 = (w[i-15] rightrotate 7) xor (w[i-15] rightrotate 18) xor (w[i-15] rightshift 3)
	   cNOP;		                                                        RLOAD(-15);
	   cNOP;		                                                        ROTRIGHT_LOCAL(7);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-15);
	   cNOP;		                                                        ROTRIGHT_LOCAL(18);
	   cNOP;		                                                        RXOR(0);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-15);
	   cNOP;		                                                        SHIFT_RIGHT(3);
	   cNOP;		                                                        RXOR(0);
	   
	   // Compute s1 = (w[i- 2] rightrotate 17) xor (w[i- 2] rightrotate 19) xor (w[i- 2] rightshift 10)
	   cNOP;		                                                        RSTACK_PUSH_LOAD(-2);  // also push to stack the s0 result
	   cNOP;		                                                        ROTRIGHT_LOCAL(17);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-2);
	   cNOP;		                                                        ROTRIGHT_LOCAL(19);
	   cNOP;		                                                        RXOR(0);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-2);
	   cNOP;		                                                        SHIFT_RIGHT(10);
	   cNOP;		                                                        RXOR(0);

	   
	   // Compute w[i] = w[i-16] + s0 + w[i-7] + s1
	   cNOP;		                                                        RSTACK_PUSH_LOAD(-16);
	   cNOP;		                                                        RSTACK_PUSH_LOAD(-7);
	   cNOP;		                                                        SADD;
	   cNOP;		                                                        SADD;
	   cNOP;		                                                        SADD;
	   cNOP;		                                                        RSTORE(0);
	   
	   cNOP;		                                                        ADDRINC(1);
	   cBRValNZDEC(`C_LABEL_EXPAND_MESSAGE_LOOP, 0);                        NOP;
	   
	// Start comopression function    
	/*
	    Initialize variables a, b, c, d, e, f, g, h and set them equal to the current hash values respectively. h0, h1, h2, h3, h4, h5, h6, h7
    Run the compression loop. The compression loop will mutate the values of a…h. The compression loop is as follows:
    for i from 0 to 63
        S1 = (e rightrotate 6) xor (e rightrotate 11) xor (e rightrotate 25)
        ch = (e and f) xor ((not e) and g)
        temp1 = h + S1 + ch + k[i] + w[i]
        S0 = (a rightrotate 2) xor (a rightrotate 13) xor (a rightrotate 22)
        maj = (a and b) xor (a and c) xor (b and c)
        temp2 := S0 + maj
        h = g
        g = f
        f = e
        e = d + temp1
        d = c
        c = b
        b = a
        a = temp1 + temp2 
     */
LB(`C_LABEL_COMPRESSION_FUNCTION);	 

    // Copy hash values into a,b,c,d,e,f,g,h variables
    cVLOAD(`C_HASH_VALUES_NUM - 1);                                         VLOAD(0);  // Set value register 0 to data block size -1
    cSETVAL(0);                                                             ADDRSTORE;
    cVLOAD(`C_VAR_ABCDEFGH_ADDR - 1);		                                NOP;
 
    cVSTACK_PUSH_LOAD(`C_INITIAL_HASH_VALUES_ADDR);                         NOP;
    cNOP;		                                                            NOP;
 
    LB(`C_LABEL_INIT_ABCDEFGH_LOOP);
        cSTACK_POP;		                                                    CRLOAD;
        cNOP;                                                               ADDRINC(1);
        cVSTACK_PUSH_LOAD(`C_INITIAL_HASH_VALUES_ADDR);		                CRSTORE;
        cBRValNZDEC(`C_LABEL_INIT_ABCDEFGH_LOOP, 0);                        NOP;
	
	
	cSTACK_POP;		                                                        NOP;
	
	// Addreg will be currently at h + 1 address (38)

    // Run the compression loop   
       
    cVLOAD(`C_ROUND_CONSTANTS_NUM - 1);                                     VLOAD(`C_VAR_ABCDEFGH_ADDR + 8);  // Set value register 0 to the address of h variable + 1
    cSETVAL(0);                                                             ADDRSTORE;
    cVSTACK_PUSH_LOAD(0);                                                   NOP;
    cADDRSTORE;		                                                        NOP;
    
    LB(`C_LABEL_COMPRESSION_LOOP);
    
          
       // Compute S0 = (a rightrotate 2) xor (a rightrotate 13) xor (a rightrotate 22)
       cNOP;		                                                        VLOAD(1234);
	   cNOP;		                                                        RLOAD(-8); // push temp1 on stack and load a
	   cNOP;		                                                        ROTRIGHT_LOCAL(2);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-8);
	   cNOP;		                                                        ROTRIGHT_LOCAL(13);
	   cNOP;		                                                        RXOR(0);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-8);
	   cNOP;		                                                        ROTRIGHT_LOCAL(22);
	   cNOP;		                                                        RXOR(0);
	   
	   // Compute maj = (a and b) xor (a and c) xor (b and c)
	   cNOP;		                                                        RSTACK_PUSH_LOAD(-8); // push S0 on stack and load a
	   cNOP;		                                                        RAND(-7);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-8);
	   cNOP;		                                                        RAND(-6);
	   cNOP;		                                                        RXOR(0);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-7);
	   cNOP;		                                                        RAND(-6);
	   cNOP;		                                                        RXOR(0);
	   
	   // Compute temp2 = S0 + maj
       cNOP;		                                                        SADD; // Add S0
       
    // Compute S1 = (e rightrotate 6) xor (e rightrotate 11) xor (e rightrotate 25)
       cNOP;		                                                        RSTACK_PUSH_LOAD(-4);
	   cNOP;		                                                        ROTRIGHT_LOCAL(6);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-4);
	   cNOP;		                                                        ROTRIGHT_LOCAL(11);
	   cNOP;		                                                        RXOR(0);
	   cNOP;		                                                        RSTORE(0);
	   cNOP;		                                                        RLOAD(-4);
	   cNOP;		                                                        ROTRIGHT_LOCAL(25);
	   cNOP;		                                                        RXOR(0);

        // Compute ch = (e and f) xor ((not e) and g)
       cNOP;		                                                        RSTACK_PUSH_LOAD(-4);	  // also push to stack the S1 result
       cNOP;		                                                        RAND(-3);
       cNOP;		                                                        RSTORE(0);
       cNOP;		                                                        RLOAD(-4);
       cRSTACK_PUSH_LOAD(`C_ROUND_CONSTANTS_ADDR);	/*load K[i]*/           XOR(`C_NOT_CONSTANT_ADDR);
       cNOP;		                                                        RAND(-2);
       cNOP;		                                                        RXOR(0);
        
       // Compute temp1 = h + S1 + ch + k[i] + w[i]
       cSTACK_POP;		/*get i*/                                           CSTACK_PUSH_LOAD;   // load k[i] into array,  // also push to stack the ch result
       cNOP;		                                                        SADD;  // add ch
       cVADD(`C_W_SCHEDULE_ARRAY_ADDR - `C_VAR_ABCDEFGH_ADDR - 8);    	    SADD;  // add S1 ; -`C_VAR_ABCDEFGH_ADDR -8 on controller to compensayte the addr reg from cells 
       cNOP;		                                                        RADD(-1);  // add h
       cVADD(-`C_W_SCHEDULE_ARRAY_ADDR + `C_VAR_ABCDEFGH_ADDR + 8);		    CRADD;   // add W[i]

       // temp1 and temp 2 are on the stack
       cNOP;		                                                        STACK_DUPLICATE;           // duplicate temp 1
       // h=g
       cNOP;		                                                        RSTACK_PUSH_LOAD(-2);  // load g and push temp 1
       cNOP;		                                                        RSTORE(-1);     // store to h
       cNOP;		                                                        RLOAD(-3);      // load f
       cNOP;		                                                        RSTORE(-2);     // store to g
       cNOP;		                                                        RLOAD(-4);      // load e
       cNOP;		                                                        RSTORE(-3);     // store to f
       cNOP;		                                                        RLOAD(-5);      // load d
       cNOP;		                                                        SADD;           // add temp 1
       cNOP;		                                                        RSTORE(-4);     // store to e
       cNOP;		                                                        RLOAD(-6);      // load c
       cNOP;		                                                        RSTORE(-5);     // store to d
       cNOP;		                                                        RLOAD(-7);      // load b
       cNOP;		                                                        RSTORE(-6);     // store to c
       cNOP;		                                                        RLOAD(-8);      // load a
       cNOP;		                                                        RSTORE(-7);     // store to b
       cVADD(1);		                                                    VLOAD(0);       // load 0
       cADDRINC(1);		                                                    SADD;           // add temp 1
       cNOP;		                                                        SADD;           // add temp 2
       cBRValNZDEC(`C_LABEL_COMPRESSION_LOOP, 0); 	                        RSTORE(-8);     // store to a
	
	
	// Final step -  add abcdefgh variables to hash values
    cNOP;		                                                        RLOAD(-1);      // load h
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 7);      // add h7
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 7);      // store result to h7
    cNOP;		                                                        RLOAD(-2);      // load g
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 6);      // add h6
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 6);      // store result to h6
    cNOP;		                                                        RLOAD(-3);      // load f
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 5);      // add h5
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 5);      // store result to h5
    cNOP;		                                                        RLOAD(-4);      // load e
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 4);      // add h4
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 4);      // store result to h4
    cNOP;		                                                        RLOAD(-5);      // load d
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 3);      // add h3
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 3);      // store result to h3
    cNOP;		                                                        RLOAD(-6);      // load c
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 2);      // add h2
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 2);      // store result to h2
    cNOP;		                                                        RLOAD(-7);      // load b
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 1);      // add h1
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 1);      // store result to h1
    cNOP;		                                                        RLOAD(-8);      // load a
    cNOP;		                                                        ADD(`C_INITIAL_HASH_VALUES_ADDR + 0);      // add h0
    cNOP;		                                                        STORE(`C_INITIAL_HASH_VALUES_ADDR + 0);      // store result to h0
   
   
    // Copy hash result depending on if the block is the last from a message or not
    
    // Load last block indicator. It is located right after the input block ends

    cLOAD(`C_INPUT_DATA_START_ADDR);		                            VLOAD(0);
	cVADD(`C_MESSAGE_SIZE_IN_32BIT_WORDS);                              ADDRSTORE;
	cNOP;                                                               NOP;
	cPARAM;		                                                        CRLOAD;
    cNOP;                                                               WHERENZERO;
    cNOP;                                                               LOAD(`C_INITIAL_HASH_VALUES_ADDR);  // load h0
    cNOP;                                                               CRSTORE;
    cVADD(1);                                                           LOAD(`C_INITIAL_HASH_VALUES_ADDR + 1);  // load h1
    cNOP;                                                               CRSTORE;
    cVADD(1);                                                           LOAD(`C_INITIAL_HASH_VALUES_ADDR + 2);  // load h2
    cNOP;                                                               CRSTORE;
    cVADD(1);                                                           LOAD(`C_INITIAL_HASH_VALUES_ADDR + 3);  // load h3
    cNOP;                                                               CRSTORE;
    cVADD(1);                                                           LOAD(`C_INITIAL_HASH_VALUES_ADDR + 4);  // load h4
    cNOP;                                                               CRSTORE;
    cVADD(1);                                                           LOAD(`C_INITIAL_HASH_VALUES_ADDR + 5);  // load h5
    cNOP;                                                               CRSTORE;
    cVADD(1);                                                           LOAD(`C_INITIAL_HASH_VALUES_ADDR + 6);  // load h6
    cNOP;                                                               CRSTORE;
    cVADD(1);                                                           LOAD(`C_INITIAL_HASH_VALUES_ADDR + 7);  // load h7
    cNOP;                                                               CRSTORE;
    
    cNOP;                                                               ELSEWHERE;
    
    cNOP;                                                               VLOAD(0);  // load 0
    cVADD(-1);                                                          CRSTORE;
    cVADD(-1);                                                          CRSTORE;
    cVADD(-1);                                                          CRSTORE;
    cVADD(-1);                                                          CRSTORE;
    cVADD(-1);                                                          CRSTORE;
    cVADD(-1);                                                          CRSTORE;
    cVADD(-1);                                                          CRSTORE;
    cNOP;                                                               CRSTORE;
    cNOP;                                                               ENDWHERE;

    cHALT;																    NOP;
