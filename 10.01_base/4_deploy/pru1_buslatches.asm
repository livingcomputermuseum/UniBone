;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.3.1 *
;* Date/Time created: Sun Mar 31 20:55:30 2019                                *
;******************************************************************************
	.compiler_opts --abi=eabi --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("pru1_buslatches.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.3.1 Copyright (c) 2012-2017 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/pru1")
	.global	__PRU_CREG_PRU_CFG
	.weak	||CT_CFG||
||CT_CFG||:	.usect	".creg.PRU_CFG.noload.near",68,1
$C$DW$1	.dwtag  DW_TAG_variable
	.dwattr $C$DW$1, DW_AT_name("CT_CFG")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("CT_CFG")
	.dwattr $C$DW$1, DW_AT_location[DW_OP_addr ||CT_CFG||]
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$70)
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$1, DW_AT_decl_column(0x17)

	.global	||buslatches||
	.common	||buslatches||,16,1
$C$DW$2	.dwtag  DW_TAG_variable
	.dwattr $C$DW$2, DW_AT_name("buslatches")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("buslatches")
	.dwattr $C$DW$2, DW_AT_location[DW_OP_addr ||buslatches||]
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$72)
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_decl_file("pru1_buslatches.c")
	.dwattr $C$DW$2, DW_AT_decl_line(0x29)
	.dwattr $C$DW$2, DW_AT_decl_column(0x0e)


$C$DW$3	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$3, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("buslatches_pru0_dataout")
	.dwattr $C$DW$3, DW_AT_declaration
	.dwattr $C$DW$3, DW_AT_external
	.dwattr $C$DW$3, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$3, DW_AT_decl_line(0xba)
	.dwattr $C$DW$3, DW_AT_decl_column(0x06)
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$32)

	.dwendtag $C$DW$3


$C$DW$5	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$5, DW_AT_name("__delay_cycles")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("__delay_cycles")
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$11)

	.dwendtag $C$DW$5

;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/optpru --gen_opt_info=2 /tmp/TI1jdaObx4t /tmp/TI1jd4Xvprn --opt_info_filename=/home/joerg/retrocmp/dec/UniBone/10.01_base/4_deploy/pru1_buslatches.nfo 
;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/acpiapru -@/tmp/TI1jdKWcMe0 
	.sect	".text:buslatches_test"
	.clink
	.global	||buslatches_test||

$C$DW$7	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$7, DW_AT_name("buslatches_test")
	.dwattr $C$DW$7, DW_AT_low_pc(||buslatches_test||)
	.dwattr $C$DW$7, DW_AT_high_pc(0x00)
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("buslatches_test")
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_TI_begin_file("pru1_buslatches.c")
	.dwattr $C$DW$7, DW_AT_TI_begin_line(0xbb)
	.dwattr $C$DW$7, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$7, DW_AT_decl_file("pru1_buslatches.c")
	.dwattr $C$DW$7, DW_AT_decl_line(0xbb)
	.dwattr $C$DW$7, DW_AT_decl_column(0x06)
	.dwattr $C$DW$7, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru1_buslatches.c",line 187,column 66,is_stmt,address ||buslatches_test||,isa 0

	.dwfde $C$DW$CIE, ||buslatches_test||
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_name("a")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("a")
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$8, DW_AT_location[DW_OP_regx 0x38]

$C$DW$9	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$9, DW_AT_name("b")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("b")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$9, DW_AT_location[DW_OP_regx 0x39]

$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_name("c")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("c")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$10, DW_AT_location[DW_OP_regx 0x3a]

$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_name("d")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("d")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$11, DW_AT_location[DW_OP_regx 0x3b]

;----------------------------------------------------------------------
; 187 | void buslatches_test(uint8_t a, uint8_t b, uint8_t c, uint8_t d) {     
; 189 | // be sure the PRU1 GPI are in "Direct Input Mode"                     
; 190 | // spruh73n, chapter 4.4.1.2.3.2,                                      
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: buslatches_test               FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||buslatches_test||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
;*** 191	-----------------------    *(&CT_CFG+12) &= 0xfffffffcu;
;*** 193	-----------------------    __R30 &= 0xffffefffu;
	.dwpsn	file "pru1_buslatches.c",line 191,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 191 | CT_CFG.GPCFG1_bit.PRU1_GPI_MODE = 0;                                   
;----------------------------------------------------------------------
        LDI32     r0, 0xfffffffc        ; [ALU_PRU] |191| 
        LBCO      &r1, __PRU_CREG_PRU_CFG, $CSBREL(||CT_CFG||+12), 4 ; [ALU_PRU] |191| CT_CFG
        AND       r0, r1, r0            ; [ALU_PRU] |191| 
        SBCO      &r0, __PRU_CREG_PRU_CFG, $CSBREL(||CT_CFG||+12), 4 ; [ALU_PRU] |191| CT_CFG
	.dwpsn	file "pru1_buslatches.c",line 193,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 193 | DEBUG_PIN_SET(0); // clear, no error                                   
; 195 | #ifdef TEST_66MHZ                                                      
; 196 | while (1) {                                                            
; 197 |         __R30 |= (1 << 12); // set PRU1.12                             
; 198 |         __R30 &= ~(1 << 12); // clear PRU1.12                          
; 200 | #endif                                                                 
; 202 | #ifdef TEST_WRITE_READ_DELAY                                           
; 203 | // measures total time between GPI out and GPUIO in.                   
; 204 | // should be 10ns, is 40ns !                                           
; 205 | // separate DATIN7 from 74LVTH, connect to PRU1.12                     
; 206 | while (1) {                                                            
;----------------------------------------------------------------------
        CLR       r30, r30, 0x0000000c  ; [ALU_PRU] |193| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L1||
;*
;*   Loop source line                : 206
;*   Loop closing brace source line  : 214
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L1||:    
;***	-----------------------g2:
;*** 207	-----------------------    __R30 |= 0x1000u;
	.dwpsn	file "pru1_buslatches.c",line 207,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 207 | __R30 |= (1 << 12); // set PRU1.12                                     
;----------------------------------------------------------------------
        SET       r30, r30, 0x0000000c  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L2||
;*
;*   Loop source line                : 208
;*   Loop closing brace source line  : 209
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L2||:    
;***	-----------------------g3:
;*** 208	-----------------------    if ( !(__R31&0x80u) ) goto g3;
	.dwpsn	file "pru1_buslatches.c",line 208,column 10,is_stmt,isa 0
;----------------------------------------------------------------------
; 208 | while (!(__R31 & 0x80))                                                
; 209 | ;// wait until readback on DATAIN7                                     
;----------------------------------------------------------------------
        QBBC      ||$C$L2||, r31, 0x07  ; [ALU_PRU] |208| 
;* --------------------------------------------------------------------------*
;*** 211	-----------------------    __R30 &= 0xffffefffu;
	.dwpsn	file "pru1_buslatches.c",line 211,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 211 | __R30 &= ~(1 << 12);// clear PRU1.12                                   
;----------------------------------------------------------------------
        CLR       r30, r30, 0x0000000c  ; [ALU_PRU] |211| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L3||
;*
;*   Loop source line                : 212
;*   Loop closing brace source line  : 213
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L3||:    
;***	-----------------------g5:
;*** 212	-----------------------    if ( !(__R31&0x80u) ) goto g2;
	.dwpsn	file "pru1_buslatches.c",line 212,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 212 | while (__R31 & 0x80)                                                   
; 213 | ;// wait until readback on DATAIN7                                     
; 215 | #endif                                                                 
; 217 | #ifdef TEST_CROSSTALK                                                  
; 218 | // const pattern of 00 ff 00 ff on latch inputs.                       
; 219 | // register selct causes fast switch of all 8 DATAIN.                  
; 220 | // Crosstalk on logic analyzers?                                       
; 221 | a = c = 0x00;                                                          
; 222 | b = d = 0xff;                                                          
; 223 | // read/write sequence: mix of read-read and read-write                
; 224 | buslatches_setbyte(2, a)                                               
; 225 | ;                                                                      
; 226 | buslatches_setbyte(3, b)                                               
; 227 | ;                                                                      
; 228 | buslatches_setbyte(5, c)                                               
; 229 | ;                                                                      
; 230 | buslatches_setbyte(6, d)                                               
; 231 | ;                                                                      
; 233 | while (mailbox.arm2pru_req == ARM2PRU_BUSLATCH_TEST) {                 
; 234 | uint8_t resvar;                                                        
; 235 | // echo DATA0 read only                                                
; 236 | buslatches_get2(2,resvar);                                             
; 237 | DEBUG_PIN_SET(buslatches_get(2) != a);                                 
; 238 | // buslatches_debug_set(resvar & 1);                                   
; 239 | buslatches_get2(3,resvar);                                             
; 240 | DEBUG_PIN_SET(buslatches_get(3) != b);                                 
; 241 | //buslatches_debug_set(resvar & 1);                                    
; 242 | buslatches_get2(5,resvar);                                             
; 243 | DEBUG_PIN_SET(buslatches_get(5) != c);                                 
; 244 | //buslatches_debug_set(resvar & 1);                                    
; 245 | buslatches_get2(6,resvar);                                             
; 246 | DEBUG_PIN_SET(buslatches_get(6) != d);                                 
; 247 | //buslatches_debug_set(resvar & 1);                                    
; 249 | #endif                                                                 
; 251 | #ifdef TEST_WRITE_READ_VERIFY                                          
; 252 | // write moving patterns into latches, read back and verify.           
; 253 | // PRU1.12 is set on mismatch                                          
; 254 | while (mailbox.arm2pru_req == ARM2PRU_BUSLATCH_TEST) {                 
; 256 | // read/write sequence: mix of read-read and read-write                
; 257 | buslatches_setbyte(2, a)                                               
; 258 | ;                                                                      
; 259 | buslatches_setbyte(3, b)                                               
; 260 | ;                                                                      
; 261 | buslatches_setbyte(5, c)                                               
; 262 | ;                                                                      
; 263 | if (buslatches_get(2) != a)                                            
; 264 | DEBUG_PIN_PULSE_100NS                                                  
; 265 | ;// show error flag. cleared by next reg_sel                           
; 266 | buslatches_setbyte(6, d)                                               
; 267 | ;                                                                      
; 268 | if (buslatches_get(3) != b)                                            
; 269 | DEBUG_PIN_PULSE_100NS;                                                 
; 270 | if (buslatches_get(5) != c)                                            
; 271 | DEBUG_PIN_PULSE_100NS;                                                 
; 272 | if (buslatches_get(6) != d)                                            
; 273 | DEBUG_PIN_PULSE_100NS;                                                 
; 274 | a++;                                                                   
; 275 | b++;                                                                   
; 276 | c++;                                                                   
; 277 | d++;                                                                   
; 279 | #endif                                                                 
;----------------------------------------------------------------------
        QBBC      ||$C$L1||, r31, 0x07  ; [ALU_PRU] |212| 
;* --------------------------------------------------------------------------*
;*** 212	-----------------------    goto g5;
        JMP       ||$C$L3||             ; [ALU_PRU] |212| 
;* --------------------------------------------------------------------------*
	.dwattr $C$DW$7, DW_AT_TI_end_file("pru1_buslatches.c")
	.dwattr $C$DW$7, DW_AT_TI_end_line(0x118)
	.dwattr $C$DW$7, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$7

	.sect	".text:buslatches_reset"
	.clink
	.global	||buslatches_reset||

$C$DW$12	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$12, DW_AT_name("buslatches_reset")
	.dwattr $C$DW$12, DW_AT_low_pc(||buslatches_reset||)
	.dwattr $C$DW$12, DW_AT_high_pc(0x00)
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("buslatches_reset")
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_TI_begin_file("pru1_buslatches.c")
	.dwattr $C$DW$12, DW_AT_TI_begin_line(0x2f)
	.dwattr $C$DW$12, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$12, DW_AT_decl_file("pru1_buslatches.c")
	.dwattr $C$DW$12, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$12, DW_AT_decl_column(0x06)
	.dwattr $C$DW$12, DW_AT_TI_max_frame_size(0x26)
	.dwpsn	file "pru1_buslatches.c",line 47,column 25,is_stmt,address ||buslatches_reset||,isa 0

	.dwfde $C$DW$CIE, ||buslatches_reset||
;----------------------------------------------------------------------
;  47 | void buslatches_reset() {                                              
;  48 | //      unsigned i;                                                    
;  49 | // chips are all 8bit width, but not all input/outputs are             
;  50 | // connected to bidirektional terminated UNIBUS lines.                 
;  51 | // see PCB schematic!                                                  
;  53 | // invalidate cached register_state                                    
;  54 | //      buslatches.cur_reg_sel = 0xff; // invalid                      
;  55 | //      buslatches.cur_reg_write = 1 ; // idle level is H              
;  57 | // init all outputs: UNIBUS lines now all H = inactive                 
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: buslatches_reset              FR SIZE:  38           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto, 38 SOE     *
;***************************************************************

||buslatches_reset||:
;* --------------------------------------------------------------------------*
;* r4_0  assigned to $O$C1
$C$DW$13	.dwtag  DW_TAG_variable
	.dwattr $C$DW$13, DW_AT_name("$O$C1")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$13, DW_AT_location[DW_OP_reg16]

;* r12_0 assigned to $O$C2
$C$DW$14	.dwtag  DW_TAG_variable
	.dwattr $C$DW$14, DW_AT_name("$O$C2")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$14, DW_AT_location[DW_OP_regx 0x30]

	.dwcfi	cfa_offset, 0
;*** 59	-----------------------    buslatches_pru0_dataout(31u);
;*** 59	-----------------------    __R30 = 0u;
;*** 59	-----------------------    *(C$1 = &buslatches) = 31u;
;*** 59	-----------------------    __delay_cycles(4u);
;*** 59	-----------------------    __R30 = 2048u;
;*** 60	-----------------------    buslatches_pru0_dataout(0u);
;*** 60	-----------------------    __R30 = 256u;
;*** 60	-----------------------    C$1[1] = C$2 = 0u;
;*** 60	-----------------------    __delay_cycles(4u);
;*** 60	-----------------------    __R30 = 2304u;
;*** 61	-----------------------    buslatches_pru0_dataout(0u);
;*** 61	-----------------------    __R30 = 512u;
;*** 61	-----------------------    __delay_cycles(6u);
;*** 61	-----------------------    __R30 = 2560u;
;*** 62	-----------------------    buslatches_pru0_dataout(0u);
;*** 62	-----------------------    __R30 = 768u;
;*** 62	-----------------------    __delay_cycles(6u);
;*** 62	-----------------------    __R30 = 2816u;
;*** 63	-----------------------    buslatches_pru0_dataout(0u);
;*** 63	-----------------------    __R30 = 1024u;
;*** 63	-----------------------    C$1[4] = C$2;
;*** 63	-----------------------    __delay_cycles(4u);
;*** 63	-----------------------    __R30 = 3072u;
;*** 64	-----------------------    buslatches_pru0_dataout(0u);
;*** 64	-----------------------    __R30 = 1280u;
;*** 64	-----------------------    __delay_cycles(6u);
;*** 64	-----------------------    __R30 = 3328u;
;*** 65	-----------------------    buslatches_pru0_dataout(0u);
;*** 65	-----------------------    __R30 = 1536u;
;*** 65	-----------------------    __delay_cycles(6u);
;*** 65	-----------------------    __R30 = 3584u;
;*** 66	-----------------------    buslatches_pru0_dataout(0u);
;*** 66	-----------------------    __R30 = 1792u;
;*** 66	-----------------------    C$1[7] = C$2;
;*** 66	-----------------------    __delay_cycles(4u);
;*** 66	-----------------------    __R30 = 3840u;
;***  	-----------------------    return;
        SUB       r2, r2, 0x26          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 38
	.dwpsn	file "pru1_buslatches.c",line 59,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  59 | buslatches_setbits(0, 0xff, 0x1f); // BG,NPG OUT: inactive = driver H =
;     |  UNIBUS L                                                              
;----------------------------------------------------------------------
        LDI       r14, 0x001f           ; [ALU_PRU] |59| 
        SBBO      &r3.b2, r2, 0, 38     ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -38
	.dwcfi	save_reg_to_mem, 15, -37
	.dwcfi	save_reg_to_mem, 16, -36
	.dwcfi	save_reg_to_mem, 17, -35
	.dwcfi	save_reg_to_mem, 18, -34
	.dwcfi	save_reg_to_mem, 19, -33
	.dwcfi	save_reg_to_mem, 20, -32
	.dwcfi	save_reg_to_mem, 21, -31
	.dwcfi	save_reg_to_mem, 22, -30
	.dwcfi	save_reg_to_mem, 23, -29
	.dwcfi	save_reg_to_mem, 24, -28
	.dwcfi	save_reg_to_mem, 25, -27
	.dwcfi	save_reg_to_mem, 26, -26
	.dwcfi	save_reg_to_mem, 27, -25
	.dwcfi	save_reg_to_mem, 28, -24
	.dwcfi	save_reg_to_mem, 29, -23
	.dwcfi	save_reg_to_mem, 30, -22
	.dwcfi	save_reg_to_mem, 31, -21
	.dwcfi	save_reg_to_mem, 32, -20
	.dwcfi	save_reg_to_mem, 33, -19
	.dwcfi	save_reg_to_mem, 34, -18
	.dwcfi	save_reg_to_mem, 35, -17
	.dwcfi	save_reg_to_mem, 36, -16
	.dwcfi	save_reg_to_mem, 37, -15
	.dwcfi	save_reg_to_mem, 38, -14
	.dwcfi	save_reg_to_mem, 39, -13
	.dwcfi	save_reg_to_mem, 40, -12
	.dwcfi	save_reg_to_mem, 41, -11
	.dwcfi	save_reg_to_mem, 42, -10
	.dwcfi	save_reg_to_mem, 43, -9
	.dwcfi	save_reg_to_mem, 44, -8
	.dwcfi	save_reg_to_mem, 45, -7
	.dwcfi	save_reg_to_mem, 46, -6
	.dwcfi	save_reg_to_mem, 47, -5
	.dwcfi	save_reg_to_mem, 48, -4
	.dwcfi	save_reg_to_mem, 49, -3
	.dwcfi	save_reg_to_mem, 50, -2
	.dwcfi	save_reg_to_mem, 51, -1
$C$DW$15	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$15, DW_AT_low_pc(0x00)
	.dwattr $C$DW$15, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$15, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |59| buslatches_pru0_dataout
        LDI       r4, ||buslatches||    ; [ALU_PRU] |59| $O$C1,buslatches
        LDI       r0.b0, 0x1f           ; [ALU_PRU] |59| 
        ZERO      &r30, 4               ; [ALU_PRU] |59| 
        SBBO      &r0.b0, r4, 0, 1      ; [ALU_PRU] |59| $O$C1
        .newblock
        LDI32    r12, 1
$1:     SUB      r12, r12, 1
        QBNE     $1, r12, 0            ; [ALU_PRU] |59| 
	.dwpsn	file "pru1_buslatches.c",line 60,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  60 | buslatches_setbits(1, 0xff, 0x00); // all other: inactive = driver L =
;     | UNIBUS H                                                               
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |60| 
	.dwpsn	file "pru1_buslatches.c",line 59,column 2,is_stmt,isa 0
        LDI       r30, 0x0800           ; [ALU_PRU] |59| 
	.dwpsn	file "pru1_buslatches.c",line 60,column 2,is_stmt,isa 0
$C$DW$16	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$16, DW_AT_low_pc(0x00)
	.dwattr $C$DW$16, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$16, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |60| buslatches_pru0_dataout
        LDI       r12.b0, 0x00          ; [ALU_PRU] |60| $O$C2
        LDI       r30, 0x0100           ; [ALU_PRU] |60| 
        SBBO      &r12.b0, r4, 1, 1     ; [ALU_PRU] |60| $O$C1,$O$C2
        .newblock
        LDI32    r11, 1
$1:     SUB      r11, r11, 1
        QBNE     $1, r11, 0            ; [ALU_PRU] |60| 
	.dwpsn	file "pru1_buslatches.c",line 61,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  61 | buslatches_setbyte(2, 0x00);                                           
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |61| 
	.dwpsn	file "pru1_buslatches.c",line 60,column 2,is_stmt,isa 0
        LDI       r30, 0x0900           ; [ALU_PRU] |60| 
	.dwpsn	file "pru1_buslatches.c",line 61,column 2,is_stmt,isa 0
$C$DW$17	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$17, DW_AT_low_pc(0x00)
	.dwattr $C$DW$17, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$17, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |61| buslatches_pru0_dataout
        LDI       r30, 0x0200           ; [ALU_PRU] |61| 
        .newblock
        LDI32    r10, 2
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |61| 
	.dwpsn	file "pru1_buslatches.c",line 62,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  62 | buslatches_setbyte(3, 0x00);                                           
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |62| 
	.dwpsn	file "pru1_buslatches.c",line 61,column 2,is_stmt,isa 0
        LDI       r30, 0x0a00           ; [ALU_PRU] |61| 
	.dwpsn	file "pru1_buslatches.c",line 62,column 2,is_stmt,isa 0
$C$DW$18	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$18, DW_AT_low_pc(0x00)
	.dwattr $C$DW$18, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$18, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |62| buslatches_pru0_dataout
        LDI       r30, 0x0300           ; [ALU_PRU] |62| 
        .newblock
        LDI32    r9, 2
$1:     SUB      r9, r9, 1
        QBNE     $1, r9, 0             ; [ALU_PRU] |62| 
	.dwpsn	file "pru1_buslatches.c",line 63,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  63 | buslatches_setbits(4, 0xff, 0x00);                                     
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |63| 
	.dwpsn	file "pru1_buslatches.c",line 62,column 2,is_stmt,isa 0
        LDI       r30, 0x0b00           ; [ALU_PRU] |62| 
	.dwpsn	file "pru1_buslatches.c",line 63,column 2,is_stmt,isa 0
$C$DW$19	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$19, DW_AT_low_pc(0x00)
	.dwattr $C$DW$19, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$19, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |63| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |63| 
        SBBO      &r12.b0, r4, 4, 1     ; [ALU_PRU] |63| $O$C1,$O$C2
        .newblock
        LDI32    r8, 1
$1:     SUB      r8, r8, 1
        QBNE     $1, r8, 0             ; [ALU_PRU] |63| 
	.dwpsn	file "pru1_buslatches.c",line 64,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  64 | buslatches_setbyte(5, 0x00);                                           
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |64| 
	.dwpsn	file "pru1_buslatches.c",line 63,column 2,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |63| 
	.dwpsn	file "pru1_buslatches.c",line 64,column 2,is_stmt,isa 0
$C$DW$20	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$20, DW_AT_low_pc(0x00)
	.dwattr $C$DW$20, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$20, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |64| buslatches_pru0_dataout
        LDI       r30, 0x0500           ; [ALU_PRU] |64| 
        .newblock
        LDI32    r7, 2
$1:     SUB      r7, r7, 1
        QBNE     $1, r7, 0             ; [ALU_PRU] |64| 
	.dwpsn	file "pru1_buslatches.c",line 65,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  65 | buslatches_setbyte(6, 0x00);                                           
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |65| 
	.dwpsn	file "pru1_buslatches.c",line 64,column 2,is_stmt,isa 0
        LDI       r30, 0x0d00           ; [ALU_PRU] |64| 
	.dwpsn	file "pru1_buslatches.c",line 65,column 2,is_stmt,isa 0
$C$DW$21	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$21, DW_AT_low_pc(0x00)
	.dwattr $C$DW$21, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$21, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |65| buslatches_pru0_dataout
        LDI       r30, 0x0600           ; [ALU_PRU] |65| 
        .newblock
        LDI32    r6, 2
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |65| 
	.dwpsn	file "pru1_buslatches.c",line 66,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  66 | buslatches_setbits(7, 0xff, 0x00);                                     
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |66| 
	.dwpsn	file "pru1_buslatches.c",line 65,column 2,is_stmt,isa 0
        LDI       r30, 0x0e00           ; [ALU_PRU] |65| 
	.dwpsn	file "pru1_buslatches.c",line 66,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  68 | // standard position: select register 4 with MSYN/SSYM                 
;  69 | // buslatches_setval(4, 0xff, 0x00);                                   
;----------------------------------------------------------------------
$C$DW$22	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$22, DW_AT_low_pc(0x00)
	.dwattr $C$DW$22, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$22, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |66| buslatches_pru0_dataout
        LDI       r30, 0x0700           ; [ALU_PRU] |66| 
        SBBO      &r12.b0, r4, 7, 1     ; [ALU_PRU] |66| $O$C1,$O$C2
        .newblock
        LDI32    r5, 1
$1:     SUB      r5, r5, 1
        QBNE     $1, r5, 0             ; [ALU_PRU] |66| 
        LDI       r30, 0x0f00           ; [ALU_PRU] |66| 
        LBBO      &r3.b2, r2, 0, 38     ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
	.dwcfi	restore_reg, 16
	.dwcfi	restore_reg, 17
	.dwcfi	restore_reg, 18
	.dwcfi	restore_reg, 19
	.dwcfi	restore_reg, 20
	.dwcfi	restore_reg, 21
	.dwcfi	restore_reg, 22
	.dwcfi	restore_reg, 23
	.dwcfi	restore_reg, 24
	.dwcfi	restore_reg, 25
	.dwcfi	restore_reg, 26
	.dwcfi	restore_reg, 27
	.dwcfi	restore_reg, 28
	.dwcfi	restore_reg, 29
	.dwcfi	restore_reg, 30
	.dwcfi	restore_reg, 31
	.dwcfi	restore_reg, 32
	.dwcfi	restore_reg, 33
	.dwcfi	restore_reg, 34
	.dwcfi	restore_reg, 35
	.dwcfi	restore_reg, 36
	.dwcfi	restore_reg, 37
	.dwcfi	restore_reg, 38
	.dwcfi	restore_reg, 39
	.dwcfi	restore_reg, 40
	.dwcfi	restore_reg, 41
	.dwcfi	restore_reg, 42
	.dwcfi	restore_reg, 43
	.dwcfi	restore_reg, 44
	.dwcfi	restore_reg, 45
	.dwcfi	restore_reg, 46
	.dwcfi	restore_reg, 47
	.dwcfi	restore_reg, 48
	.dwcfi	restore_reg, 49
	.dwcfi	restore_reg, 50
	.dwcfi	restore_reg, 51
        ADD       r2, r2, 0x26          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$23	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$23, DW_AT_low_pc(0x00)
	.dwattr $C$DW$23, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$12, DW_AT_TI_end_file("pru1_buslatches.c")
	.dwattr $C$DW$12, DW_AT_TI_end_line(0x46)
	.dwattr $C$DW$12, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$12

	.sect	".text:buslatches_powercycle"
	.clink
	.global	||buslatches_powercycle||

$C$DW$24	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$24, DW_AT_name("buslatches_powercycle")
	.dwattr $C$DW$24, DW_AT_low_pc(||buslatches_powercycle||)
	.dwattr $C$DW$24, DW_AT_high_pc(0x00)
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("buslatches_powercycle")
	.dwattr $C$DW$24, DW_AT_external
	.dwattr $C$DW$24, DW_AT_TI_begin_file("pru1_buslatches.c")
	.dwattr $C$DW$24, DW_AT_TI_begin_line(0xa1)
	.dwattr $C$DW$24, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$24, DW_AT_decl_file("pru1_buslatches.c")
	.dwattr $C$DW$24, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$24, DW_AT_decl_column(0x06)
	.dwattr $C$DW$24, DW_AT_TI_max_frame_size(0x23)
	.dwpsn	file "pru1_buslatches.c",line 161,column 30,is_stmt,address ||buslatches_powercycle||,isa 0

	.dwfde $C$DW$CIE, ||buslatches_powercycle||
;----------------------------------------------------------------------
; 161 | void buslatches_powercycle() {                                         
; 162 | // INIT: latch[7], bit 3                                               
; 163 | // ACLO: latch[7], bit 4                                               
; 164 | // DCLO: latch[7], bit 5                                               
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: buslatches_powercycle         FR SIZE:  35           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto, 35 SOE     *
;***************************************************************

||buslatches_powercycle||:
;* --------------------------------------------------------------------------*
;* r5_0  assigned to $O$C1
$C$DW$25	.dwtag  DW_TAG_variable
	.dwattr $C$DW$25, DW_AT_name("$O$C1")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$25, DW_AT_location[DW_OP_reg20]

;* r4_0  assigned to $O$C2
$C$DW$26	.dwtag  DW_TAG_variable
	.dwattr $C$DW$26, DW_AT_name("$O$C2")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$26, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$C3
$C$DW$27	.dwtag  DW_TAG_variable
	.dwattr $C$DW$27, DW_AT_name("$O$C3")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$27, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$C4
$C$DW$28	.dwtag  DW_TAG_variable
	.dwattr $C$DW$28, DW_AT_name("$O$C4")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("$O$C4")
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$28, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$C5
$C$DW$29	.dwtag  DW_TAG_variable
	.dwattr $C$DW$29, DW_AT_name("$O$C5")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("$O$C5")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$29, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to _tmpval
$C$DW$30	.dwtag  DW_TAG_variable
	.dwattr $C$DW$30, DW_AT_name("_tmpval")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$30, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to _tmpval
$C$DW$31	.dwtag  DW_TAG_variable
	.dwattr $C$DW$31, DW_AT_name("_tmpval")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to _tmpval
$C$DW$32	.dwtag  DW_TAG_variable
	.dwattr $C$DW$32, DW_AT_name("_tmpval")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to _tmpval
$C$DW$33	.dwtag  DW_TAG_variable
	.dwattr $C$DW$33, DW_AT_name("_tmpval")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg16]

	.dwcfi	cfa_offset, 0
;*** 165	-----------------------    _tmpval = C$5 = (unsigned char)(*(C$1 = &buslatches+7)|0x10);
;*** 165	-----------------------    buslatches_pru0_dataout((unsigned)C$5);
;*** 165	-----------------------    __R30 = 1792u;
;*** 165	-----------------------    *C$1 = _tmpval;
;*** 165	-----------------------    __delay_cycles(4u);
;*** 165	-----------------------    __R30 = 3840u;
;*** 166	-----------------------    __delay_cycles(0x2faf080u);
;*** 167	-----------------------    _tmpval = C$4 = (unsigned char)(*C$1|0x20);
;*** 167	-----------------------    buslatches_pru0_dataout((unsigned)C$4);
;*** 167	-----------------------    __R30 = 1792u;
;*** 167	-----------------------    *C$1 = _tmpval;
;*** 167	-----------------------    __delay_cycles(4u);
;*** 167	-----------------------    __R30 = 3840u;
;*** 168	-----------------------    __delay_cycles(0x2faf080u);
;*** 169	-----------------------    _tmpval = C$3 = (unsigned char)(*C$1&0xef);
;*** 169	-----------------------    buslatches_pru0_dataout((unsigned)C$3);
;*** 169	-----------------------    __R30 = 1792u;
;*** 169	-----------------------    *C$1 = _tmpval;
;*** 169	-----------------------    __delay_cycles(4u);
;*** 169	-----------------------    __R30 = 3840u;
;*** 170	-----------------------    __delay_cycles(0x2faf080u);
;*** 171	-----------------------    _tmpval = C$2 = (unsigned char)(*C$1&0xdf);
;*** 171	-----------------------    buslatches_pru0_dataout((unsigned)C$2);
;*** 171	-----------------------    __R30 = 1792u;
;*** 171	-----------------------    *C$1 = _tmpval;
;*** 171	-----------------------    __delay_cycles(4u);
;*** 171	-----------------------    __R30 = 3840u;
;***  	-----------------------    return;
        SUB       r2, r2, 0x23          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 35
        SBBO      &r3.b2, r2, 0, 3      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -35
	.dwcfi	save_reg_to_mem, 15, -34
	.dwcfi	save_reg_to_mem, 16, -33
        SBBO      &r5.b0, r2, 3, 32     ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 20, -32
	.dwcfi	save_reg_to_mem, 21, -31
	.dwcfi	save_reg_to_mem, 22, -30
	.dwcfi	save_reg_to_mem, 23, -29
	.dwcfi	save_reg_to_mem, 24, -28
	.dwcfi	save_reg_to_mem, 25, -27
	.dwcfi	save_reg_to_mem, 26, -26
	.dwcfi	save_reg_to_mem, 27, -25
	.dwcfi	save_reg_to_mem, 28, -24
	.dwcfi	save_reg_to_mem, 29, -23
	.dwcfi	save_reg_to_mem, 30, -22
	.dwcfi	save_reg_to_mem, 31, -21
	.dwcfi	save_reg_to_mem, 32, -20
	.dwcfi	save_reg_to_mem, 33, -19
	.dwcfi	save_reg_to_mem, 34, -18
	.dwcfi	save_reg_to_mem, 35, -17
	.dwcfi	save_reg_to_mem, 36, -16
	.dwcfi	save_reg_to_mem, 37, -15
	.dwcfi	save_reg_to_mem, 38, -14
	.dwcfi	save_reg_to_mem, 39, -13
	.dwcfi	save_reg_to_mem, 40, -12
	.dwcfi	save_reg_to_mem, 41, -11
	.dwcfi	save_reg_to_mem, 42, -10
	.dwcfi	save_reg_to_mem, 43, -9
	.dwcfi	save_reg_to_mem, 44, -8
	.dwcfi	save_reg_to_mem, 45, -7
	.dwcfi	save_reg_to_mem, 46, -6
	.dwcfi	save_reg_to_mem, 47, -5
	.dwcfi	save_reg_to_mem, 48, -4
	.dwcfi	save_reg_to_mem, 49, -3
	.dwcfi	save_reg_to_mem, 50, -2
	.dwcfi	save_reg_to_mem, 51, -1
	.dwpsn	file "pru1_buslatches.c",line 165,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 165 | buslatches_setbits(7, BIT(4), BIT(4)); // ACLO asserted                
;----------------------------------------------------------------------
        LDI       r5, ||buslatches||+7  ; [ALU_PRU] |165| $O$C1,buslatches
        LBBO      &r0.b0, r5, 0, 1      ; [ALU_PRU] |165| $O$C1
        SET       r4.b0, r0.b0, 0x00000004 ; [ALU_PRU] |165| $O$C5
        MOV       r14, r4.b0            ; [ALU_PRU] |165| $O$C5
$C$DW$34	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$34, DW_AT_low_pc(0x00)
	.dwattr $C$DW$34, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$34, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |165| buslatches_pru0_dataout
        LDI       r30, 0x0700           ; [ALU_PRU] |165| 
        SBBO      &r4.b0, r5, 0, 1      ; [ALU_PRU] |165| $O$C1,_tmpval
        .newblock
        LDI32    r12, 1
$1:     SUB      r12, r12, 1
        QBNE     $1, r12, 0            ; [ALU_PRU] |165| 
        LDI       r30, 0x0f00           ; [ALU_PRU] |165| 
	.dwpsn	file "pru1_buslatches.c",line 166,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 166 | __delay_cycles(MILLISECS(250)); // "power supply shuts down"           
;----------------------------------------------------------------------
        .newblock
        LDI32    r11, 24999999
$1:     SUB      r11, r11, 1
        QBNE     $1, r11, 0            ; [ALU_PRU] |166| 
	.dwpsn	file "pru1_buslatches.c",line 167,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 167 | buslatches_setbits(7, BIT(5), BIT(5)); // DCLO asserted                
;----------------------------------------------------------------------
        LBBO      &r0.b0, r5, 0, 1      ; [ALU_PRU] |167| $O$C1
        SET       r4.b0, r0.b0, 0x00000005 ; [ALU_PRU] |167| $O$C4
        MOV       r14, r4.b0            ; [ALU_PRU] |167| $O$C4
$C$DW$35	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$35, DW_AT_low_pc(0x00)
	.dwattr $C$DW$35, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$35, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |167| buslatches_pru0_dataout
        LDI       r30, 0x0700           ; [ALU_PRU] |167| 
        SBBO      &r4.b0, r5, 0, 1      ; [ALU_PRU] |167| $O$C1,_tmpval
        .newblock
        LDI32    r10, 1
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |167| 
        LDI       r30, 0x0f00           ; [ALU_PRU] |167| 
	.dwpsn	file "pru1_buslatches.c",line 168,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 168 | __delay_cycles(MILLISECS(250)); // "power is OFF now"                  
;----------------------------------------------------------------------
        .newblock
        LDI32    r9, 24999999
$1:     SUB      r9, r9, 1
        QBNE     $1, r9, 0             ; [ALU_PRU] |168| 
	.dwpsn	file "pru1_buslatches.c",line 169,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 169 | buslatches_setbits(7, BIT(4), 0); // ACLO deasserted                   
;----------------------------------------------------------------------
        LBBO      &r0.b0, r5, 0, 1      ; [ALU_PRU] |169| $O$C1
        AND       r4.b0, r0.b0, 0xef    ; [ALU_PRU] |169| $O$C3
        MOV       r14, r4.b0            ; [ALU_PRU] |169| $O$C3
$C$DW$36	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$36, DW_AT_low_pc(0x00)
	.dwattr $C$DW$36, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$36, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |169| buslatches_pru0_dataout
        LDI       r30, 0x0700           ; [ALU_PRU] |169| 
        SBBO      &r4.b0, r5, 0, 1      ; [ALU_PRU] |169| $O$C1,_tmpval
        .newblock
        LDI32    r8, 1
$1:     SUB      r8, r8, 1
        QBNE     $1, r8, 0             ; [ALU_PRU] |169| 
        LDI       r30, 0x0f00           ; [ALU_PRU] |169| 
	.dwpsn	file "pru1_buslatches.c",line 170,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 170 | __delay_cycles(MILLISECS(250)); // "power supply stabilizing"          
;----------------------------------------------------------------------
        .newblock
        LDI32    r7, 24999999
$1:     SUB      r7, r7, 1
        QBNE     $1, r7, 0             ; [ALU_PRU] |170| 
	.dwpsn	file "pru1_buslatches.c",line 171,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 171 | buslatches_setbits(7, BIT(5), 0); // DCLO deasserted                   
; 172 | // CPU has to generate INIT and BBSY                                   
;----------------------------------------------------------------------
        LBBO      &r0.b0, r5, 0, 1      ; [ALU_PRU] |171| $O$C1
        AND       r4.b0, r0.b0, 0xdf    ; [ALU_PRU] |171| $O$C2
        MOV       r14, r4.b0            ; [ALU_PRU] |171| $O$C2
$C$DW$37	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$37, DW_AT_low_pc(0x00)
	.dwattr $C$DW$37, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$37, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |171| buslatches_pru0_dataout
        LDI       r30, 0x0700           ; [ALU_PRU] |171| 
        SBBO      &r4.b0, r5, 0, 1      ; [ALU_PRU] |171| $O$C1,_tmpval
        .newblock
        LDI32    r6, 1
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |171| 
        LDI       r30, 0x0f00           ; [ALU_PRU] |171| 
        LBBO      &r3.b2, r2, 0, 3      ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
	.dwcfi	restore_reg, 16
        LBBO      &r5.b0, r2, 3, 32     ; [ALU_PRU] 
	.dwcfi	restore_reg, 20
	.dwcfi	restore_reg, 21
	.dwcfi	restore_reg, 22
	.dwcfi	restore_reg, 23
	.dwcfi	restore_reg, 24
	.dwcfi	restore_reg, 25
	.dwcfi	restore_reg, 26
	.dwcfi	restore_reg, 27
	.dwcfi	restore_reg, 28
	.dwcfi	restore_reg, 29
	.dwcfi	restore_reg, 30
	.dwcfi	restore_reg, 31
	.dwcfi	restore_reg, 32
	.dwcfi	restore_reg, 33
	.dwcfi	restore_reg, 34
	.dwcfi	restore_reg, 35
	.dwcfi	restore_reg, 36
	.dwcfi	restore_reg, 37
	.dwcfi	restore_reg, 38
	.dwcfi	restore_reg, 39
	.dwcfi	restore_reg, 40
	.dwcfi	restore_reg, 41
	.dwcfi	restore_reg, 42
	.dwcfi	restore_reg, 43
	.dwcfi	restore_reg, 44
	.dwcfi	restore_reg, 45
	.dwcfi	restore_reg, 46
	.dwcfi	restore_reg, 47
	.dwcfi	restore_reg, 48
	.dwcfi	restore_reg, 49
	.dwcfi	restore_reg, 50
	.dwcfi	restore_reg, 51
        ADD       r2, r2, 0x23          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$38	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$38, DW_AT_low_pc(0x00)
	.dwattr $C$DW$38, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$24, DW_AT_TI_end_file("pru1_buslatches.c")
	.dwattr $C$DW$24, DW_AT_TI_end_line(0xad)
	.dwattr $C$DW$24, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$24

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||buslatches_pru0_dataout||

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x04)
$C$DW$39	.dwtag  DW_TAG_member
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$39, DW_AT_name("REVID")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$39, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$39, DW_AT_bit_size(0x20)
	.dwattr $C$DW$39, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$39, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$39, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$39, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$39, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$19, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$19

$C$DW$T$40	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$40, DW_AT_type(*$C$DW$T$19)


$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x04)
$C$DW$40	.dwtag  DW_TAG_member
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$40, DW_AT_name("IDLE_MODE")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("IDLE_MODE")
	.dwattr $C$DW$40, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$40, DW_AT_bit_size(0x02)
	.dwattr $C$DW$40, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$40, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$40, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$40, DW_AT_decl_line(0x37)
	.dwattr $C$DW$40, DW_AT_decl_column(0x0d)

$C$DW$41	.dwtag  DW_TAG_member
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$41, DW_AT_name("STANDBY_MODE")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("STANDBY_MODE")
	.dwattr $C$DW$41, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$41, DW_AT_bit_size(0x02)
	.dwattr $C$DW$41, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$41, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$41, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$41, DW_AT_decl_line(0x38)
	.dwattr $C$DW$41, DW_AT_decl_column(0x0d)

$C$DW$42	.dwtag  DW_TAG_member
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$42, DW_AT_name("STANDBY_INIT")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("STANDBY_INIT")
	.dwattr $C$DW$42, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$42, DW_AT_bit_size(0x01)
	.dwattr $C$DW$42, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$42, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$42, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$42, DW_AT_decl_line(0x39)
	.dwattr $C$DW$42, DW_AT_decl_column(0x0d)

$C$DW$43	.dwtag  DW_TAG_member
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$43, DW_AT_name("SUB_MWAIT")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("SUB_MWAIT")
	.dwattr $C$DW$43, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$43, DW_AT_bit_size(0x01)
	.dwattr $C$DW$43, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$43, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$43, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$43, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$43, DW_AT_decl_column(0x0d)

$C$DW$44	.dwtag  DW_TAG_member
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$44, DW_AT_name("rsvd6")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("rsvd6")
	.dwattr $C$DW$44, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$44, DW_AT_bit_size(0x1a)
	.dwattr $C$DW$44, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$44, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$44, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$44, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$44, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$20, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$20

$C$DW$T$42	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$20)


$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x04)
$C$DW$45	.dwtag  DW_TAG_member
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$45, DW_AT_name("PRU0_GPI_MODE")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("PRU0_GPI_MODE")
	.dwattr $C$DW$45, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$45, DW_AT_bit_size(0x02)
	.dwattr $C$DW$45, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$45, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$45, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$45, DW_AT_decl_line(0x45)
	.dwattr $C$DW$45, DW_AT_decl_column(0x0d)

$C$DW$46	.dwtag  DW_TAG_member
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$46, DW_AT_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$46, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$46, DW_AT_bit_size(0x01)
	.dwattr $C$DW$46, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$46, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$46, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$46, DW_AT_decl_line(0x46)
	.dwattr $C$DW$46, DW_AT_decl_column(0x0d)

$C$DW$47	.dwtag  DW_TAG_member
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$47, DW_AT_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$47, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$47, DW_AT_bit_size(0x05)
	.dwattr $C$DW$47, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$47, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$47, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$47, DW_AT_decl_line(0x47)
	.dwattr $C$DW$47, DW_AT_decl_column(0x0d)

$C$DW$48	.dwtag  DW_TAG_member
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$48, DW_AT_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$48, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$48, DW_AT_bit_size(0x05)
	.dwattr $C$DW$48, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$48, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$48, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$48, DW_AT_decl_line(0x48)
	.dwattr $C$DW$48, DW_AT_decl_column(0x0d)

$C$DW$49	.dwtag  DW_TAG_member
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$49, DW_AT_name("PRU0_GPI_SB")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("PRU0_GPI_SB")
	.dwattr $C$DW$49, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$49, DW_AT_bit_size(0x01)
	.dwattr $C$DW$49, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$49, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$49, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$49, DW_AT_decl_line(0x49)
	.dwattr $C$DW$49, DW_AT_decl_column(0x0d)

$C$DW$50	.dwtag  DW_TAG_member
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$50, DW_AT_name("PRU0_GPO_MODE")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("PRU0_GPO_MODE")
	.dwattr $C$DW$50, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$50, DW_AT_bit_size(0x01)
	.dwattr $C$DW$50, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$50, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$50, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$50, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$50, DW_AT_decl_column(0x0d)

$C$DW$51	.dwtag  DW_TAG_member
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$51, DW_AT_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$51, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$51, DW_AT_bit_size(0x05)
	.dwattr $C$DW$51, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$51, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$51, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$51, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$51, DW_AT_decl_column(0x0d)

$C$DW$52	.dwtag  DW_TAG_member
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$52, DW_AT_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$52, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$52, DW_AT_bit_size(0x05)
	.dwattr $C$DW$52, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$52, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$52, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$52, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$52, DW_AT_decl_column(0x0d)

$C$DW$53	.dwtag  DW_TAG_member
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$53, DW_AT_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$53, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$53, DW_AT_bit_size(0x01)
	.dwattr $C$DW$53, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$53, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$53, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$53, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$53, DW_AT_decl_column(0x0d)

$C$DW$54	.dwtag  DW_TAG_member
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$54, DW_AT_name("rsvd26")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$54, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$54, DW_AT_bit_size(0x06)
	.dwattr $C$DW$54, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$54, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$54, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$54, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$54, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$21, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$21

$C$DW$T$44	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$44, DW_AT_type(*$C$DW$T$21)


$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x04)
$C$DW$55	.dwtag  DW_TAG_member
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$55, DW_AT_name("PRU1_GPI_MODE")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("PRU1_GPI_MODE")
	.dwattr $C$DW$55, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$55, DW_AT_bit_size(0x02)
	.dwattr $C$DW$55, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$55, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$55, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$55, DW_AT_decl_line(0x58)
	.dwattr $C$DW$55, DW_AT_decl_column(0x0d)

$C$DW$56	.dwtag  DW_TAG_member
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$56, DW_AT_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$56, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$56, DW_AT_bit_size(0x01)
	.dwattr $C$DW$56, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$56, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$56, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$56, DW_AT_decl_line(0x59)
	.dwattr $C$DW$56, DW_AT_decl_column(0x0d)

$C$DW$57	.dwtag  DW_TAG_member
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$57, DW_AT_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$57, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$57, DW_AT_bit_size(0x05)
	.dwattr $C$DW$57, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$57, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$57, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$57, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$57, DW_AT_decl_column(0x0d)

$C$DW$58	.dwtag  DW_TAG_member
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$58, DW_AT_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$58, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$58, DW_AT_bit_size(0x05)
	.dwattr $C$DW$58, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$58, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$58, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$58, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$58, DW_AT_decl_column(0x0d)

$C$DW$59	.dwtag  DW_TAG_member
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$59, DW_AT_name("PRU1_GPI_SB")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("PRU1_GPI_SB")
	.dwattr $C$DW$59, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$59, DW_AT_bit_size(0x01)
	.dwattr $C$DW$59, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$59, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$59, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$59, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$59, DW_AT_decl_column(0x0d)

$C$DW$60	.dwtag  DW_TAG_member
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$60, DW_AT_name("PRU1_GPO_MODE")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("PRU1_GPO_MODE")
	.dwattr $C$DW$60, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$60, DW_AT_bit_size(0x01)
	.dwattr $C$DW$60, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$60, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$60, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$60, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$60, DW_AT_decl_column(0x0d)

$C$DW$61	.dwtag  DW_TAG_member
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$61, DW_AT_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$61, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$61, DW_AT_bit_size(0x05)
	.dwattr $C$DW$61, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$61, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$61, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$61, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$61, DW_AT_decl_column(0x0d)

$C$DW$62	.dwtag  DW_TAG_member
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$62, DW_AT_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$62, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$62, DW_AT_bit_size(0x05)
	.dwattr $C$DW$62, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$62, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$62, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$62, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$62, DW_AT_decl_column(0x0d)

$C$DW$63	.dwtag  DW_TAG_member
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$63, DW_AT_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$63, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$63, DW_AT_bit_size(0x01)
	.dwattr $C$DW$63, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$63, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$63, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$63, DW_AT_decl_line(0x60)
	.dwattr $C$DW$63, DW_AT_decl_column(0x0d)

$C$DW$64	.dwtag  DW_TAG_member
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$64, DW_AT_name("rsvd26")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$64, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$64, DW_AT_bit_size(0x06)
	.dwattr $C$DW$64, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$64, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$64, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$64, DW_AT_decl_line(0x61)
	.dwattr $C$DW$64, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$22, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$22

$C$DW$T$46	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$22)


$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x04)
$C$DW$65	.dwtag  DW_TAG_member
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$65, DW_AT_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$65, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$65, DW_AT_bit_size(0x01)
	.dwattr $C$DW$65, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$65, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$65, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$65, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$65, DW_AT_decl_column(0x0d)

$C$DW$66	.dwtag  DW_TAG_member
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$66, DW_AT_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$66, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$66, DW_AT_bit_size(0x01)
	.dwattr $C$DW$66, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$66, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$66, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$66, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$66, DW_AT_decl_column(0x0d)

$C$DW$67	.dwtag  DW_TAG_member
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$67, DW_AT_name("PRU0_CLK_EN")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("PRU0_CLK_EN")
	.dwattr $C$DW$67, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$67, DW_AT_bit_size(0x01)
	.dwattr $C$DW$67, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$67, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$67, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$67, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$67, DW_AT_decl_column(0x0d)

$C$DW$68	.dwtag  DW_TAG_member
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$68, DW_AT_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$68, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$68, DW_AT_bit_size(0x01)
	.dwattr $C$DW$68, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$68, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$68, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$68, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$68, DW_AT_decl_column(0x0d)

$C$DW$69	.dwtag  DW_TAG_member
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$69, DW_AT_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$69, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$69, DW_AT_bit_size(0x01)
	.dwattr $C$DW$69, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$69, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$69, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$69, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$69, DW_AT_decl_column(0x0d)

$C$DW$70	.dwtag  DW_TAG_member
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$70, DW_AT_name("PRU1_CLK_EN")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("PRU1_CLK_EN")
	.dwattr $C$DW$70, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$70, DW_AT_bit_size(0x01)
	.dwattr $C$DW$70, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$70, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$70, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$70, DW_AT_decl_line(0x70)
	.dwattr $C$DW$70, DW_AT_decl_column(0x0d)

$C$DW$71	.dwtag  DW_TAG_member
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$71, DW_AT_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$71, DW_AT_bit_offset(0x19)
	.dwattr $C$DW$71, DW_AT_bit_size(0x01)
	.dwattr $C$DW$71, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$71, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$71, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$71, DW_AT_decl_line(0x71)
	.dwattr $C$DW$71, DW_AT_decl_column(0x0d)

$C$DW$72	.dwtag  DW_TAG_member
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$72, DW_AT_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$72, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$72, DW_AT_bit_size(0x01)
	.dwattr $C$DW$72, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$72, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$72, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$72, DW_AT_decl_line(0x72)
	.dwattr $C$DW$72, DW_AT_decl_column(0x0d)

$C$DW$73	.dwtag  DW_TAG_member
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$73, DW_AT_name("INTC_CLK_EN")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("INTC_CLK_EN")
	.dwattr $C$DW$73, DW_AT_bit_offset(0x17)
	.dwattr $C$DW$73, DW_AT_bit_size(0x01)
	.dwattr $C$DW$73, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$73, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$73, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$73, DW_AT_decl_line(0x73)
	.dwattr $C$DW$73, DW_AT_decl_column(0x0d)

$C$DW$74	.dwtag  DW_TAG_member
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$74, DW_AT_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$74, DW_AT_bit_offset(0x16)
	.dwattr $C$DW$74, DW_AT_bit_size(0x01)
	.dwattr $C$DW$74, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$74, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$74, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$74, DW_AT_decl_line(0x74)
	.dwattr $C$DW$74, DW_AT_decl_column(0x0d)

$C$DW$75	.dwtag  DW_TAG_member
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$75, DW_AT_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$75, DW_AT_bit_offset(0x15)
	.dwattr $C$DW$75, DW_AT_bit_size(0x01)
	.dwattr $C$DW$75, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$75, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$75, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$75, DW_AT_decl_line(0x75)
	.dwattr $C$DW$75, DW_AT_decl_column(0x0d)

$C$DW$76	.dwtag  DW_TAG_member
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$76, DW_AT_name("UART_CLK_EN")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("UART_CLK_EN")
	.dwattr $C$DW$76, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$76, DW_AT_bit_size(0x01)
	.dwattr $C$DW$76, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$76, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$76, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$76, DW_AT_decl_line(0x76)
	.dwattr $C$DW$76, DW_AT_decl_column(0x0d)

$C$DW$77	.dwtag  DW_TAG_member
	.dwattr $C$DW$77, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$77, DW_AT_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$77, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$77, DW_AT_bit_size(0x01)
	.dwattr $C$DW$77, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$77, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$77, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$77, DW_AT_decl_line(0x77)
	.dwattr $C$DW$77, DW_AT_decl_column(0x0d)

$C$DW$78	.dwtag  DW_TAG_member
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$78, DW_AT_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$78, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$78, DW_AT_bit_size(0x01)
	.dwattr $C$DW$78, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$78, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$78, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$78, DW_AT_decl_line(0x78)
	.dwattr $C$DW$78, DW_AT_decl_column(0x0d)

$C$DW$79	.dwtag  DW_TAG_member
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$79, DW_AT_name("ECAP_CLK_EN")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("ECAP_CLK_EN")
	.dwattr $C$DW$79, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$79, DW_AT_bit_size(0x01)
	.dwattr $C$DW$79, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$79, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$79, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$79, DW_AT_decl_line(0x79)
	.dwattr $C$DW$79, DW_AT_decl_column(0x0d)

$C$DW$80	.dwtag  DW_TAG_member
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$80, DW_AT_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$80, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$80, DW_AT_bit_size(0x01)
	.dwattr $C$DW$80, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$80, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$80, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$80, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$80, DW_AT_decl_column(0x0d)

$C$DW$81	.dwtag  DW_TAG_member
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$81, DW_AT_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$81, DW_AT_bit_offset(0x0f)
	.dwattr $C$DW$81, DW_AT_bit_size(0x01)
	.dwattr $C$DW$81, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$81, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$81, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$81, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$81, DW_AT_decl_column(0x0d)

$C$DW$82	.dwtag  DW_TAG_member
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$82, DW_AT_name("IEP_CLK_EN")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("IEP_CLK_EN")
	.dwattr $C$DW$82, DW_AT_bit_offset(0x0e)
	.dwattr $C$DW$82, DW_AT_bit_size(0x01)
	.dwattr $C$DW$82, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$82, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$82, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$82, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$82, DW_AT_decl_column(0x0d)

$C$DW$83	.dwtag  DW_TAG_member
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$83, DW_AT_name("rsvd18")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("rsvd18")
	.dwattr $C$DW$83, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$83, DW_AT_bit_size(0x0e)
	.dwattr $C$DW$83, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$83, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$83, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$83, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$83, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$23, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$23

$C$DW$T$48	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$23)


$C$DW$T$24	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x04)
$C$DW$84	.dwtag  DW_TAG_member
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$84, DW_AT_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$84, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$84, DW_AT_bit_size(0x04)
	.dwattr $C$DW$84, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$84, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$84, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$84, DW_AT_decl_line(0x87)
	.dwattr $C$DW$84, DW_AT_decl_column(0x0d)

$C$DW$85	.dwtag  DW_TAG_member
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$85, DW_AT_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$85, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$85, DW_AT_bit_size(0x04)
	.dwattr $C$DW$85, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$85, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$85, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$85, DW_AT_decl_line(0x88)
	.dwattr $C$DW$85, DW_AT_decl_column(0x0d)

$C$DW$86	.dwtag  DW_TAG_member
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$86, DW_AT_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$86, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$86, DW_AT_bit_size(0x04)
	.dwattr $C$DW$86, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$86, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$86, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$86, DW_AT_decl_line(0x89)
	.dwattr $C$DW$86, DW_AT_decl_column(0x0d)

$C$DW$87	.dwtag  DW_TAG_member
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$87, DW_AT_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$87, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$87, DW_AT_bit_size(0x04)
	.dwattr $C$DW$87, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$87, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$87, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$87, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$87, DW_AT_decl_column(0x0d)

$C$DW$88	.dwtag  DW_TAG_member
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$88, DW_AT_name("RAM_PE_RAW")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("RAM_PE_RAW")
	.dwattr $C$DW$88, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$88, DW_AT_bit_size(0x04)
	.dwattr $C$DW$88, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$88, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$88, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$88, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$88, DW_AT_decl_column(0x0d)

$C$DW$89	.dwtag  DW_TAG_member
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$89, DW_AT_name("rsvd20")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$89, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$89, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$89, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$89, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$89, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$89, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$89, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$24, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x86)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$24

$C$DW$T$50	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$24)


$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x04)
$C$DW$90	.dwtag  DW_TAG_member
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$90, DW_AT_name("PRU0_IMEM_PE")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("PRU0_IMEM_PE")
	.dwattr $C$DW$90, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$90, DW_AT_bit_size(0x04)
	.dwattr $C$DW$90, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$90, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$90, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$90, DW_AT_decl_line(0x96)
	.dwattr $C$DW$90, DW_AT_decl_column(0x0d)

$C$DW$91	.dwtag  DW_TAG_member
	.dwattr $C$DW$91, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$91, DW_AT_name("PRU0_DMEM_PE")
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("PRU0_DMEM_PE")
	.dwattr $C$DW$91, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$91, DW_AT_bit_size(0x04)
	.dwattr $C$DW$91, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$91, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$91, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$91, DW_AT_decl_line(0x97)
	.dwattr $C$DW$91, DW_AT_decl_column(0x0d)

$C$DW$92	.dwtag  DW_TAG_member
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$92, DW_AT_name("PRU1_IMEM_PE")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("PRU1_IMEM_PE")
	.dwattr $C$DW$92, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$92, DW_AT_bit_size(0x04)
	.dwattr $C$DW$92, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$92, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$92, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$92, DW_AT_decl_line(0x98)
	.dwattr $C$DW$92, DW_AT_decl_column(0x0d)

$C$DW$93	.dwtag  DW_TAG_member
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$93, DW_AT_name("PRU1_DMEM_PE")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("PRU1_DMEM_PE")
	.dwattr $C$DW$93, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$93, DW_AT_bit_size(0x04)
	.dwattr $C$DW$93, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$93, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$93, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$93, DW_AT_decl_line(0x99)
	.dwattr $C$DW$93, DW_AT_decl_column(0x0d)

$C$DW$94	.dwtag  DW_TAG_member
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$94, DW_AT_name("RAM_PE")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("RAM_PE")
	.dwattr $C$DW$94, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$94, DW_AT_bit_size(0x04)
	.dwattr $C$DW$94, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$94, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$94, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$94, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$94, DW_AT_decl_column(0x0d)

$C$DW$95	.dwtag  DW_TAG_member
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$95, DW_AT_name("rsvd20")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$95, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$95, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$95, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$95, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$95, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$95, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$95, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$25, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$25

$C$DW$T$52	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$25)


$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x04)
$C$DW$96	.dwtag  DW_TAG_member
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$96, DW_AT_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$96, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$96, DW_AT_bit_size(0x04)
	.dwattr $C$DW$96, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$96, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$96, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$96, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$96, DW_AT_decl_column(0x0d)

$C$DW$97	.dwtag  DW_TAG_member
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$97, DW_AT_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$97, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$97, DW_AT_bit_size(0x04)
	.dwattr $C$DW$97, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$97, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$97, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$97, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$97, DW_AT_decl_column(0x0d)

$C$DW$98	.dwtag  DW_TAG_member
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$98, DW_AT_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$98, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$98, DW_AT_bit_size(0x04)
	.dwattr $C$DW$98, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$98, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$98, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$98, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$98, DW_AT_decl_column(0x0d)

$C$DW$99	.dwtag  DW_TAG_member
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$99, DW_AT_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$99, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$99, DW_AT_bit_size(0x04)
	.dwattr $C$DW$99, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$99, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$99, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$99, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$99, DW_AT_decl_column(0x0d)

$C$DW$100	.dwtag  DW_TAG_member
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$100, DW_AT_name("RAM_PE_SET")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("RAM_PE_SET")
	.dwattr $C$DW$100, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$100, DW_AT_bit_size(0x04)
	.dwattr $C$DW$100, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$100, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$100, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$100, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$100, DW_AT_decl_column(0x0d)

$C$DW$101	.dwtag  DW_TAG_member
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$101, DW_AT_name("rsvd20")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$101, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$101, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$101, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$101, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$101, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$101, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$101, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$26, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$26

$C$DW$T$54	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$54, DW_AT_type(*$C$DW$T$26)


$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x04)
$C$DW$102	.dwtag  DW_TAG_member
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$102, DW_AT_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$102, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$102, DW_AT_bit_size(0x04)
	.dwattr $C$DW$102, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$102, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$102, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$102, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$102, DW_AT_decl_column(0x0d)

$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$103, DW_AT_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$103, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$103, DW_AT_bit_size(0x04)
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$103, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$103, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$103, DW_AT_decl_column(0x0d)

$C$DW$104	.dwtag  DW_TAG_member
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$104, DW_AT_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$104, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$104, DW_AT_bit_size(0x04)
	.dwattr $C$DW$104, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$104, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$104, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$104, DW_AT_decl_column(0x0d)

$C$DW$105	.dwtag  DW_TAG_member
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$105, DW_AT_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$105, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$105, DW_AT_bit_size(0x04)
	.dwattr $C$DW$105, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$105, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$105, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$105, DW_AT_decl_column(0x0d)

$C$DW$106	.dwtag  DW_TAG_member
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$106, DW_AT_name("rsvd16")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$106, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$106, DW_AT_bit_size(0x10)
	.dwattr $C$DW$106, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$106, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$106, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$106, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$27, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$27

$C$DW$T$56	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$56, DW_AT_type(*$C$DW$T$27)


$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x04)
$C$DW$107	.dwtag  DW_TAG_member
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$107, DW_AT_name("PMAO_PRU0")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("PMAO_PRU0")
	.dwattr $C$DW$107, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$107, DW_AT_bit_size(0x01)
	.dwattr $C$DW$107, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$107, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$107, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$107, DW_AT_decl_column(0x0d)

$C$DW$108	.dwtag  DW_TAG_member
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$108, DW_AT_name("PMAO_PRU1")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("PMAO_PRU1")
	.dwattr $C$DW$108, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$108, DW_AT_bit_size(0x01)
	.dwattr $C$DW$108, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$108, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$108, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$108, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$108, DW_AT_decl_column(0x0d)

$C$DW$109	.dwtag  DW_TAG_member
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$109, DW_AT_name("rsvd2")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$109, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$109, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$109, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$109, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$109, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$109, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$109, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$28, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$28

$C$DW$T$58	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$58, DW_AT_type(*$C$DW$T$28)


$C$DW$T$29	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x04)
$C$DW$110	.dwtag  DW_TAG_member
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$110, DW_AT_name("OCP_EN")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("OCP_EN")
	.dwattr $C$DW$110, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$110, DW_AT_bit_size(0x01)
	.dwattr $C$DW$110, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$110, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$110, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$110, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$110, DW_AT_decl_column(0x0d)

$C$DW$111	.dwtag  DW_TAG_member
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$111, DW_AT_name("rsvd1")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$111, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$111, DW_AT_bit_size(0x1f)
	.dwattr $C$DW$111, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$111, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$111, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$111, DW_AT_decl_line(0xd4)
	.dwattr $C$DW$111, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$29, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$29, DW_AT_decl_line(0xd2)
	.dwattr $C$DW$T$29, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$29

$C$DW$T$60	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$29)


$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x04)
$C$DW$112	.dwtag  DW_TAG_member
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$112, DW_AT_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$112, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$112, DW_AT_bit_size(0x01)
	.dwattr $C$DW$112, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$112, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$112, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$112, DW_AT_decl_line(0xde)
	.dwattr $C$DW$112, DW_AT_decl_column(0x0d)

$C$DW$113	.dwtag  DW_TAG_member
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$113, DW_AT_name("XFR_SHIFT_EN")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("XFR_SHIFT_EN")
	.dwattr $C$DW$113, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$113, DW_AT_bit_size(0x01)
	.dwattr $C$DW$113, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$113, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$113, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$113, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$113, DW_AT_decl_column(0x0d)

$C$DW$114	.dwtag  DW_TAG_member
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$114, DW_AT_name("rsvd2")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$114, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$114, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$114, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$114, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$114, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$114, DW_AT_decl_line(0xe0)
	.dwattr $C$DW$114, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$30, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$30

$C$DW$T$62	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$30)


$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x04)
$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$115, DW_AT_name("PIN_MUX_SEL")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("PIN_MUX_SEL")
	.dwattr $C$DW$115, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$115, DW_AT_bit_size(0x08)
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$115, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$115, DW_AT_decl_line(0xec)
	.dwattr $C$DW$115, DW_AT_decl_column(0x0d)

$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$116, DW_AT_name("rsvd2")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$116, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$116, DW_AT_bit_size(0x18)
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$116, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$116, DW_AT_decl_line(0xed)
	.dwattr $C$DW$116, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$31, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$31

$C$DW$T$64	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$31)


$C$DW$T$35	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x44)
$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$117, DW_AT_name("$P$T0")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$117, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$117, DW_AT_decl_line(0x29)
	.dwattr $C$DW$117, DW_AT_decl_column(0x02)

$C$DW$118	.dwtag  DW_TAG_member
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$118, DW_AT_name("$P$T1")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$118, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$118, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$118, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$118, DW_AT_decl_line(0x33)
	.dwattr $C$DW$118, DW_AT_decl_column(0x02)

$C$DW$119	.dwtag  DW_TAG_member
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$119, DW_AT_name("$P$T2")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$119, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$119, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$119, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$119, DW_AT_decl_line(0x41)
	.dwattr $C$DW$119, DW_AT_decl_column(0x02)

$C$DW$120	.dwtag  DW_TAG_member
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$120, DW_AT_name("$P$T3")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$120, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$120, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$120, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$120, DW_AT_decl_line(0x54)
	.dwattr $C$DW$120, DW_AT_decl_column(0x02)

$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$121, DW_AT_name("$P$T4")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$121, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$121, DW_AT_decl_line(0x67)
	.dwattr $C$DW$121, DW_AT_decl_column(0x02)

$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$122, DW_AT_name("$P$T5")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$122, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$122, DW_AT_decl_line(0x83)
	.dwattr $C$DW$122, DW_AT_decl_column(0x02)

$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$123, DW_AT_name("$P$T6")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$123, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$123, DW_AT_decl_line(0x92)
	.dwattr $C$DW$123, DW_AT_decl_column(0x02)

$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$124, DW_AT_name("$P$T7")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$124, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$124, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$124, DW_AT_decl_column(0x02)

$C$DW$125	.dwtag  DW_TAG_member
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$125, DW_AT_name("$P$T8")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$125, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$125, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$125, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$125, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$125, DW_AT_decl_column(0x02)

$C$DW$126	.dwtag  DW_TAG_member
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$126, DW_AT_name("rsvd24")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$126, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$126, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$126, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$126, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$126, DW_AT_decl_column(0x0b)

$C$DW$127	.dwtag  DW_TAG_member
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$127, DW_AT_name("$P$T9")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("$P$T9")
	.dwattr $C$DW$127, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$127, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$127, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$127, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$127, DW_AT_decl_column(0x02)

$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$128, DW_AT_name("rsvd2c")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("rsvd2c")
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$128, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$128, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$128, DW_AT_decl_column(0x0b)

$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$129, DW_AT_name("$P$T10")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("$P$T10")
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$129, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$129, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$129, DW_AT_decl_column(0x02)

$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$130, DW_AT_name("$P$T11")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("$P$T11")
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$130, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$130, DW_AT_decl_line(0xda)
	.dwattr $C$DW$130, DW_AT_decl_column(0x02)

$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$131, DW_AT_name("rsvd38")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("rsvd38")
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$131, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$131, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$131, DW_AT_decl_column(0x0b)

$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$132, DW_AT_name("$P$T12")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("$P$T12")
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$132, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$132, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$132, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$35, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$35

$C$DW$T$69	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$69, DW_AT_name("pruCfg")
	.dwattr $C$DW$T$69, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$69, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$69, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0xf0)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x03)

$C$DW$T$70	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$70, DW_AT_type(*$C$DW$T$69)


$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x10)
$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$133, DW_AT_name("cur_reg_val")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("cur_reg_val")
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$133, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$133, DW_AT_decl_line(0x22)
	.dwattr $C$DW$133, DW_AT_decl_column(0x0a)

$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$134, DW_AT_name("bidi_bitwidth")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("bidi_bitwidth")
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$134, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$134, DW_AT_decl_line(0x26)
	.dwattr $C$DW$134, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$38, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$T$38, DW_AT_decl_line(0x21)
	.dwattr $C$DW$T$38, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$38

$C$DW$T$72	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$72, DW_AT_name("buslatches_t")
	.dwattr $C$DW$T$72, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$72, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$72, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x03)


$C$DW$T$41	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x04)
$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$135, DW_AT_name("REVID")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$135, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$135, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$135, DW_AT_decl_column(0x15)

$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$136, DW_AT_name("REVID_bit")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$136, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$136, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$136, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$41, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$41


$C$DW$T$43	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$43, DW_AT_byte_size(0x04)
$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$137, DW_AT_name("SYSCFG")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("SYSCFG")
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$137, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$137, DW_AT_decl_line(0x34)
	.dwattr $C$DW$137, DW_AT_decl_column(0x15)

$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$138, DW_AT_name("SYSCFG_bit")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("SYSCFG_bit")
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$138, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$138, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$138, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$43, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$43


$C$DW$T$45	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$45, DW_AT_byte_size(0x04)
$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$139, DW_AT_name("GPCFG0")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("GPCFG0")
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$139, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$139, DW_AT_decl_line(0x42)
	.dwattr $C$DW$139, DW_AT_decl_column(0x15)

$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$140, DW_AT_name("GPCFG0_bit")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("GPCFG0_bit")
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$140, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$140, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$140, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$45, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$45, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$45, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$45


$C$DW$T$47	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x04)
$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$141, DW_AT_name("GPCFG1")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("GPCFG1")
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$141, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$141, DW_AT_decl_line(0x55)
	.dwattr $C$DW$141, DW_AT_decl_column(0x15)

$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$142, DW_AT_name("GPCFG1_bit")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("GPCFG1_bit")
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$142, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$142, DW_AT_decl_line(0x62)
	.dwattr $C$DW$142, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$47, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$47


$C$DW$T$49	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x04)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$143, DW_AT_name("CGR")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("CGR")
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$143, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$143, DW_AT_decl_line(0x68)
	.dwattr $C$DW$143, DW_AT_decl_column(0x15)

$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$48)
	.dwattr $C$DW$144, DW_AT_name("CGR_bit")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("CGR_bit")
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$144, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$144, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$144, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$49, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$49, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$49, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$49


$C$DW$T$51	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$51, DW_AT_byte_size(0x04)
$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$145, DW_AT_name("ISRP")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("ISRP")
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$145, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$145, DW_AT_decl_line(0x84)
	.dwattr $C$DW$145, DW_AT_decl_column(0x15)

$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$146, DW_AT_name("ISRP_bit")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("ISRP_bit")
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$146, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$146, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$146, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$51, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$51, DW_AT_decl_line(0x83)
	.dwattr $C$DW$T$51, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$51


$C$DW$T$53	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x04)
$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$147, DW_AT_name("ISP")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("ISP")
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$147, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$147, DW_AT_decl_line(0x93)
	.dwattr $C$DW$147, DW_AT_decl_column(0x15)

$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$148, DW_AT_name("ISP_bit")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("ISP_bit")
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$148, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$148, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$148, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$53, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x92)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$53


$C$DW$T$55	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$55, DW_AT_byte_size(0x04)
$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$149, DW_AT_name("IESP")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("IESP")
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$149, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$149, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$149, DW_AT_decl_column(0x15)

$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$150, DW_AT_name("IESP_bit")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("IESP_bit")
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$150, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$150, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$150, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$55, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$55, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$55, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$55


$C$DW$T$57	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$57, DW_AT_byte_size(0x04)
$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$151, DW_AT_name("IECP")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("IECP")
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$151, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$151, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$151, DW_AT_decl_column(0x15)

$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$152, DW_AT_name("IECP_bit")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("IECP_bit")
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$152, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$152, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$152, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$57, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$57, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$57, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$57


$C$DW$T$59	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$59, DW_AT_byte_size(0x04)
$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$153, DW_AT_name("PMAO")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("PMAO")
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$153, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$153, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$153, DW_AT_decl_column(0x15)

$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$154, DW_AT_name("PMAO_bit")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("PMAO_bit")
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$154, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$154, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$154, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$59, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$59


$C$DW$T$61	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$61, DW_AT_byte_size(0x04)
$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$155, DW_AT_name("IEPCLK")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("IEPCLK")
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$155, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$155, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$155, DW_AT_decl_column(0x15)

$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$156, DW_AT_name("IEPCLK_bit")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("IEPCLK_bit")
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$156, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$156, DW_AT_decl_line(0xd5)
	.dwattr $C$DW$156, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$61, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$61


$C$DW$T$63	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x04)
$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$157, DW_AT_name("SPP")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("SPP")
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$157, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$157, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$157, DW_AT_decl_column(0x15)

$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$158, DW_AT_name("SPP_bit")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("SPP_bit")
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$158, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$158, DW_AT_decl_line(0xe1)
	.dwattr $C$DW$158, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$63, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0xda)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$63


$C$DW$T$65	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$65, DW_AT_byte_size(0x04)
$C$DW$159	.dwtag  DW_TAG_member
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$159, DW_AT_name("PIN_MX")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("PIN_MX")
	.dwattr $C$DW$159, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$159, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$159, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$159, DW_AT_decl_column(0x15)

$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$64)
	.dwattr $C$DW$160, DW_AT_name("PIN_MX_bit")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("PIN_MX_bit")
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$160, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$160, DW_AT_decl_line(0xee)
	.dwattr $C$DW$160, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$65, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$65

$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")

$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)

$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)

$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)

$C$DW$T$78	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$78, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$78, DW_AT_address_class(0x20)

$C$DW$T$36	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$36, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$36, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$36, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$36, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$36, DW_AT_decl_column(0x1c)


$C$DW$T$37	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$37, DW_AT_byte_size(0x08)
$C$DW$161	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$161, DW_AT_upper_bound(0x07)

	.dwendtag $C$DW$T$37

$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x04)

$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)

$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)

$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)

$C$DW$T$32	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$32, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$32, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$32, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$32, DW_AT_decl_column(0x1c)


$C$DW$T$33	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$33, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x04)
$C$DW$162	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$162, DW_AT_upper_bound(0x00)

	.dwendtag $C$DW$T$33


$C$DW$T$34	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_byte_size(0x08)
$C$DW$163	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$163, DW_AT_upper_bound(0x01)

	.dwendtag $C$DW$T$34

$C$DW$T$39	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$32)

$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)

$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x04)

$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)

$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)

$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)

$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)

$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 14
	.dwcfi	cfa_register, 8
	.dwcfi	cfa_offset, 0
	.dwcfi	same_value, 8
	.dwcfi	same_value, 9
	.dwcfi	same_value, 10
	.dwcfi	same_value, 11
	.dwcfi	same_value, 16
	.dwcfi	same_value, 17
	.dwcfi	same_value, 18
	.dwcfi	same_value, 19
	.dwcfi	same_value, 20
	.dwcfi	same_value, 21
	.dwcfi	same_value, 22
	.dwcfi	same_value, 23
	.dwcfi	same_value, 24
	.dwcfi	same_value, 25
	.dwcfi	same_value, 26
	.dwcfi	same_value, 27
	.dwcfi	same_value, 28
	.dwcfi	same_value, 29
	.dwcfi	same_value, 30
	.dwcfi	same_value, 31
	.dwcfi	same_value, 32
	.dwcfi	same_value, 33
	.dwcfi	same_value, 34
	.dwcfi	same_value, 35
	.dwcfi	same_value, 36
	.dwcfi	same_value, 37
	.dwcfi	same_value, 38
	.dwcfi	same_value, 39
	.dwcfi	same_value, 40
	.dwcfi	same_value, 41
	.dwcfi	same_value, 42
	.dwcfi	same_value, 43
	.dwcfi	same_value, 44
	.dwcfi	same_value, 45
	.dwcfi	same_value, 46
	.dwcfi	same_value, 47
	.dwcfi	same_value, 48
	.dwcfi	same_value, 49
	.dwcfi	same_value, 50
	.dwcfi	same_value, 51
	.dwcfi	same_value, 52
	.dwcfi	same_value, 53
	.dwcfi	same_value, 54
	.dwcfi	same_value, 55
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$164	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$164, DW_AT_name("R0_b0")
	.dwattr $C$DW$164, DW_AT_location[DW_OP_reg0]

$C$DW$165	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$165, DW_AT_name("R0_b1")
	.dwattr $C$DW$165, DW_AT_location[DW_OP_reg1]

$C$DW$166	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$166, DW_AT_name("R0_b2")
	.dwattr $C$DW$166, DW_AT_location[DW_OP_reg2]

$C$DW$167	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$167, DW_AT_name("R0_b3")
	.dwattr $C$DW$167, DW_AT_location[DW_OP_reg3]

$C$DW$168	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$168, DW_AT_name("R1_b0")
	.dwattr $C$DW$168, DW_AT_location[DW_OP_reg4]

$C$DW$169	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$169, DW_AT_name("R1_b1")
	.dwattr $C$DW$169, DW_AT_location[DW_OP_reg5]

$C$DW$170	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$170, DW_AT_name("R1_b2")
	.dwattr $C$DW$170, DW_AT_location[DW_OP_reg6]

$C$DW$171	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$171, DW_AT_name("R1_b3")
	.dwattr $C$DW$171, DW_AT_location[DW_OP_reg7]

$C$DW$172	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$172, DW_AT_name("R2_b0")
	.dwattr $C$DW$172, DW_AT_location[DW_OP_reg8]

$C$DW$173	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$173, DW_AT_name("R2_b1")
	.dwattr $C$DW$173, DW_AT_location[DW_OP_reg9]

$C$DW$174	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$174, DW_AT_name("R2_b2")
	.dwattr $C$DW$174, DW_AT_location[DW_OP_reg10]

$C$DW$175	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$175, DW_AT_name("R2_b3")
	.dwattr $C$DW$175, DW_AT_location[DW_OP_reg11]

$C$DW$176	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$176, DW_AT_name("R3_b0")
	.dwattr $C$DW$176, DW_AT_location[DW_OP_reg12]

$C$DW$177	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$177, DW_AT_name("R3_b1")
	.dwattr $C$DW$177, DW_AT_location[DW_OP_reg13]

$C$DW$178	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$178, DW_AT_name("R3_b2")
	.dwattr $C$DW$178, DW_AT_location[DW_OP_reg14]

$C$DW$179	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$179, DW_AT_name("R3_b3")
	.dwattr $C$DW$179, DW_AT_location[DW_OP_reg15]

$C$DW$180	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$180, DW_AT_name("R4_b0")
	.dwattr $C$DW$180, DW_AT_location[DW_OP_reg16]

$C$DW$181	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$181, DW_AT_name("R4_b1")
	.dwattr $C$DW$181, DW_AT_location[DW_OP_reg17]

$C$DW$182	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$182, DW_AT_name("R4_b2")
	.dwattr $C$DW$182, DW_AT_location[DW_OP_reg18]

$C$DW$183	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$183, DW_AT_name("R4_b3")
	.dwattr $C$DW$183, DW_AT_location[DW_OP_reg19]

$C$DW$184	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$184, DW_AT_name("R5_b0")
	.dwattr $C$DW$184, DW_AT_location[DW_OP_reg20]

$C$DW$185	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$185, DW_AT_name("R5_b1")
	.dwattr $C$DW$185, DW_AT_location[DW_OP_reg21]

$C$DW$186	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$186, DW_AT_name("R5_b2")
	.dwattr $C$DW$186, DW_AT_location[DW_OP_reg22]

$C$DW$187	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$187, DW_AT_name("R5_b3")
	.dwattr $C$DW$187, DW_AT_location[DW_OP_reg23]

$C$DW$188	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$188, DW_AT_name("R6_b0")
	.dwattr $C$DW$188, DW_AT_location[DW_OP_reg24]

$C$DW$189	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$189, DW_AT_name("R6_b1")
	.dwattr $C$DW$189, DW_AT_location[DW_OP_reg25]

$C$DW$190	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$190, DW_AT_name("R6_b2")
	.dwattr $C$DW$190, DW_AT_location[DW_OP_reg26]

$C$DW$191	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$191, DW_AT_name("R6_b3")
	.dwattr $C$DW$191, DW_AT_location[DW_OP_reg27]

$C$DW$192	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$192, DW_AT_name("R7_b0")
	.dwattr $C$DW$192, DW_AT_location[DW_OP_reg28]

$C$DW$193	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$193, DW_AT_name("R7_b1")
	.dwattr $C$DW$193, DW_AT_location[DW_OP_reg29]

$C$DW$194	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$194, DW_AT_name("R7_b2")
	.dwattr $C$DW$194, DW_AT_location[DW_OP_reg30]

$C$DW$195	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$195, DW_AT_name("R7_b3")
	.dwattr $C$DW$195, DW_AT_location[DW_OP_reg31]

$C$DW$196	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$196, DW_AT_name("R8_b0")
	.dwattr $C$DW$196, DW_AT_location[DW_OP_regx 0x20]

$C$DW$197	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$197, DW_AT_name("R8_b1")
	.dwattr $C$DW$197, DW_AT_location[DW_OP_regx 0x21]

$C$DW$198	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$198, DW_AT_name("R8_b2")
	.dwattr $C$DW$198, DW_AT_location[DW_OP_regx 0x22]

$C$DW$199	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$199, DW_AT_name("R8_b3")
	.dwattr $C$DW$199, DW_AT_location[DW_OP_regx 0x23]

$C$DW$200	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$200, DW_AT_name("R9_b0")
	.dwattr $C$DW$200, DW_AT_location[DW_OP_regx 0x24]

$C$DW$201	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$201, DW_AT_name("R9_b1")
	.dwattr $C$DW$201, DW_AT_location[DW_OP_regx 0x25]

$C$DW$202	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$202, DW_AT_name("R9_b2")
	.dwattr $C$DW$202, DW_AT_location[DW_OP_regx 0x26]

$C$DW$203	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$203, DW_AT_name("R9_b3")
	.dwattr $C$DW$203, DW_AT_location[DW_OP_regx 0x27]

$C$DW$204	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$204, DW_AT_name("R10_b0")
	.dwattr $C$DW$204, DW_AT_location[DW_OP_regx 0x28]

$C$DW$205	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$205, DW_AT_name("R10_b1")
	.dwattr $C$DW$205, DW_AT_location[DW_OP_regx 0x29]

$C$DW$206	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$206, DW_AT_name("R10_b2")
	.dwattr $C$DW$206, DW_AT_location[DW_OP_regx 0x2a]

$C$DW$207	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$207, DW_AT_name("R10_b3")
	.dwattr $C$DW$207, DW_AT_location[DW_OP_regx 0x2b]

$C$DW$208	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$208, DW_AT_name("R11_b0")
	.dwattr $C$DW$208, DW_AT_location[DW_OP_regx 0x2c]

$C$DW$209	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$209, DW_AT_name("R11_b1")
	.dwattr $C$DW$209, DW_AT_location[DW_OP_regx 0x2d]

$C$DW$210	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$210, DW_AT_name("R11_b2")
	.dwattr $C$DW$210, DW_AT_location[DW_OP_regx 0x2e]

$C$DW$211	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$211, DW_AT_name("R11_b3")
	.dwattr $C$DW$211, DW_AT_location[DW_OP_regx 0x2f]

$C$DW$212	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$212, DW_AT_name("R12_b0")
	.dwattr $C$DW$212, DW_AT_location[DW_OP_regx 0x30]

$C$DW$213	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$213, DW_AT_name("R12_b1")
	.dwattr $C$DW$213, DW_AT_location[DW_OP_regx 0x31]

$C$DW$214	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$214, DW_AT_name("R12_b2")
	.dwattr $C$DW$214, DW_AT_location[DW_OP_regx 0x32]

$C$DW$215	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$215, DW_AT_name("R12_b3")
	.dwattr $C$DW$215, DW_AT_location[DW_OP_regx 0x33]

$C$DW$216	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$216, DW_AT_name("R13_b0")
	.dwattr $C$DW$216, DW_AT_location[DW_OP_regx 0x34]

$C$DW$217	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$217, DW_AT_name("R13_b1")
	.dwattr $C$DW$217, DW_AT_location[DW_OP_regx 0x35]

$C$DW$218	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$218, DW_AT_name("R13_b2")
	.dwattr $C$DW$218, DW_AT_location[DW_OP_regx 0x36]

$C$DW$219	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$219, DW_AT_name("R13_b3")
	.dwattr $C$DW$219, DW_AT_location[DW_OP_regx 0x37]

$C$DW$220	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$220, DW_AT_name("R14_b0")
	.dwattr $C$DW$220, DW_AT_location[DW_OP_regx 0x38]

$C$DW$221	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$221, DW_AT_name("R14_b1")
	.dwattr $C$DW$221, DW_AT_location[DW_OP_regx 0x39]

$C$DW$222	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$222, DW_AT_name("R14_b2")
	.dwattr $C$DW$222, DW_AT_location[DW_OP_regx 0x3a]

$C$DW$223	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$223, DW_AT_name("R14_b3")
	.dwattr $C$DW$223, DW_AT_location[DW_OP_regx 0x3b]

$C$DW$224	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$224, DW_AT_name("R15_b0")
	.dwattr $C$DW$224, DW_AT_location[DW_OP_regx 0x3c]

$C$DW$225	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$225, DW_AT_name("R15_b1")
	.dwattr $C$DW$225, DW_AT_location[DW_OP_regx 0x3d]

$C$DW$226	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$226, DW_AT_name("R15_b2")
	.dwattr $C$DW$226, DW_AT_location[DW_OP_regx 0x3e]

$C$DW$227	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$227, DW_AT_name("R15_b3")
	.dwattr $C$DW$227, DW_AT_location[DW_OP_regx 0x3f]

$C$DW$228	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$228, DW_AT_name("R16_b0")
	.dwattr $C$DW$228, DW_AT_location[DW_OP_regx 0x40]

$C$DW$229	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$229, DW_AT_name("R16_b1")
	.dwattr $C$DW$229, DW_AT_location[DW_OP_regx 0x41]

$C$DW$230	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$230, DW_AT_name("R16_b2")
	.dwattr $C$DW$230, DW_AT_location[DW_OP_regx 0x42]

$C$DW$231	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$231, DW_AT_name("R16_b3")
	.dwattr $C$DW$231, DW_AT_location[DW_OP_regx 0x43]

$C$DW$232	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$232, DW_AT_name("R17_b0")
	.dwattr $C$DW$232, DW_AT_location[DW_OP_regx 0x44]

$C$DW$233	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$233, DW_AT_name("R17_b1")
	.dwattr $C$DW$233, DW_AT_location[DW_OP_regx 0x45]

$C$DW$234	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$234, DW_AT_name("R17_b2")
	.dwattr $C$DW$234, DW_AT_location[DW_OP_regx 0x46]

$C$DW$235	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$235, DW_AT_name("R17_b3")
	.dwattr $C$DW$235, DW_AT_location[DW_OP_regx 0x47]

$C$DW$236	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$236, DW_AT_name("R18_b0")
	.dwattr $C$DW$236, DW_AT_location[DW_OP_regx 0x48]

$C$DW$237	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$237, DW_AT_name("R18_b1")
	.dwattr $C$DW$237, DW_AT_location[DW_OP_regx 0x49]

$C$DW$238	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$238, DW_AT_name("R18_b2")
	.dwattr $C$DW$238, DW_AT_location[DW_OP_regx 0x4a]

$C$DW$239	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$239, DW_AT_name("R18_b3")
	.dwattr $C$DW$239, DW_AT_location[DW_OP_regx 0x4b]

$C$DW$240	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$240, DW_AT_name("R19_b0")
	.dwattr $C$DW$240, DW_AT_location[DW_OP_regx 0x4c]

$C$DW$241	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$241, DW_AT_name("R19_b1")
	.dwattr $C$DW$241, DW_AT_location[DW_OP_regx 0x4d]

$C$DW$242	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$242, DW_AT_name("R19_b2")
	.dwattr $C$DW$242, DW_AT_location[DW_OP_regx 0x4e]

$C$DW$243	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$243, DW_AT_name("R19_b3")
	.dwattr $C$DW$243, DW_AT_location[DW_OP_regx 0x4f]

$C$DW$244	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$244, DW_AT_name("R20_b0")
	.dwattr $C$DW$244, DW_AT_location[DW_OP_regx 0x50]

$C$DW$245	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$245, DW_AT_name("R20_b1")
	.dwattr $C$DW$245, DW_AT_location[DW_OP_regx 0x51]

$C$DW$246	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$246, DW_AT_name("R20_b2")
	.dwattr $C$DW$246, DW_AT_location[DW_OP_regx 0x52]

$C$DW$247	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$247, DW_AT_name("R20_b3")
	.dwattr $C$DW$247, DW_AT_location[DW_OP_regx 0x53]

$C$DW$248	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$248, DW_AT_name("R21_b0")
	.dwattr $C$DW$248, DW_AT_location[DW_OP_regx 0x54]

$C$DW$249	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$249, DW_AT_name("R21_b1")
	.dwattr $C$DW$249, DW_AT_location[DW_OP_regx 0x55]

$C$DW$250	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$250, DW_AT_name("R21_b2")
	.dwattr $C$DW$250, DW_AT_location[DW_OP_regx 0x56]

$C$DW$251	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$251, DW_AT_name("R21_b3")
	.dwattr $C$DW$251, DW_AT_location[DW_OP_regx 0x57]

$C$DW$252	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$252, DW_AT_name("R22_b0")
	.dwattr $C$DW$252, DW_AT_location[DW_OP_regx 0x58]

$C$DW$253	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$253, DW_AT_name("R22_b1")
	.dwattr $C$DW$253, DW_AT_location[DW_OP_regx 0x59]

$C$DW$254	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$254, DW_AT_name("R22_b2")
	.dwattr $C$DW$254, DW_AT_location[DW_OP_regx 0x5a]

$C$DW$255	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$255, DW_AT_name("R22_b3")
	.dwattr $C$DW$255, DW_AT_location[DW_OP_regx 0x5b]

$C$DW$256	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$256, DW_AT_name("R23_b0")
	.dwattr $C$DW$256, DW_AT_location[DW_OP_regx 0x5c]

$C$DW$257	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$257, DW_AT_name("R23_b1")
	.dwattr $C$DW$257, DW_AT_location[DW_OP_regx 0x5d]

$C$DW$258	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$258, DW_AT_name("R23_b2")
	.dwattr $C$DW$258, DW_AT_location[DW_OP_regx 0x5e]

$C$DW$259	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$259, DW_AT_name("R23_b3")
	.dwattr $C$DW$259, DW_AT_location[DW_OP_regx 0x5f]

$C$DW$260	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$260, DW_AT_name("R24_b0")
	.dwattr $C$DW$260, DW_AT_location[DW_OP_regx 0x60]

$C$DW$261	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$261, DW_AT_name("R24_b1")
	.dwattr $C$DW$261, DW_AT_location[DW_OP_regx 0x61]

$C$DW$262	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$262, DW_AT_name("R24_b2")
	.dwattr $C$DW$262, DW_AT_location[DW_OP_regx 0x62]

$C$DW$263	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$263, DW_AT_name("R24_b3")
	.dwattr $C$DW$263, DW_AT_location[DW_OP_regx 0x63]

$C$DW$264	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$264, DW_AT_name("R25_b0")
	.dwattr $C$DW$264, DW_AT_location[DW_OP_regx 0x64]

$C$DW$265	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$265, DW_AT_name("R25_b1")
	.dwattr $C$DW$265, DW_AT_location[DW_OP_regx 0x65]

$C$DW$266	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$266, DW_AT_name("R25_b2")
	.dwattr $C$DW$266, DW_AT_location[DW_OP_regx 0x66]

$C$DW$267	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$267, DW_AT_name("R25_b3")
	.dwattr $C$DW$267, DW_AT_location[DW_OP_regx 0x67]

$C$DW$268	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$268, DW_AT_name("R26_b0")
	.dwattr $C$DW$268, DW_AT_location[DW_OP_regx 0x68]

$C$DW$269	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$269, DW_AT_name("R26_b1")
	.dwattr $C$DW$269, DW_AT_location[DW_OP_regx 0x69]

$C$DW$270	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$270, DW_AT_name("R26_b2")
	.dwattr $C$DW$270, DW_AT_location[DW_OP_regx 0x6a]

$C$DW$271	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$271, DW_AT_name("R26_b3")
	.dwattr $C$DW$271, DW_AT_location[DW_OP_regx 0x6b]

$C$DW$272	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$272, DW_AT_name("R27_b0")
	.dwattr $C$DW$272, DW_AT_location[DW_OP_regx 0x6c]

$C$DW$273	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$273, DW_AT_name("R27_b1")
	.dwattr $C$DW$273, DW_AT_location[DW_OP_regx 0x6d]

$C$DW$274	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$274, DW_AT_name("R27_b2")
	.dwattr $C$DW$274, DW_AT_location[DW_OP_regx 0x6e]

$C$DW$275	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$275, DW_AT_name("R27_b3")
	.dwattr $C$DW$275, DW_AT_location[DW_OP_regx 0x6f]

$C$DW$276	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$276, DW_AT_name("R28_b0")
	.dwattr $C$DW$276, DW_AT_location[DW_OP_regx 0x70]

$C$DW$277	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$277, DW_AT_name("R28_b1")
	.dwattr $C$DW$277, DW_AT_location[DW_OP_regx 0x71]

$C$DW$278	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$278, DW_AT_name("R28_b2")
	.dwattr $C$DW$278, DW_AT_location[DW_OP_regx 0x72]

$C$DW$279	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$279, DW_AT_name("R28_b3")
	.dwattr $C$DW$279, DW_AT_location[DW_OP_regx 0x73]

$C$DW$280	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$280, DW_AT_name("R29_b0")
	.dwattr $C$DW$280, DW_AT_location[DW_OP_regx 0x74]

$C$DW$281	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$281, DW_AT_name("R29_b1")
	.dwattr $C$DW$281, DW_AT_location[DW_OP_regx 0x75]

$C$DW$282	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$282, DW_AT_name("R29_b2")
	.dwattr $C$DW$282, DW_AT_location[DW_OP_regx 0x76]

$C$DW$283	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$283, DW_AT_name("R29_b3")
	.dwattr $C$DW$283, DW_AT_location[DW_OP_regx 0x77]

$C$DW$284	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$284, DW_AT_name("R30_b0")
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0x78]

$C$DW$285	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$285, DW_AT_name("R30_b1")
	.dwattr $C$DW$285, DW_AT_location[DW_OP_regx 0x79]

$C$DW$286	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$286, DW_AT_name("R30_b2")
	.dwattr $C$DW$286, DW_AT_location[DW_OP_regx 0x7a]

$C$DW$287	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$287, DW_AT_name("R30_b3")
	.dwattr $C$DW$287, DW_AT_location[DW_OP_regx 0x7b]

$C$DW$288	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$288, DW_AT_name("R31_b0")
	.dwattr $C$DW$288, DW_AT_location[DW_OP_regx 0x7c]

$C$DW$289	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$289, DW_AT_name("R31_b1")
	.dwattr $C$DW$289, DW_AT_location[DW_OP_regx 0x7d]

$C$DW$290	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$290, DW_AT_name("R31_b2")
	.dwattr $C$DW$290, DW_AT_location[DW_OP_regx 0x7e]

$C$DW$291	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$291, DW_AT_name("R31_b3")
	.dwattr $C$DW$291, DW_AT_location[DW_OP_regx 0x7f]

	.dwendtag $C$DW$CU

