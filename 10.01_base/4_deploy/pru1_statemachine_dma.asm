;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.3.1 *
;* Date/Time created: Sun Mar 31 20:55:35 2019                                *
;******************************************************************************
	.compiler_opts --abi=eabi --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("pru1_statemachine_dma.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.3.1 Copyright (c) 2012-2017 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/pru1")
	.global	__PRU_CREG_PRU_CFG
$C$DW$1	.dwtag  DW_TAG_variable
	.dwattr $C$DW$1, DW_AT_name("mailbox")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("mailbox")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$132)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$1, DW_AT_decl_column(0x1f)

$C$DW$2	.dwtag  DW_TAG_variable
	.dwattr $C$DW$2, DW_AT_name("buslatches")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("buslatches")
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$134)
	.dwattr $C$DW$2, DW_AT_declaration
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$2, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$2, DW_AT_decl_column(0x15)

	.weak	||CT_CFG||
||CT_CFG||:	.usect	".creg.PRU_CFG.noload.near",68,1
$C$DW$3	.dwtag  DW_TAG_variable
	.dwattr $C$DW$3, DW_AT_name("CT_CFG")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("CT_CFG")
	.dwattr $C$DW$3, DW_AT_location[DW_OP_addr ||CT_CFG||]
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$3, DW_AT_external
	.dwattr $C$DW$3, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$3, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$3, DW_AT_decl_column(0x17)

$C$DW$4	.dwtag  DW_TAG_variable
	.dwattr $C$DW$4, DW_AT_name("timeout_target")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("timeout_target")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$4, DW_AT_declaration
	.dwattr $C$DW$4, DW_AT_external
	.dwattr $C$DW$4, DW_AT_decl_file("pru1_utils.h")
	.dwattr $C$DW$4, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$4, DW_AT_decl_column(0x11)

$C$DW$5	.dwtag  DW_TAG_variable
	.dwattr $C$DW$5, DW_AT_name("sm_arb")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("sm_arb")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$137)
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
	.dwattr $C$DW$5, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$5, DW_AT_decl_line(0x29)
	.dwattr $C$DW$5, DW_AT_decl_column(0x23)

	.global	||sm_dma||
	.common	||sm_dma||,9,1
$C$DW$6	.dwtag  DW_TAG_variable
	.dwattr $C$DW$6, DW_AT_name("sm_dma")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("sm_dma")
	.dwattr $C$DW$6, DW_AT_location[DW_OP_addr ||sm_dma||]
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$139)
	.dwattr $C$DW$6, DW_AT_external
	.dwattr $C$DW$6, DW_AT_decl_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$6, DW_AT_decl_line(0x47)
	.dwattr $C$DW$6, DW_AT_decl_column(0x14)


$C$DW$7	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$7, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("buslatches_pru0_dataout")
	.dwattr $C$DW$7, DW_AT_declaration
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$7, DW_AT_decl_line(0xba)
	.dwattr $C$DW$7, DW_AT_decl_column(0x06)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$23)

	.dwendtag $C$DW$7


$C$DW$9	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$9, DW_AT_name("iopageregisters_write_w")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("iopageregisters_write_w")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$9, DW_AT_declaration
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$9, DW_AT_decl_line(0xc2)
	.dwattr $C$DW$9, DW_AT_decl_column(0x09)
$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$23)

$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$24)

	.dwendtag $C$DW$9


$C$DW$12	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$12, DW_AT_name("iopageregisters_write_b")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("iopageregisters_write_b")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$12, DW_AT_declaration
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$12, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$12, DW_AT_decl_column(0x09)
$C$DW$13	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$23)

$C$DW$14	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$22)

	.dwendtag $C$DW$12


$C$DW$15	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$15, DW_AT_name("iopageregisters_read")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("iopageregisters_read")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$15, DW_AT_declaration
	.dwattr $C$DW$15, DW_AT_external
	.dwattr $C$DW$15, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$15, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$15, DW_AT_decl_column(0x09)
$C$DW$16	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$23)

$C$DW$17	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$60)

	.dwendtag $C$DW$15


$C$DW$18	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$18, DW_AT_name("sm_arb_state_idle")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("sm_arb_state_idle")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$18, DW_AT_declaration
	.dwattr $C$DW$18, DW_AT_external
	.dwattr $C$DW$18, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$18, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$18, DW_AT_decl_column(0x09)
	.dwendtag $C$DW$18


$C$DW$19	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$19, DW_AT_name("__delay_cycles")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("__delay_cycles")
	.dwattr $C$DW$19, DW_AT_declaration
	.dwattr $C$DW$19, DW_AT_external
$C$DW$20	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$11)

	.dwendtag $C$DW$19

;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/optpru --gen_opt_info=2 /tmp/TI1l3EAiKrb /tmp/TI1l355ZplO --opt_info_filename=/home/joerg/retrocmp/dec/UniBone/10.01_base/4_deploy/pru1_statemachine_dma.nfo 
;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/acpiapru -@/tmp/TI1l3jp0Du0 
	.sect	".text:sm_dma_state_99"
	.clink

$C$DW$21	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$21, DW_AT_name("sm_dma_state_99")
	.dwattr $C$DW$21, DW_AT_low_pc(||sm_dma_state_99||)
	.dwattr $C$DW$21, DW_AT_high_pc(0x00)
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("sm_dma_state_99")
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$21, DW_AT_TI_begin_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$21, DW_AT_TI_begin_line(0x118)
	.dwattr $C$DW$21, DW_AT_TI_begin_column(0x10)
	.dwattr $C$DW$21, DW_AT_decl_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$21, DW_AT_decl_line(0x118)
	.dwattr $C$DW$21, DW_AT_decl_column(0x10)
	.dwattr $C$DW$21, DW_AT_TI_max_frame_size(0x14)
	.dwpsn	file "pru1_statemachine_dma.c",line 280,column 34,is_stmt,address ||sm_dma_state_99||,isa 0

	.dwfde $C$DW$CIE, ||sm_dma_state_99||
;----------------------------------------------------------------------
; 280 | static uint8_t sm_dma_state_99() {                                     
; 281 | uint8_t final_dma_state;                                               
; 282 | // from state_12, state_21                                             
; 284 | // 2 reasons to terminate transfer                                     
; 285 | // - BUS timeout at curent address                                     
; 286 | // - last word transferred                                             
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: sm_dma_state_99               FR SIZE:  20           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto, 20 SOE     *
;***************************************************************

||sm_dma_state_99||:
;* --------------------------------------------------------------------------*
;* r4_0  assigned to $O$C1
$C$DW$22	.dwtag  DW_TAG_variable
	.dwattr $C$DW$22, DW_AT_name("$O$C1")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$22, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$C2
$C$DW$23	.dwtag  DW_TAG_variable
	.dwattr $C$DW$23, DW_AT_name("$O$C2")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$23, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$C3
$C$DW$24	.dwtag  DW_TAG_variable
	.dwattr $C$DW$24, DW_AT_name("$O$C3")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$24, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$C4
$C$DW$25	.dwtag  DW_TAG_variable
	.dwattr $C$DW$25, DW_AT_name("$O$C4")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("$O$C4")
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$25, DW_AT_location[DW_OP_reg16]

;* r6_0  assigned to $O$K2
$C$DW$26	.dwtag  DW_TAG_variable
	.dwattr $C$DW$26, DW_AT_name("$O$K2")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("$O$K2")
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$26, DW_AT_location[DW_OP_reg24]

;* r5_0  assigned to $O$K34
$C$DW$27	.dwtag  DW_TAG_variable
	.dwattr $C$DW$27, DW_AT_name("$O$K34")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("$O$K34")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$159)
	.dwattr $C$DW$27, DW_AT_location[DW_OP_reg20]

;* r0_0  assigned to $O$v1
$C$DW$28	.dwtag  DW_TAG_variable
	.dwattr $C$DW$28, DW_AT_name("$O$v1")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("$O$v1")
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$28, DW_AT_location[DW_OP_reg0]

;* r4_1  assigned to final_dma_state
$C$DW$29	.dwtag  DW_TAG_variable
	.dwattr $C$DW$29, DW_AT_name("final_dma_state")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("final_dma_state")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$29, DW_AT_location[DW_OP_reg17]

;* r4_0  assigned to _tmpval
$C$DW$30	.dwtag  DW_TAG_variable
	.dwattr $C$DW$30, DW_AT_name("_tmpval")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$30, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to _tmpval
$C$DW$31	.dwtag  DW_TAG_variable
	.dwattr $C$DW$31, DW_AT_name("_tmpval")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to _tmpval
$C$DW$32	.dwtag  DW_TAG_variable
	.dwattr $C$DW$32, DW_AT_name("_tmpval")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to _tmpval
$C$DW$33	.dwtag  DW_TAG_variable
	.dwattr $C$DW$33, DW_AT_name("_tmpval")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg16]

	.dwcfi	cfa_offset, 0
;*** 287	-----------------------    if ( (*(K$2 = &sm_dma)).state_timeout ) goto g7;
        SUB       r2, r2, 0x14          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 20
        SBBO      &r3.b2, r2, 0, 4      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -20
	.dwcfi	save_reg_to_mem, 15, -19
	.dwcfi	save_reg_to_mem, 16, -18
	.dwcfi	save_reg_to_mem, 17, -17
        SBBO      &r5.b0, r2, 4, 16     ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 20, -16
	.dwcfi	save_reg_to_mem, 21, -15
	.dwcfi	save_reg_to_mem, 22, -14
	.dwcfi	save_reg_to_mem, 23, -13
	.dwcfi	save_reg_to_mem, 24, -12
	.dwcfi	save_reg_to_mem, 25, -11
	.dwcfi	save_reg_to_mem, 26, -10
	.dwcfi	save_reg_to_mem, 27, -9
	.dwcfi	save_reg_to_mem, 28, -8
	.dwcfi	save_reg_to_mem, 29, -7
	.dwcfi	save_reg_to_mem, 30, -6
	.dwcfi	save_reg_to_mem, 31, -5
	.dwcfi	save_reg_to_mem, 32, -4
	.dwcfi	save_reg_to_mem, 33, -3
	.dwcfi	save_reg_to_mem, 34, -2
	.dwcfi	save_reg_to_mem, 35, -1
	.dwpsn	file "pru1_statemachine_dma.c",line 287,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 287 | if (sm_dma.state_timeout) {                                            
; 288 |         final_dma_state = DMA_STATE_TIMEOUTSTOP;                       
; 289 |         // deassert SACK after timeout, independent of remaining word c
;     | ount                                                                   
; 290 |         buslatches_setbits(1, BIT(5), 0); // deassert SACK = latch[1],
;     | bit 5                                                                  
; 291 | } else {                                                               
;----------------------------------------------------------------------
        LDI       r6, ||sm_dma||        ; [ALU_PRU] |287| $O$K2,sm_dma
        LBBO      &r0.b0, r6, 2, 1      ; [ALU_PRU] |287| $O$K2
        QBNE      ||$C$L3||, r0.b0, 0x00 ; [ALU_PRU] |287| 
;* --------------------------------------------------------------------------*
;*** 292	-----------------------    ++(*K$2).dataptr;
;*** 293	-----------------------    v$1 = (unsigned short)((*K$2).cur_wordsleft-1);
;*** 293	-----------------------    (*K$2).cur_wordsleft = v$1;
;*** 294	-----------------------    if ( !v$1 ) goto g6;
	.dwpsn	file "pru1_statemachine_dma.c",line 292,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 292 | sm_dma.dataptr++;  // point to next word in buffer                     
;----------------------------------------------------------------------
        LBBO      &r0, r6, 3, 4         ; [ALU_PRU] |292| $O$K2
        ADD       r0, r0, 0x02          ; [ALU_PRU] |292| 
        SBBO      &r0, r6, 3, 4         ; [ALU_PRU] |292| $O$K2
	.dwpsn	file "pru1_statemachine_dma.c",line 293,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 293 | sm_dma.cur_wordsleft--;                                                
;----------------------------------------------------------------------
        LBBO      &r0.w0, r6, 7, 2      ; [ALU_PRU] |293| $O$K2
        SUB       r0.w0, r0.w0, 0x01    ; [ALU_PRU] |293| 
        MOV       r0, r0.w0             ; [ALU_PRU] |293| $O$v1
        SBBO      &r0.w0, r6, 7, 2      ; [ALU_PRU] |293| $O$K2,$O$v1
	.dwpsn	file "pru1_statemachine_dma.c",line 294,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 294 | if (sm_dma.cur_wordsleft == 0)                                         
; 295 |         final_dma_state = DMA_STATE_READY; // last word: stop          
;----------------------------------------------------------------------
        QBEQ      ||$C$L2||, r0, 0x00   ; [ALU_PRU] |294| $O$v1
;* --------------------------------------------------------------------------*
;*** 296	-----------------------    __R30 = 3840u;
;*** 296	-----------------------    __delay_cycles(10u);
;*** 296	-----------------------    if ( __R31&0x8 ) goto g5;
	.dwpsn	file "pru1_statemachine_dma.c",line 296,column 8,is_stmt,isa 0
;----------------------------------------------------------------------
; 296 | else if (buslatches_get(7) & BIT(3)) { // INIT stops transaction: latch
;     | [7], bit 3                                                             
; 297 |         // only bus master (=we!) can issue INIT, so this should never
;     | be reached                                                             
; 298 |         final_dma_state = DMA_STATE_INITSTOP;                          
; 299 |         // deassert SACK after INIT, independent of remaining word coun
;     | t                                                                      
; 300 |         buslatches_setbits(1, BIT(5), 0); // deassert SACK = latch[1],
;     | bit 5                                                                  
; 301 | } else                                                                 
; 302 |         final_dma_state = DMA_STATE_RUNNING; // more words:  continue  
;----------------------------------------------------------------------
        LDI       r30, 0x0f00           ; [ALU_PRU] |296| 
        .newblock
        LDI32    r0, 4
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |296| 
        QBBS      ||$C$L1||, r31, 0x03  ; [ALU_PRU] |296| 
;* --------------------------------------------------------------------------*
;*** 305	-----------------------    (*K$2).state = &sm_dma_state_1;
;*** 309	-----------------------    mailbox.$P$T1.dma.cur_addr += 2u;
;*** 310	-----------------------    return 0;
	.dwpsn	file "pru1_statemachine_dma.c",line 305,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 305 | sm_dma.state = &sm_dma_state_1; // in any case, reloop                 
; 307 | if (final_dma_state == DMA_STATE_RUNNING) {                            
; 308 |         // dataptr and wordsleft already incremented                   
; 309 |         mailbox.dma.cur_addr += 2; // signal progress to ARM           
;----------------------------------------------------------------------
        LDI       r0.w0, $CODE(||sm_dma_state_1||) ; [ALU_PRU] |305| sm_dma_state_1
        SBBO      &r0.w0, r6, 0, 2      ; [ALU_PRU] |305| $O$K2
	.dwpsn	file "pru1_statemachine_dma.c",line 310,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 310 | return 0;                                                              
;----------------------------------------------------------------------
        LDI       r14.b0, 0x00          ; [ALU_PRU] |310| 
	.dwpsn	file "pru1_statemachine_dma.c",line 309,column 3,is_stmt,isa 0
        LDI32     r0, ||mailbox||+28    ; [ALU_PRU] |309| mailbox
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |309| 
        ADD       r1, r1, 0x02          ; [ALU_PRU] |309| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |309| 
	.dwpsn	file "pru1_statemachine_dma.c",line 310,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 311 | } else {                                                               
; 312 |         // remove addr and control from bus                            
;----------------------------------------------------------------------
        JMP       ||$C$L5||             ; [ALU_PRU] |310| 
;* --------------------------------------------------------------------------*
||$C$L1||:    
;***	-----------------------g5:
;*** 300	-----------------------    _tmpval = C$4 = (unsigned char)(*(K$34 = &buslatches+1)&0xdf);
;*** 300	-----------------------    buslatches_pru0_dataout((unsigned)C$4);
;*** 300	-----------------------    __R30 = 256u;
;*** 300	-----------------------    *K$34 = _tmpval;
;*** 300	-----------------------    __delay_cycles(4u);
;*** 300	-----------------------    __R30 = 2304u;
;*** 305	-----------------------    (*K$2).state = &sm_dma_state_1;
;*** 298	-----------------------    final_dma_state = 4u;
;*** 307	-----------------------    goto g8;
	.dwpsn	file "pru1_statemachine_dma.c",line 300,column 4,is_stmt,isa 0
        LDI       r5, ||buslatches||+1  ; [ALU_PRU] |300| $O$K34,buslatches
        LBBO      &r0.b0, r5, 0, 1      ; [ALU_PRU] |300| $O$K34
        AND       r4.b0, r0.b0, 0xdf    ; [ALU_PRU] |300| $O$C4
        MOV       r14, r4.b0            ; [ALU_PRU] |300| $O$C4
$C$DW$34	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$34, DW_AT_low_pc(0x00)
	.dwattr $C$DW$34, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$34, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |300| buslatches_pru0_dataout
        LDI       r30, 0x0100           ; [ALU_PRU] |300| 
        SBBO      &r4.b0, r5, 0, 1      ; [ALU_PRU] |300| $O$K34,_tmpval
        .newblock
        LDI32    r7, 1
$1:     SUB      r7, r7, 1
        QBNE     $1, r7, 0             ; [ALU_PRU] |300| 
	.dwpsn	file "pru1_statemachine_dma.c",line 298,column 4,is_stmt,isa 0
        LDI       r4.b1, 0x04           ; [ALU_PRU] |298| final_dma_state
	.dwpsn	file "pru1_statemachine_dma.c",line 305,column 2,is_stmt,isa 0
        LDI       r0.w0, $CODE(||sm_dma_state_1||) ; [ALU_PRU] |305| sm_dma_state_1
	.dwpsn	file "pru1_statemachine_dma.c",line 300,column 4,is_stmt,isa 0
        LDI       r30, 0x0900           ; [ALU_PRU] |300| 
	.dwpsn	file "pru1_statemachine_dma.c",line 305,column 2,is_stmt,isa 0
        SBBO      &r0.w0, r6, 0, 2      ; [ALU_PRU] |305| $O$K2
	.dwpsn	file "pru1_statemachine_dma.c",line 307,column 2,is_stmt,isa 0
        JMP       ||$C$L4||             ; [ALU_PRU] |307| 
;* --------------------------------------------------------------------------*
||$C$L2||:    
;***	-----------------------g6:
;*** 305	-----------------------    (*K$2).state = &sm_dma_state_1;
;***  	-----------------------    K$34 = &buslatches+1;
;*** 295	-----------------------    final_dma_state = 0u;
;*** 307	-----------------------    goto g8;
	.dwpsn	file "pru1_statemachine_dma.c",line 305,column 2,is_stmt,isa 0
        LDI       r0.w0, $CODE(||sm_dma_state_1||) ; [ALU_PRU] |305| sm_dma_state_1
        LDI       r5, ||buslatches||+1  ; [ALU_PRU] $O$K34,buslatches
	.dwpsn	file "pru1_statemachine_dma.c",line 295,column 4,is_stmt,isa 0
        LDI       r4.b1, 0x00           ; [ALU_PRU] |295| final_dma_state
	.dwpsn	file "pru1_statemachine_dma.c",line 305,column 2,is_stmt,isa 0
        SBBO      &r0.w0, r6, 0, 2      ; [ALU_PRU] |305| $O$K2
	.dwpsn	file "pru1_statemachine_dma.c",line 307,column 2,is_stmt,isa 0
        JMP       ||$C$L4||             ; [ALU_PRU] |307| 
;* --------------------------------------------------------------------------*
||$C$L3||:    
;***	-----------------------g7:
;*** 290	-----------------------    _tmpval = C$3 = (unsigned char)(*(K$34 = &buslatches+1)&0xdf);
;*** 290	-----------------------    buslatches_pru0_dataout((unsigned)C$3);
;*** 290	-----------------------    __R30 = 256u;
;*** 290	-----------------------    *K$34 = _tmpval;
;*** 290	-----------------------    __delay_cycles(4u);
;*** 290	-----------------------    __R30 = 2304u;
;*** 305	-----------------------    (*K$2).state = &sm_dma_state_1;
;*** 288	-----------------------    final_dma_state = 3u;
	.dwpsn	file "pru1_statemachine_dma.c",line 290,column 3,is_stmt,isa 0
        LDI       r5, ||buslatches||+1  ; [ALU_PRU] |290| $O$K34,buslatches
        LBBO      &r0.b0, r5, 0, 1      ; [ALU_PRU] |290| $O$K34
        AND       r4.b0, r0.b0, 0xdf    ; [ALU_PRU] |290| $O$C3
        MOV       r14, r4.b0            ; [ALU_PRU] |290| $O$C3
$C$DW$35	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$35, DW_AT_low_pc(0x00)
	.dwattr $C$DW$35, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$35, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |290| buslatches_pru0_dataout
        LDI       r30, 0x0100           ; [ALU_PRU] |290| 
        SBBO      &r4.b0, r5, 0, 1      ; [ALU_PRU] |290| $O$K34,_tmpval
        .newblock
        LDI32    r7, 1
$1:     SUB      r7, r7, 1
        QBNE     $1, r7, 0             ; [ALU_PRU] |290| 
	.dwpsn	file "pru1_statemachine_dma.c",line 288,column 3,is_stmt,isa 0
        LDI       r4.b1, 0x03           ; [ALU_PRU] |288| final_dma_state
	.dwpsn	file "pru1_statemachine_dma.c",line 305,column 2,is_stmt,isa 0
        LDI       r0.w0, $CODE(||sm_dma_state_1||) ; [ALU_PRU] |305| sm_dma_state_1
	.dwpsn	file "pru1_statemachine_dma.c",line 290,column 3,is_stmt,isa 0
        LDI       r30, 0x0900           ; [ALU_PRU] |290| 
	.dwpsn	file "pru1_statemachine_dma.c",line 305,column 2,is_stmt,isa 0
        SBBO      &r0.w0, r6, 0, 2      ; [ALU_PRU] |305| $O$K2
;* --------------------------------------------------------------------------*
||$C$L4||:    
;***	-----------------------g8:
;*** 313	-----------------------    buslatches_pru0_dataout(0u);
;*** 313	-----------------------    __R30 = 512u;
;*** 313	-----------------------    __delay_cycles(6u);
;*** 313	-----------------------    __R30 = 2560u;
;*** 314	-----------------------    buslatches_pru0_dataout(0u);
;*** 314	-----------------------    __R30 = 768u;
;*** 314	-----------------------    __delay_cycles(6u);
;*** 314	-----------------------    __R30 = 2816u;
;*** 315	-----------------------    _tmpval = C$2 = (unsigned char)(K$34[3]&0xc0);
;*** 315	-----------------------    buslatches_pru0_dataout((unsigned)C$2);
;*** 315	-----------------------    __R30 = 1024u;
;*** 315	-----------------------    K$34[3] = _tmpval;
;*** 315	-----------------------    __delay_cycles(4u);
;*** 315	-----------------------    __R30 = 3072u;
;*** 317	-----------------------    _tmpval = C$1 = (unsigned char)(*K$34&0xbf);
;*** 317	-----------------------    buslatches_pru0_dataout((unsigned)C$1);
;*** 317	-----------------------    __R30 = 256u;
;*** 317	-----------------------    *K$34 = _tmpval;
;*** 317	-----------------------    __delay_cycles(4u);
;*** 317	-----------------------    __R30 = 2304u;
;*** 319	-----------------------    sm_arb.state = &sm_arb_state_idle;
;*** 320	-----------------------    mailbox.$P$T1.dma.cur_status = final_dma_state;
;*** 321	-----------------------    return 1;
	.dwpsn	file "pru1_statemachine_dma.c",line 313,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 313 | buslatches_setbyte(2, 0);                                              
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |313| 
$C$DW$36	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$36, DW_AT_low_pc(0x00)
	.dwattr $C$DW$36, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$36, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |313| buslatches_pru0_dataout
        LDI       r30, 0x0200           ; [ALU_PRU] |313| 
        .newblock
        LDI32    r8, 2
$1:     SUB      r8, r8, 1
        QBNE     $1, r8, 0             ; [ALU_PRU] |313| 
	.dwpsn	file "pru1_statemachine_dma.c",line 314,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 314 | buslatches_setbyte(3, 0);                                              
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |314| 
	.dwpsn	file "pru1_statemachine_dma.c",line 313,column 3,is_stmt,isa 0
        LDI       r30, 0x0a00           ; [ALU_PRU] |313| 
	.dwpsn	file "pru1_statemachine_dma.c",line 314,column 3,is_stmt,isa 0
$C$DW$37	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$37, DW_AT_low_pc(0x00)
	.dwattr $C$DW$37, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$37, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |314| buslatches_pru0_dataout
        LDI       r30, 0x0300           ; [ALU_PRU] |314| 
        .newblock
        LDI32    r7, 2
$1:     SUB      r7, r7, 1
        QBNE     $1, r7, 0             ; [ALU_PRU] |314| 
	.dwpsn	file "pru1_statemachine_dma.c",line 315,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 315 | buslatches_setbits(4, 0x3f, 0);                                        
;----------------------------------------------------------------------
        LBBO      &r0.b0, r5, 3, 1      ; [ALU_PRU] |315| $O$K34
        AND       r4.b0, r0.b0, 0xc0    ; [ALU_PRU] |315| $O$C2
	.dwpsn	file "pru1_statemachine_dma.c",line 314,column 3,is_stmt,isa 0
        LDI       r30, 0x0b00           ; [ALU_PRU] |314| 
	.dwpsn	file "pru1_statemachine_dma.c",line 315,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 316 | // remove BBSY: latch[1], bit 6                                        
;----------------------------------------------------------------------
        MOV       r14, r4.b0            ; [ALU_PRU] |315| $O$C2
$C$DW$38	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$38, DW_AT_low_pc(0x00)
	.dwattr $C$DW$38, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$38, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |315| buslatches_pru0_dataout
        SBBO      &r4.b0, r5, 3, 1      ; [ALU_PRU] |315| $O$K34,_tmpval
        LDI       r30, 0x0400           ; [ALU_PRU] |315| 
        .newblock
        LDI32    r6, 1
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |315| 
	.dwpsn	file "pru1_statemachine_dma.c",line 317,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 317 | buslatches_setbits(1, BIT(6), 0);                                      
;----------------------------------------------------------------------
        LBBO      &r0.b0, r5, 0, 1      ; [ALU_PRU] |317| $O$K34
	.dwpsn	file "pru1_statemachine_dma.c",line 315,column 3,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |315| 
	.dwpsn	file "pru1_statemachine_dma.c",line 317,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 318 | // terminate arbitration state                                         
;----------------------------------------------------------------------
        AND       r4.b0, r0.b0, 0xbf    ; [ALU_PRU] |317| $O$C1
        MOV       r14, r4.b0            ; [ALU_PRU] |317| $O$C1
$C$DW$39	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$39, DW_AT_low_pc(0x00)
	.dwattr $C$DW$39, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$39, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |317| buslatches_pru0_dataout
        SBBO      &r4.b0, r5, 0, 1      ; [ALU_PRU] |317| $O$K34,_tmpval
        LDI       r30, 0x0100           ; [ALU_PRU] |317| 
        .newblock
        LDI32    r5, 1
$1:     SUB      r5, r5, 1
        QBNE     $1, r5, 0             ; [ALU_PRU] |317| 
	.dwpsn	file "pru1_statemachine_dma.c",line 319,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 319 | sm_arb.state = &sm_arb_state_idle;                                     
; 320 | mailbox.dma.cur_status = final_dma_state; // signal to ARM             
;----------------------------------------------------------------------
        LDI       r1.w0, $CODE(||sm_arb_state_idle||) ; [ALU_PRU] |319| sm_arb_state_idle
	.dwpsn	file "pru1_statemachine_dma.c",line 321,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 321 | return 1; // now stopped                                               
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |321| 
	.dwpsn	file "pru1_statemachine_dma.c",line 319,column 3,is_stmt,isa 0
        LDI       r0, ||sm_arb||        ; [ALU_PRU] |319| sm_arb
	.dwpsn	file "pru1_statemachine_dma.c",line 317,column 3,is_stmt,isa 0
        LDI       r30, 0x0900           ; [ALU_PRU] |317| 
	.dwpsn	file "pru1_statemachine_dma.c",line 319,column 3,is_stmt,isa 0
        SBBO      &r1.w0, r0, 0, 2      ; [ALU_PRU] |319| 
	.dwpsn	file "pru1_statemachine_dma.c",line 320,column 3,is_stmt,isa 0
        LDI32     r0, ||mailbox||+24    ; [ALU_PRU] |320| mailbox
        SBBO      &r4.b1, r0, 0, 1      ; [ALU_PRU] |320| final_dma_state
;* --------------------------------------------------------------------------*
||$C$L5||:    
        LBBO      &r3.b2, r2, 0, 4      ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
	.dwcfi	restore_reg, 16
	.dwcfi	restore_reg, 17
        LBBO      &r5.b0, r2, 4, 16     ; [ALU_PRU] 
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
        ADD       r2, r2, 0x14          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$40	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$40, DW_AT_low_pc(0x00)
	.dwattr $C$DW$40, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$21, DW_AT_TI_end_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$21, DW_AT_TI_end_line(0x143)
	.dwattr $C$DW$21, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$21

	.sect	".text:sm_dma_state_21"
	.clink

$C$DW$41	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$41, DW_AT_name("sm_dma_state_21")
	.dwattr $C$DW$41, DW_AT_low_pc(||sm_dma_state_21||)
	.dwattr $C$DW$41, DW_AT_high_pc(0x00)
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("sm_dma_state_21")
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$41, DW_AT_TI_begin_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$41, DW_AT_TI_begin_line(0x107)
	.dwattr $C$DW$41, DW_AT_TI_begin_column(0x10)
	.dwattr $C$DW$41, DW_AT_decl_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$41, DW_AT_decl_line(0x107)
	.dwattr $C$DW$41, DW_AT_decl_column(0x10)
	.dwattr $C$DW$41, DW_AT_TI_max_frame_size(0x19)
	.dwpsn	file "pru1_statemachine_dma.c",line 263,column 34,is_stmt,address ||sm_dma_state_21||,isa 0

	.dwfde $C$DW$CIE, ||sm_dma_state_21||
;----------------------------------------------------------------------
; 263 | static uint8_t sm_dma_state_21() {                                     
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: sm_dma_state_21               FR SIZE:  25           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto, 25 SOE     *
;***************************************************************

||sm_dma_state_21||:
;* --------------------------------------------------------------------------*
;* r6_0  assigned to $O$C1
$C$DW$42	.dwtag  DW_TAG_variable
	.dwattr $C$DW$42, DW_AT_name("$O$C1")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$159)
	.dwattr $C$DW$42, DW_AT_location[DW_OP_reg24]

;* r5_0  assigned to $O$C2
$C$DW$43	.dwtag  DW_TAG_variable
	.dwattr $C$DW$43, DW_AT_name("$O$C2")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$43, DW_AT_location[DW_OP_reg20]

;* r4_0  assigned to $O$C3
$C$DW$44	.dwtag  DW_TAG_variable
	.dwattr $C$DW$44, DW_AT_name("$O$C3")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$K11
$C$DW$45	.dwtag  DW_TAG_variable
	.dwattr $C$DW$45, DW_AT_name("$O$K11")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("$O$K11")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg16]

;* r0_0  assigned to $O$v1
$C$DW$46	.dwtag  DW_TAG_variable
	.dwattr $C$DW$46, DW_AT_name("$O$v1")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("$O$v1")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg0]

;* r5_0  assigned to _tmpval
$C$DW$47	.dwtag  DW_TAG_variable
	.dwattr $C$DW$47, DW_AT_name("_tmpval")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg20]

	.dwcfi	cfa_offset, 0
;*** 264	-----------------------    v$1 = (*(volatile struct $$fake35 *)0x24000u).$P$T18.CYCLE >= timeout_target;
        SUB       r2, r2, 0x19          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 25
	.dwpsn	file "pru1_statemachine_dma.c",line 264,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 264 | sm_dma.state_timeout = TIMEOUT_REACHED; // SSYN timeout?               
; 265 | // SSYN = latch[4], bit 5                                              
;----------------------------------------------------------------------
        LDI       r1, ||timeout_target|| ; [ALU_PRU] |264| timeout_target
        LDI32     r14, 0x0002400c       ; [ALU_PRU] |264| 
        ZERO      &r0, 4                ; [ALU_PRU] |264| 
        SBBO      &r3.b2, r2, 0, 9      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -25
	.dwcfi	save_reg_to_mem, 15, -24
	.dwcfi	save_reg_to_mem, 16, -23
	.dwcfi	save_reg_to_mem, 17, -22
	.dwcfi	save_reg_to_mem, 18, -21
	.dwcfi	save_reg_to_mem, 19, -20
	.dwcfi	save_reg_to_mem, 20, -19
	.dwcfi	save_reg_to_mem, 21, -18
	.dwcfi	save_reg_to_mem, 22, -17
        SBBO      &r6.b0, r2, 9, 16     ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 24, -16
	.dwcfi	save_reg_to_mem, 25, -15
	.dwcfi	save_reg_to_mem, 26, -14
	.dwcfi	save_reg_to_mem, 27, -13
	.dwcfi	save_reg_to_mem, 28, -12
	.dwcfi	save_reg_to_mem, 29, -11
	.dwcfi	save_reg_to_mem, 30, -10
	.dwcfi	save_reg_to_mem, 31, -9
	.dwcfi	save_reg_to_mem, 32, -8
	.dwcfi	save_reg_to_mem, 33, -7
	.dwcfi	save_reg_to_mem, 34, -6
	.dwcfi	save_reg_to_mem, 35, -5
	.dwcfi	save_reg_to_mem, 36, -4
	.dwcfi	save_reg_to_mem, 37, -3
	.dwcfi	save_reg_to_mem, 38, -2
	.dwcfi	save_reg_to_mem, 39, -1
        LBBO      &r1, r1, 0, 4         ; [ALU_PRU] |264| 
        LBBO      &r14, r14, 0, 4       ; [ALU_PRU] |264| 
        QBLT      ||$C$L6||, r1, r14    ; [ALU_PRU] |264| 
;* --------------------------------------------------------------------------*
        LDI       r0, 0x0001            ; [ALU_PRU] |264| 
;* --------------------------------------------------------------------------*
||$C$L6||:    
;*** 264	-----------------------    (*(C$3 = &sm_dma)).state_timeout = v$1;
;*** 264	-----------------------    K$11 = C$3;
;*** 266	-----------------------    if ( v$1 ) goto g3;
        LDI       r4, ||sm_dma||        ; [ALU_PRU] |264| $O$C3,sm_dma
        SBBO      &r0.b0, r4, 2, 1      ; [ALU_PRU] |264| $O$C3,$O$v1
	.dwpsn	file "pru1_statemachine_dma.c",line 266,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 266 | if (!sm_dma.state_timeout && !(buslatches_get(4) & BIT(5)))            
; 267 |         return 0; // no SSYN yet: wait                                 
; 269 | // SSYN set by slave (or timeout): negate MSYN, remove DATA from bus   
;----------------------------------------------------------------------
        QBNE      ||$C$L7||, r0, 0x00   ; [ALU_PRU] |266| $O$v1
;* --------------------------------------------------------------------------*
;*** 266	-----------------------    __R30 = 3072u;
;*** 266	-----------------------    __delay_cycles(10u);
;*** 266	-----------------------    if ( !(__R31&0x20u) ) goto g4;
        LDI       r30, 0x0c00           ; [ALU_PRU] |266| 
        .newblock
        LDI32    r0, 4
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |266| 
        QBBC      ||$C$L8||, r31, 0x05  ; [ALU_PRU] |266| 
;* --------------------------------------------------------------------------*
||$C$L7||:    
;***	-----------------------g3:
;*** 270	-----------------------    _tmpval = C$2 = (unsigned char)(*(C$1 = &buslatches+4)&0xef);
;*** 270	-----------------------    buslatches_pru0_dataout((unsigned)C$2);
;*** 270	-----------------------    __R30 = 1024u;
;*** 270	-----------------------    *C$1 = _tmpval;
;*** 270	-----------------------    __delay_cycles(4u);
;*** 270	-----------------------    __R30 = 3072u;
;*** 271	-----------------------    buslatches_pru0_dataout(0u);
;*** 271	-----------------------    __R30 = 1280u;
;*** 271	-----------------------    __delay_cycles(6u);
;*** 271	-----------------------    __R30 = 3328u;
;*** 272	-----------------------    buslatches_pru0_dataout(0u);
;*** 272	-----------------------    __R30 = 1536u;
;*** 272	-----------------------    __delay_cycles(6u);
;*** 272	-----------------------    __R30 = 3584u;
;*** 274	-----------------------    __delay_cycles(7u);
;*** 275	-----------------------    (*K$11).state = &sm_dma_state_99;
	.dwpsn	file "pru1_statemachine_dma.c",line 270,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 270 | buslatches_setbits(4, BIT(4), 0); // deassert MSYN                     
;----------------------------------------------------------------------
        LDI       r6, ||buslatches||+4  ; [ALU_PRU] |270| $O$C1,buslatches
        LBBO      &r0.b0, r6, 0, 1      ; [ALU_PRU] |270| $O$C1
        AND       r5.b0, r0.b0, 0xef    ; [ALU_PRU] |270| $O$C2
        MOV       r14, r5.b0            ; [ALU_PRU] |270| $O$C2
$C$DW$48	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$48, DW_AT_low_pc(0x00)
	.dwattr $C$DW$48, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$48, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |270| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |270| 
        SBBO      &r5.b0, r6, 0, 1      ; [ALU_PRU] |270| $O$C1,_tmpval
        .newblock
        LDI32    r9, 1
$1:     SUB      r9, r9, 1
        QBNE     $1, r9, 0             ; [ALU_PRU] |270| 
	.dwpsn	file "pru1_statemachine_dma.c",line 271,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 271 | buslatches_setbyte(5, 0);                                              
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |271| 
	.dwpsn	file "pru1_statemachine_dma.c",line 270,column 2,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |270| 
	.dwpsn	file "pru1_statemachine_dma.c",line 271,column 2,is_stmt,isa 0
$C$DW$49	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$49, DW_AT_low_pc(0x00)
	.dwattr $C$DW$49, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$49, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |271| buslatches_pru0_dataout
        LDI       r30, 0x0500           ; [ALU_PRU] |271| 
        .newblock
        LDI32    r8, 2
$1:     SUB      r8, r8, 1
        QBNE     $1, r8, 0             ; [ALU_PRU] |271| 
	.dwpsn	file "pru1_statemachine_dma.c",line 272,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 272 | buslatches_setbyte(6, 0);                                              
;----------------------------------------------------------------------
        ZERO      &r14, 4               ; [ALU_PRU] |272| 
	.dwpsn	file "pru1_statemachine_dma.c",line 271,column 2,is_stmt,isa 0
        LDI       r30, 0x0d00           ; [ALU_PRU] |271| 
	.dwpsn	file "pru1_statemachine_dma.c",line 272,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 273 | // DATO: remove address,control, MSYN,SSYN from bus, 75ns after MSYN in
;     | active                                                                 
;----------------------------------------------------------------------
$C$DW$50	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$50, DW_AT_low_pc(0x00)
	.dwattr $C$DW$50, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$50, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |272| buslatches_pru0_dataout
        LDI       r30, 0x0600           ; [ALU_PRU] |272| 
        .newblock
        LDI32    r7, 2
$1:     SUB      r7, r7, 1
        QBNE     $1, r7, 0             ; [ALU_PRU] |272| 
        LDI       r30, 0x0e00           ; [ALU_PRU] |272| 
	.dwpsn	file "pru1_statemachine_dma.c",line 274,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 274 | __delay_cycles(NANOSECS(75) - 8); // assume 8 cycles for state change  
;----------------------------------------------------------------------
        .newblock
        LDI      r5.w1, 3
$1:     SUB      r5.w1, r5.w1, 1
        QBNE     $1, r5.w1, 0          ; [ALU_PRU] |274| 
	.dwpsn	file "pru1_statemachine_dma.c",line 275,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 275 | sm_dma.state = &sm_dma_state_99;                                       
; 276 | return 0; // still running                                             
;----------------------------------------------------------------------
        LDI       r0.w0, $CODE(||sm_dma_state_99||) ; [ALU_PRU] |275| sm_dma_state_99
        SBBO      &r0.w0, r4, 0, 2      ; [ALU_PRU] |275| $O$K11
;* --------------------------------------------------------------------------*
||$C$L8||:    
;***	-----------------------g4:
;*** 267	-----------------------    return 0;
        LBBO      &r3.b2, r2, 0, 9      ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
	.dwcfi	restore_reg, 16
	.dwcfi	restore_reg, 17
	.dwcfi	restore_reg, 18
	.dwcfi	restore_reg, 19
	.dwcfi	restore_reg, 20
	.dwcfi	restore_reg, 21
	.dwcfi	restore_reg, 22
        LBBO      &r6.b0, r2, 9, 16     ; [ALU_PRU] 
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
	.dwpsn	file "pru1_statemachine_dma.c",line 267,column 3,is_stmt,isa 0
        LDI       r14.b0, 0x00          ; [ALU_PRU] |267| 
        ADD       r2, r2, 0x19          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$51	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$51, DW_AT_low_pc(0x00)
	.dwattr $C$DW$51, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$41, DW_AT_TI_end_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$41, DW_AT_TI_end_line(0x115)
	.dwattr $C$DW$41, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$41

	.sect	".text:sm_dma_state_11"
	.clink

$C$DW$52	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$52, DW_AT_name("sm_dma_state_11")
	.dwattr $C$DW$52, DW_AT_low_pc(||sm_dma_state_11||)
	.dwattr $C$DW$52, DW_AT_high_pc(0x00)
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("sm_dma_state_11")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$52, DW_AT_TI_begin_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$52, DW_AT_TI_begin_line(0xee)
	.dwattr $C$DW$52, DW_AT_TI_begin_column(0x10)
	.dwattr $C$DW$52, DW_AT_decl_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$52, DW_AT_decl_line(0xee)
	.dwattr $C$DW$52, DW_AT_decl_column(0x10)
	.dwattr $C$DW$52, DW_AT_TI_max_frame_size(0x11)
	.dwpsn	file "pru1_statemachine_dma.c",line 238,column 34,is_stmt,address ||sm_dma_state_11||,isa 0

	.dwfde $C$DW$CIE, ||sm_dma_state_11||
;----------------------------------------------------------------------
; 238 | static uint8_t sm_dma_state_11() {                                     
; 239 | uint16_t tmpval;                                                       
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: sm_dma_state_11               FR SIZE:  17           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto, 17 SOE     *
;***************************************************************

||sm_dma_state_11||:
;* --------------------------------------------------------------------------*
;* r7_0  assigned to $O$C1
$C$DW$53	.dwtag  DW_TAG_variable
	.dwattr $C$DW$53, DW_AT_name("$O$C1")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$159)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg28]

;* r5_0  assigned to $O$C2
$C$DW$54	.dwtag  DW_TAG_variable
	.dwattr $C$DW$54, DW_AT_name("$O$C2")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$54, DW_AT_location[DW_OP_reg20]

;* r4_0  assigned to $O$C3
$C$DW$55	.dwtag  DW_TAG_variable
	.dwattr $C$DW$55, DW_AT_name("$O$C3")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$55, DW_AT_location[DW_OP_reg16]

;* r4_0  assigned to $O$K11
$C$DW$56	.dwtag  DW_TAG_variable
	.dwattr $C$DW$56, DW_AT_name("$O$K11")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("$O$K11")
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$56, DW_AT_location[DW_OP_reg16]

;* r0_0  assigned to $O$v1
$C$DW$57	.dwtag  DW_TAG_variable
	.dwattr $C$DW$57, DW_AT_name("$O$v1")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("$O$v1")
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$57, DW_AT_location[DW_OP_reg0]

;* r14_0 assigned to tmpval
$C$DW$58	.dwtag  DW_TAG_variable
	.dwattr $C$DW$58, DW_AT_name("tmpval")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("tmpval")
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$58, DW_AT_location[DW_OP_regx 0x38]

;* r5_0  assigned to _tmpval
$C$DW$59	.dwtag  DW_TAG_variable
	.dwattr $C$DW$59, DW_AT_name("_tmpval")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$59, DW_AT_location[DW_OP_reg20]

	.dwcfi	cfa_offset, 0
;*** 240	-----------------------    v$1 = (*(volatile struct $$fake35 *)0x24000u).$P$T18.CYCLE >= timeout_target;
        SUB       r2, r2, 0x11          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 17
	.dwpsn	file "pru1_statemachine_dma.c",line 240,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 240 | sm_dma.state_timeout = TIMEOUT_REACHED;                                
; 241 | // SSYN = latch[4], bit 5                                              
;----------------------------------------------------------------------
        LDI       r1, ||timeout_target|| ; [ALU_PRU] |240| timeout_target
        LDI32     r14, 0x0002400c       ; [ALU_PRU] |240| 
        ZERO      &r0, 4                ; [ALU_PRU] |240| 
        SBBO      &r3.b2, r2, 0, 9      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -17
	.dwcfi	save_reg_to_mem, 15, -16
	.dwcfi	save_reg_to_mem, 16, -15
	.dwcfi	save_reg_to_mem, 17, -14
	.dwcfi	save_reg_to_mem, 18, -13
	.dwcfi	save_reg_to_mem, 19, -12
	.dwcfi	save_reg_to_mem, 20, -11
	.dwcfi	save_reg_to_mem, 21, -10
	.dwcfi	save_reg_to_mem, 22, -9
        SBBO      &r6.b0, r2, 9, 8      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 24, -8
	.dwcfi	save_reg_to_mem, 25, -7
	.dwcfi	save_reg_to_mem, 26, -6
	.dwcfi	save_reg_to_mem, 27, -5
	.dwcfi	save_reg_to_mem, 28, -4
	.dwcfi	save_reg_to_mem, 29, -3
	.dwcfi	save_reg_to_mem, 30, -2
	.dwcfi	save_reg_to_mem, 31, -1
        LBBO      &r1, r1, 0, 4         ; [ALU_PRU] |240| 
        LBBO      &r14, r14, 0, 4       ; [ALU_PRU] |240| 
        QBLT      ||$C$L9||, r1, r14    ; [ALU_PRU] |240| 
;* --------------------------------------------------------------------------*
        LDI       r0, 0x0001            ; [ALU_PRU] |240| 
;* --------------------------------------------------------------------------*
||$C$L9||:    
;*** 240	-----------------------    (*(C$3 = &sm_dma)).state_timeout = v$1;
;*** 240	-----------------------    K$11 = C$3;
;*** 242	-----------------------    if ( v$1 ) goto g3;
        LDI       r4, ||sm_dma||        ; [ALU_PRU] |240| $O$C3,sm_dma
        SBBO      &r0.b0, r4, 2, 1      ; [ALU_PRU] |240| $O$C3,$O$v1
	.dwpsn	file "pru1_statemachine_dma.c",line 242,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 242 | if (!sm_dma.state_timeout && !(buslatches_get(4) & BIT(5)))            
; 243 |         return 0; // no SSYN yet: wait                                 
; 244 | // SSYN set by slave (or timeout). read data                           
;----------------------------------------------------------------------
        QBNE      ||$C$L10||, r0, 0x00  ; [ALU_PRU] |242| $O$v1
;* --------------------------------------------------------------------------*
;*** 242	-----------------------    __R30 = 3072u;
;*** 242	-----------------------    __delay_cycles(10u);
;*** 242	-----------------------    if ( !(__R31&0x20u) ) goto g4;
        LDI       r30, 0x0c00           ; [ALU_PRU] |242| 
        .newblock
        LDI32    r0, 4
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |242| 
        QBBC      ||$C$L11||, r31, 0x05 ; [ALU_PRU] |242| 
;* --------------------------------------------------------------------------*
||$C$L10||:    
;***	-----------------------g3:
;*** 245	-----------------------    __delay_cycles(9u);
;*** 248	-----------------------    __R30 = 3328u;
;*** 248	-----------------------    __delay_cycles(10u);
;*** 248	-----------------------    tmpval = __R31&0xffu;
;*** 250	-----------------------    __R30 = 3584u;
;*** 250	-----------------------    __delay_cycles(10u);
;*** 250	-----------------------    tmpval |= __R31<<24u>>16;
;*** 252	-----------------------    *(*K$11).dataptr = tmpval;
;*** 255	-----------------------    _tmpval = C$2 = (unsigned char)(*(C$1 = &buslatches+4)&0xef);
;*** 255	-----------------------    buslatches_pru0_dataout((unsigned)C$2);
;*** 255	-----------------------    __R30 = 1024u;
;*** 255	-----------------------    *C$1 = _tmpval;
;*** 255	-----------------------    __delay_cycles(4u);
;*** 255	-----------------------    __R30 = 3072u;
;*** 257	-----------------------    __delay_cycles(7u);
;*** 258	-----------------------    (*K$11).state = &sm_dma_state_99;
	.dwpsn	file "pru1_statemachine_dma.c",line 245,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 245 | __delay_cycles(NANOSECS(75) - 6); // assume 2*3 cycles for buslatches_g
;     | et                                                                     
; 247 | // DATA[0..7] = latch[5]                                               
;----------------------------------------------------------------------
        .newblock
        LDI      r14.w0, 4
$1:     SUB      r14.w0, r14.w0, 1
        QBNE     $1, r14.w0, 0         ; [ALU_PRU] |245| 
	.dwpsn	file "pru1_statemachine_dma.c",line 248,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 248 | tmpval = buslatches_get(5);                                            
; 249 | // DATA[8..15] = latch[6]                                              
;----------------------------------------------------------------------
        LDI       r30, 0x0d00           ; [ALU_PRU] |248| 
        .newblock
        LDI32    r0, 4
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |248| 
        MOV       r0, r31               ; [ALU_PRU] |248| 
        AND       r14.w0, r0.w0, 0xff   ; [ALU_PRU] |248| tmpval
	.dwpsn	file "pru1_statemachine_dma.c",line 250,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 250 | tmpval |= (buslatches_get(6) << 8);                                    
; 251 | // save in buffer                                                      
; 252 | *sm_dma.dataptr = tmpval;                                              
; 253 | // mailbox.dma.words[sm_dma.cur_wordidx] = tmpval;                     
; 254 | // negate MSYN                                                         
;----------------------------------------------------------------------
        LDI       r30, 0x0e00           ; [ALU_PRU] |250| 
        .newblock
        LDI32    r1, 4
$1:     SUB      r1, r1, 1
        QBNE     $1, r1, 0             ; [ALU_PRU] |250| 
	.dwpsn	file "pru1_statemachine_dma.c",line 255,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 255 | buslatches_setbits(4, BIT(4), 0);                                      
;----------------------------------------------------------------------
        LDI       r7, ||buslatches||+4  ; [ALU_PRU] |255| $O$C1,buslatches
	.dwpsn	file "pru1_statemachine_dma.c",line 250,column 2,is_stmt,isa 0
        LSL       r0, r31, 0x18         ; [ALU_PRU] |250| 
        OR        r14.w0, r14.w0, r0.w2 ; [ALU_PRU] |250| tmpval,tmpval
	.dwpsn	file "pru1_statemachine_dma.c",line 252,column 2,is_stmt,isa 0
        LBBO      &r0, r4, 3, 4         ; [ALU_PRU] |252| $O$K11
        SBBO      &r14.w0, r0, 0, 2     ; [ALU_PRU] |252| tmpval
	.dwpsn	file "pru1_statemachine_dma.c",line 255,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 256 | // DATI: remove address,control, MSYN,SSYN from bus, 75ns after MSYN in
;     | active                                                                 
;----------------------------------------------------------------------
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |255| $O$C1
        AND       r5.b0, r0.b0, 0xef    ; [ALU_PRU] |255| $O$C2
        MOV       r14, r5.b0            ; [ALU_PRU] |255| $O$C2
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$60, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |255| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |255| 
        SBBO      &r5.b0, r7, 0, 1      ; [ALU_PRU] |255| $O$C1,_tmpval
        .newblock
        LDI32    r6, 1
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |255| 
        LDI       r30, 0x0c00           ; [ALU_PRU] |255| 
	.dwpsn	file "pru1_statemachine_dma.c",line 257,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 257 | __delay_cycles(NANOSECS(75) - 8); // assume 8 cycles for state change  
;----------------------------------------------------------------------
        .newblock
        LDI      r5.w1, 3
$1:     SUB      r5.w1, r5.w1, 1
        QBNE     $1, r5.w1, 0          ; [ALU_PRU] |257| 
	.dwpsn	file "pru1_statemachine_dma.c",line 258,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 258 | sm_dma.state = &sm_dma_state_99;                                       
; 259 | return 0; // still running                                             
;----------------------------------------------------------------------
        LDI       r0.w0, $CODE(||sm_dma_state_99||) ; [ALU_PRU] |258| sm_dma_state_99
        SBBO      &r0.w0, r4, 0, 2      ; [ALU_PRU] |258| $O$K11
;* --------------------------------------------------------------------------*
||$C$L11||:    
;***	-----------------------g4:
;*** 243	-----------------------    return 0;
        LBBO      &r3.b2, r2, 0, 9      ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
	.dwcfi	restore_reg, 16
	.dwcfi	restore_reg, 17
	.dwcfi	restore_reg, 18
	.dwcfi	restore_reg, 19
	.dwcfi	restore_reg, 20
	.dwcfi	restore_reg, 21
	.dwcfi	restore_reg, 22
        LBBO      &r6.b0, r2, 9, 8      ; [ALU_PRU] 
	.dwcfi	restore_reg, 24
	.dwcfi	restore_reg, 25
	.dwcfi	restore_reg, 26
	.dwcfi	restore_reg, 27
	.dwcfi	restore_reg, 28
	.dwcfi	restore_reg, 29
	.dwcfi	restore_reg, 30
	.dwcfi	restore_reg, 31
	.dwpsn	file "pru1_statemachine_dma.c",line 243,column 3,is_stmt,isa 0
        LDI       r14.b0, 0x00          ; [ALU_PRU] |243| 
        ADD       r2, r2, 0x11          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$61	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$61, DW_AT_low_pc(0x00)
	.dwattr $C$DW$61, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$52, DW_AT_TI_end_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$52, DW_AT_TI_end_line(0x104)
	.dwattr $C$DW$52, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$52

	.sect	".text:sm_dma_state_1"
	.clink

$C$DW$62	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$62, DW_AT_name("sm_dma_state_1")
	.dwattr $C$DW$62, DW_AT_low_pc(||sm_dma_state_1||)
	.dwattr $C$DW$62, DW_AT_high_pc(0x00)
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("sm_dma_state_1")
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$62, DW_AT_TI_begin_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$62, DW_AT_TI_begin_line(0x63)
	.dwattr $C$DW$62, DW_AT_TI_begin_column(0x10)
	.dwattr $C$DW$62, DW_AT_decl_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$62, DW_AT_decl_line(0x63)
	.dwattr $C$DW$62, DW_AT_decl_column(0x10)
	.dwattr $C$DW$62, DW_AT_TI_max_frame_size(0x28)
	.dwpsn	file "pru1_statemachine_dma.c",line 99,column 33,is_stmt,address ||sm_dma_state_1||,isa 0

	.dwfde $C$DW$CIE, ||sm_dma_state_1||
;----------------------------------------------------------------------
;  99 | static uint8_t sm_dma_state_1() {                                      
; 100 | uint32_t tmpval;                                                       
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: sm_dma_state_1                FR SIZE:  40           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            2 Auto, 38 SOE     *
;***************************************************************

||sm_dma_state_1||:
;* --------------------------------------------------------------------------*
$C$DW$63	.dwtag  DW_TAG_variable
	.dwattr $C$DW$63, DW_AT_name("data")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("data")
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$63, DW_AT_location[DW_OP_breg8 0]

;* r4_0  assigned to $O$C1
$C$DW$64	.dwtag  DW_TAG_variable
	.dwattr $C$DW$64, DW_AT_name("$O$C1")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$64, DW_AT_location[DW_OP_reg16]

;* r6_0  assigned to $O$C2
$C$DW$65	.dwtag  DW_TAG_variable
	.dwattr $C$DW$65, DW_AT_name("$O$C2")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$65, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to $O$C3
$C$DW$66	.dwtag  DW_TAG_variable
	.dwattr $C$DW$66, DW_AT_name("$O$C3")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$66, DW_AT_location[DW_OP_reg24]

;* r0_0  assigned to $O$C4
$C$DW$67	.dwtag  DW_TAG_variable
	.dwattr $C$DW$67, DW_AT_name("$O$C4")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("$O$C4")
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$140)
	.dwattr $C$DW$67, DW_AT_location[DW_OP_reg0]

;* r6_0  assigned to $O$C5
$C$DW$68	.dwtag  DW_TAG_variable
	.dwattr $C$DW$68, DW_AT_name("$O$C5")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("$O$C5")
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$68, DW_AT_location[DW_OP_reg24]

;* r0_0  assigned to $O$C6
$C$DW$69	.dwtag  DW_TAG_variable
	.dwattr $C$DW$69, DW_AT_name("$O$C6")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("$O$C6")
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$69, DW_AT_location[DW_OP_reg0]

;* r6_0  assigned to $O$C7
$C$DW$70	.dwtag  DW_TAG_variable
	.dwattr $C$DW$70, DW_AT_name("$O$C7")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("$O$C7")
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$70, DW_AT_location[DW_OP_reg24]

;* r4_0  assigned to $O$C8
$C$DW$71	.dwtag  DW_TAG_variable
	.dwattr $C$DW$71, DW_AT_name("$O$C8")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("$O$C8")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_reg16]

;* r6_0  assigned to $O$C9
$C$DW$72	.dwtag  DW_TAG_variable
	.dwattr $C$DW$72, DW_AT_name("$O$C9")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("$O$C9")
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$72, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to $O$C10
$C$DW$73	.dwtag  DW_TAG_variable
	.dwattr $C$DW$73, DW_AT_name("$O$C10")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("$O$C10")
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$73, DW_AT_location[DW_OP_reg24]

;* r0_0  assigned to $O$C11
$C$DW$74	.dwtag  DW_TAG_variable
	.dwattr $C$DW$74, DW_AT_name("$O$C11")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("$O$C11")
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$140)
	.dwattr $C$DW$74, DW_AT_location[DW_OP_reg0]

;* r5_0  assigned to $O$C12
$C$DW$75	.dwtag  DW_TAG_variable
	.dwattr $C$DW$75, DW_AT_name("$O$C12")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("$O$C12")
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$75, DW_AT_location[DW_OP_reg20]

;* r6_0  assigned to $O$C13
$C$DW$76	.dwtag  DW_TAG_variable
	.dwattr $C$DW$76, DW_AT_name("$O$C13")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("$O$C13")
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$76, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to $O$C14
$C$DW$77	.dwtag  DW_TAG_variable
	.dwattr $C$DW$77, DW_AT_name("$O$C14")
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("$O$C14")
	.dwattr $C$DW$77, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$77, DW_AT_location[DW_OP_reg24]

;* r5_0  assigned to $O$C15
$C$DW$78	.dwtag  DW_TAG_variable
	.dwattr $C$DW$78, DW_AT_name("$O$C15")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("$O$C15")
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$78, DW_AT_location[DW_OP_reg20]

;* r4_0  assigned to $O$C16
$C$DW$79	.dwtag  DW_TAG_variable
	.dwattr $C$DW$79, DW_AT_name("$O$C16")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("$O$C16")
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$79, DW_AT_location[DW_OP_reg16]

;* r7_0  assigned to $O$K22
$C$DW$80	.dwtag  DW_TAG_variable
	.dwattr $C$DW$80, DW_AT_name("$O$K22")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("$O$K22")
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$159)
	.dwattr $C$DW$80, DW_AT_location[DW_OP_reg28]

;* r7_0  assigned to $O$K22
$C$DW$81	.dwtag  DW_TAG_variable
	.dwattr $C$DW$81, DW_AT_name("$O$K22")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("$O$K22")
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$159)
	.dwattr $C$DW$81, DW_AT_location[DW_OP_reg28]

;* r4_0  assigned to $O$K3
$C$DW$82	.dwtag  DW_TAG_variable
	.dwattr $C$DW$82, DW_AT_name("$O$K3")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("$O$K3")
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$82, DW_AT_location[DW_OP_reg16]

;* r8_0  assigned to $O$K16
$C$DW$83	.dwtag  DW_TAG_variable
	.dwattr $C$DW$83, DW_AT_name("$O$K16")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("$O$K16")
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$83, DW_AT_location[DW_OP_regx 0x20]

;* r0_0  assigned to tmpval
$C$DW$84	.dwtag  DW_TAG_variable
	.dwattr $C$DW$84, DW_AT_name("tmpval")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("tmpval")
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$84, DW_AT_location[DW_OP_reg0]

;* r9_0  assigned to addr
$C$DW$85	.dwtag  DW_TAG_variable
	.dwattr $C$DW$85, DW_AT_name("addr")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$85, DW_AT_location[DW_OP_regx 0x24]

;* r6_1  assigned to control
$C$DW$86	.dwtag  DW_TAG_variable
	.dwattr $C$DW$86, DW_AT_name("control")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("control")
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$86, DW_AT_location[DW_OP_reg25]

;* r15_0 assigned to b
$C$DW$87	.dwtag  DW_TAG_variable
	.dwattr $C$DW$87, DW_AT_name("b")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("b")
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$87, DW_AT_location[DW_OP_regx 0x3c]

;* r5_0  assigned to _tmpval
$C$DW$88	.dwtag  DW_TAG_variable
	.dwattr $C$DW$88, DW_AT_name("_tmpval")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$88, DW_AT_location[DW_OP_reg20]

;* r6_0  assigned to _tmpval
$C$DW$89	.dwtag  DW_TAG_variable
	.dwattr $C$DW$89, DW_AT_name("_tmpval")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$89, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to _tmpval
$C$DW$90	.dwtag  DW_TAG_variable
	.dwattr $C$DW$90, DW_AT_name("_tmpval")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$90, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to _tmpval
$C$DW$91	.dwtag  DW_TAG_variable
	.dwattr $C$DW$91, DW_AT_name("_tmpval")
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$91, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$91, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to _tmpval
$C$DW$92	.dwtag  DW_TAG_variable
	.dwattr $C$DW$92, DW_AT_name("_tmpval")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$92, DW_AT_location[DW_OP_reg24]

;* r4_0  assigned to _tmpval
$C$DW$93	.dwtag  DW_TAG_variable
	.dwattr $C$DW$93, DW_AT_name("_tmpval")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$93, DW_AT_location[DW_OP_reg16]

;* r6_0  assigned to _tmpval
$C$DW$94	.dwtag  DW_TAG_variable
	.dwattr $C$DW$94, DW_AT_name("_tmpval")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$94, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to _tmpval
$C$DW$95	.dwtag  DW_TAG_variable
	.dwattr $C$DW$95, DW_AT_name("_tmpval")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$95, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to _tmpval
$C$DW$96	.dwtag  DW_TAG_variable
	.dwattr $C$DW$96, DW_AT_name("_tmpval")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$96, DW_AT_location[DW_OP_reg24]

;* r6_0  assigned to _tmpval
$C$DW$97	.dwtag  DW_TAG_variable
	.dwattr $C$DW$97, DW_AT_name("_tmpval")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$97, DW_AT_location[DW_OP_reg24]

;* r4_0  assigned to _tmpval
$C$DW$98	.dwtag  DW_TAG_variable
	.dwattr $C$DW$98, DW_AT_name("_tmpval")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$98, DW_AT_location[DW_OP_reg16]

	.dwcfi	cfa_offset, 0
;*** 101	-----------------------    addr = (*(C$16 = &mailbox)).$P$T1.dma.cur_addr;
;*** 103	-----------------------    control = (*C$16).$P$T1.dma.control;
;*** 108	-----------------------    if ( (*C$16).$P$T1.dma.cur_status != 2 ) goto g3;
        SUB       r2, r2, 0x28          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 40
        SBBO      &r3.b2, r2, 2, 38     ; [ALU_PRU] 
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
	.dwpsn	file "pru1_statemachine_dma.c",line 101,column 16,is_stmt,isa 0
;----------------------------------------------------------------------
; 101 | uint32_t addr = mailbox.dma.cur_addr; // non-volatile snapshot         
; 102 | uint16_t data;                                                         
;----------------------------------------------------------------------
        LDI32     r4, ||mailbox||       ; [ALU_PRU] |101| $O$C16,mailbox
        LBBO      &r9, r4, 28, 4        ; [ALU_PRU] |101| addr,$O$C16
	.dwpsn	file "pru1_statemachine_dma.c",line 103,column 18,is_stmt,isa 0
;----------------------------------------------------------------------
; 103 | uint8_t control = mailbox.dma.control;                                 
; 104 | // uint8_t page_table_entry;                                           
; 105 | uint8_t b;                                                             
; 106 | bool internal;                                                         
;----------------------------------------------------------------------
        LBBO      &r6.b1, r4, 25, 1     ; [ALU_PRU] |103| control,$O$C16
	.dwpsn	file "pru1_statemachine_dma.c",line 108,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 108 | if (mailbox.dma.cur_status != DMA_STATE_RUNNING || mailbox.dma.wordcoun
;     | t == 0)                                                                
;----------------------------------------------------------------------
        LBBO      &r0.b0, r4, 24, 1     ; [ALU_PRU] |108| $O$C16
        QBNE      ||$C$L12||, r0.b0, 0x02 ; [ALU_PRU] |108| 
;* --------------------------------------------------------------------------*
;*** 108	-----------------------    K$3 = C$16;
;*** 108	-----------------------    if ( (*K$3).$P$T1.dma.wordcount ) goto g4;
        LBBO      &r0.w0, r4, 26, 2     ; [ALU_PRU] |108| $O$K3
        QBNE      ||$C$L13||, r0.w0, 0x00 ; [ALU_PRU] |108| 
;* --------------------------------------------------------------------------*
||$C$L12||:    
;***	-----------------------g3:
;*** 109	-----------------------    return 1;
	.dwpsn	file "pru1_statemachine_dma.c",line 109,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 109 | return 1; // still stopped                                             
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |109| 
        JMP       ||$C$L26||            ; [ALU_PRU] |109| 
;* --------------------------------------------------------------------------*
||$C$L13||:    
;***	-----------------------g4:
;*** 111	-----------------------    if ( sm_dma.cur_wordsleft != 1 ) goto g6;
	.dwpsn	file "pru1_statemachine_dma.c",line 111,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 111 | if (sm_dma.cur_wordsleft == 1) {                                       
; 112 |         // deassert SACK, enable next arbitration cycle                
; 113 |         // deassert SACK before deassert BBSY                          
; 114 |         // parallel to last word data transfer                         
;----------------------------------------------------------------------
        LDI       r0, ||sm_dma||+7      ; [ALU_PRU] |111| sm_dma
        LBBO      &r0.w0, r0, 0, 2      ; [ALU_PRU] |111| 
        QBNE      ||$C$L14||, r0.w0, 0x01 ; [ALU_PRU] |111| 
;* --------------------------------------------------------------------------*
;*** 115	-----------------------    _tmpval = C$15 = (unsigned char)(*(K$22 = &buslatches+1)&0xdf);
;*** 115	-----------------------    buslatches_pru0_dataout((unsigned)C$15);
;*** 115	-----------------------    __R30 = 256u;
;*** 115	-----------------------    *K$22 = _tmpval;
;*** 115	-----------------------    __delay_cycles(4u);
;*** 115	-----------------------    __R30 = 2304u;
	.dwpsn	file "pru1_statemachine_dma.c",line 115,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 115 | buslatches_setbits(1, BIT(5), 0); // SACK = latch[1], bit 5            
;----------------------------------------------------------------------
        LDI       r7, ||buslatches||+1  ; [ALU_PRU] |115| $O$K22,buslatches
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |115| $O$K22
        AND       r5.b0, r0.b0, 0xdf    ; [ALU_PRU] |115| $O$C15
        MOV       r14, r5.b0            ; [ALU_PRU] |115| $O$C15
$C$DW$99	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$99, DW_AT_low_pc(0x00)
	.dwattr $C$DW$99, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$99, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |115| buslatches_pru0_dataout
        LDI       r30, 0x0100           ; [ALU_PRU] |115| 
        SBBO      &r5.b0, r7, 0, 1      ; [ALU_PRU] |115| $O$K22,_tmpval
        .newblock
        LDI32    r8, 1
$1:     SUB      r8, r8, 1
        QBNE     $1, r8, 0             ; [ALU_PRU] |115| 
        LDI       r30, 0x0900           ; [ALU_PRU] |115| 
;* --------------------------------------------------------------------------*
||$C$L14||:    
;***	-----------------------g6:
;*** 118	-----------------------    (*(K$16 = &sm_dma)).state_timeout = C$12 = 0;
;*** 121	-----------------------    buslatches_pru0_dataout(addr&0xffu);
;*** 121	-----------------------    __R30 = 512u;
;*** 121	-----------------------    __delay_cycles(6u);
;*** 121	-----------------------    __R30 = 2560u;
;*** 123	-----------------------    buslatches_pru0_dataout(addr>>8);
;*** 123	-----------------------    __R30 = 768u;
;*** 123	-----------------------    __delay_cycles(6u);
;*** 123	-----------------------    __R30 = 2816u;
;***  	-----------------------    K$22 = &buslatches+4;
;*** 129	-----------------------    if ( control&2 ) goto g12;
	.dwpsn	file "pru1_statemachine_dma.c",line 118,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 118 | sm_dma.state_timeout = 0;                                              
; 120 | // addr0..7 = latch[2]                                                 
;----------------------------------------------------------------------
        ZERO      &r5, 4                ; [ALU_PRU] |118| $O$C12
        LDI       r8, ||sm_dma||        ; [ALU_PRU] |118| $O$K16,sm_dma
	.dwpsn	file "pru1_statemachine_dma.c",line 121,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 121 | buslatches_setbyte(2, addr & 0xff);                                    
;----------------------------------------------------------------------
        AND       r14, r9, 0xff         ; [ALU_PRU] |121| addr
	.dwpsn	file "pru1_statemachine_dma.c",line 118,column 2,is_stmt,isa 0
        SBBO      &r5.b0, r8, 2, 1      ; [ALU_PRU] |118| $O$K16
	.dwpsn	file "pru1_statemachine_dma.c",line 121,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 122 | // addr8..15 = latch[3]                                                
;----------------------------------------------------------------------
$C$DW$100	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$100, DW_AT_low_pc(0x00)
	.dwattr $C$DW$100, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$100, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |121| buslatches_pru0_dataout
        LDI       r30, 0x0200           ; [ALU_PRU] |121| 
        .newblock
        LDI32    r10, 2
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |121| 
	.dwpsn	file "pru1_statemachine_dma.c",line 123,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 123 | buslatches_setbyte(3, (addr >> 8));                                    
;----------------------------------------------------------------------
        LSR       r14, r9, 0x08         ; [ALU_PRU] |123| addr
	.dwpsn	file "pru1_statemachine_dma.c",line 121,column 2,is_stmt,isa 0
        LDI       r30, 0x0a00           ; [ALU_PRU] |121| 
	.dwpsn	file "pru1_statemachine_dma.c",line 123,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 124 | // addr 16,17 = latch[4].0,1                                           
; 125 | // C0 = latch[4], bit 2                                                
; 126 | // C1 = latch[4], bit 3                                                
; 127 | // MSYN = latch[4], bit 4                                              
; 128 | // SSYN = latch[4], bit 5                                              
;----------------------------------------------------------------------
$C$DW$101	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$101, DW_AT_low_pc(0x00)
	.dwattr $C$DW$101, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$101, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |123| buslatches_pru0_dataout
        LDI       r30, 0x0300           ; [ALU_PRU] |123| 
        .newblock
        LDI32    r7, 2
$1:     SUB      r7, r7, 1
        QBNE     $1, r7, 0             ; [ALU_PRU] |123| 
        LDI       r7, ||buslatches||+4  ; [ALU_PRU] $O$K22,buslatches
        LDI       r30, 0x0b00           ; [ALU_PRU] |123| 
	.dwpsn	file "pru1_statemachine_dma.c",line 129,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 129 | if (UNIBUS_CONTROL_ISDATO(control)) {                                  
; 130 |         tmpval = (addr >> 16) & 3;                                     
; 131 |         tmpval |= BIT(3); // DATO: c1=1, c0=0                          
; 132 |         // bit 2,4,5 == 0  -> C0,MSYN,SSYN not asserted                
; 133 |         buslatches_setbits(4, 0x3f, tmpval);                           
; 134 |         // write data. SSYN may still be active???                     
; 135 | //              data = mailbox.dma.words[sm_dma.cur_wordidx];          
; 136 |         data = *sm_dma.dataptr;                                        
; 137 |         buslatches_setbyte(5, data & 0xff); // DATA[0..7] = latch[5]   
; 138 |         buslatches_setbyte(6, data >> 8); // DATA[8..15] = latch[6]    
; 139 |         // wait 150ns, but guaranteed to wait 150ns after SSYN inactive
; 140 |         // prev SSYN & DATA may be still on bus, disturbes DATA        
; 141 |         while (buslatches_get(4) & BIT(5))                             
; 142 |                 ;       // wait for SSYN inactive                      
; 143 |         __delay_cycles(NANOSECS(150) - 10);                            
; 144 |         // assume 10 cycles for buslatches_get and address test        
; 145 |         // ADDR, CONTROL (and DATA) stable since 150ns, set MSYN       
; 147 |         // use 150ns delay to check for internal address               
; 148 |         // page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);  
; 149 |         // !!! optimizer may not move this around !!!                  
; 150 |         // try "volatile internal_addr" (__asm(";---") may be rearanged
;     | )                                                                      
; 152 |         // MSYN = latch[4], bit 4                                      
; 153 |         buslatches_setbits(4, BIT(4), BIT(4)); // master assert MSYN   
; 155 |         // DATO to internal slave (fast test).                         
; 156 |         // write data into slave (                                     
; 157 |         switch (control) {                                             
; 158 |         case UNIBUS_CONTROL_DATO:                                      
; 159 |                 internal = iopageregisters_write_w(addr, data);        
; 160 |                 break;                                                 
; 161 |         case UNIBUS_CONTROL_DATOB:                                     
; 162 |                 // A00=1: upper byte, A00=0: lower byte                
; 163 |                 b = (addr & 1) ? (data >> 8) : (data & 0xff);          
; 164 |                 internal = iopageregisters_write_b(addr, b); // always
;     | sucessful, addr already tested                                         
; 165 |                 break;                                                 
; 166 |         default:                                                       
; 167 |                 internal = false; // not reached                       
; 169 |         if (internal) {                                                
; 170 |                 buslatches_setbits(4, BIT(5), BIT(5)); // slave assert
;     | SSYN                                                                   
; 171 |                 buslatches_setbits(4, BIT(4), 0); // master deassert MS
;     | YN                                                                     
; 172 |                 buslatches_setbyte(5, 0); // master removes data       
; 173 |                 buslatches_setbyte(6, 0);                              
; 174 |                 // perhaps PRU2ARM_INTERRUPT now active,               
; 175 |                 // assert SSYN after ARM completes "active" register lo
;     | gic and INIT                                                           
; 176 |                 while (mailbox.events.eventmask) ;                     
; 178 |                 buslatches_setbits(4, BIT(5), 0); // slave deassert SSY
;     | N                                                                      
; 179 |                 sm_dma.state = &sm_dma_state_99; // next word          
; 180 |         } else {                                                       
; 181 |                 // DATO to external slave                              
; 182 |                 // wait for a slave SSYN                               
; 183 |                 TIMEOUT_SET(NANOSECS(1000*UNIBUS_TIMEOUT_PERIOD_US));  
; 184 |                 sm_dma.state = &sm_dma_state_21; // wait SSYN DATAO    
; 186 | } else {                                                               
; 187 |         // DATI or DATIP                                               
; 188 |         tmpval = (addr >> 16) & 3;                                     
; 189 |         // bit 2,3,4,5 == 0  -> C0,C1,MSYN,SSYN not asserted           
;----------------------------------------------------------------------
        QBBS      ||$C$L17||, r6.b1, 0x01 ; [ALU_PRU] |129| control
;* --------------------------------------------------------------------------*
;*** 190	-----------------------    _tmpval = C$14 = (unsigned char)(*K$22&0xc0u|addr>>16&3u);
;*** 190	-----------------------    buslatches_pru0_dataout((unsigned)C$14);
;*** 190	-----------------------    __R30 = 1024u;
;*** 190	-----------------------    *K$22 = _tmpval;
;*** 190	-----------------------    __delay_cycles(4u);
;*** 190	-----------------------    __R30 = 3072u;
;*** 193	-----------------------    __delay_cycles(20u);
;*** 202	-----------------------    _tmpval = C$13 = (unsigned char)(*K$22|0x10);
;*** 202	-----------------------    buslatches_pru0_dataout((unsigned)C$13);
;*** 202	-----------------------    __R30 = 1024u;
;*** 202	-----------------------    *K$22 = _tmpval;
;*** 202	-----------------------    __delay_cycles(4u);
;*** 202	-----------------------    __R30 = 3072u;
;*** 204	-----------------------    if ( iopageregisters_read(addr, &data) ) goto g9;
	.dwpsn	file "pru1_statemachine_dma.c",line 190,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 190 | buslatches_setbits(4, 0x3f, tmpval);                                   
; 192 | // wait 150ns after MSYN, no distance to SSYN required                 
;----------------------------------------------------------------------
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |190| $O$K22
        AND       r0.b1, r0.b0, 0xc0    ; [ALU_PRU] |190| 
        AND       r0.b0, r9.b2, 0x03    ; [ALU_PRU] |190| 
        OR        r6.b0, r0.b1, r0.b0   ; [ALU_PRU] |190| $O$C14
        MOV       r14, r6.b0            ; [ALU_PRU] |190| $O$C14
$C$DW$102	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$102, DW_AT_low_pc(0x00)
	.dwattr $C$DW$102, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$102, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |190| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |190| 
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |190| $O$K22,_tmpval
        .newblock
        LDI32    r12, 1
$1:     SUB      r12, r12, 1
        QBNE     $1, r12, 0            ; [ALU_PRU] |190| 
        LDI       r30, 0x0c00           ; [ALU_PRU] |190| 
	.dwpsn	file "pru1_statemachine_dma.c",line 193,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 193 | __delay_cycles(NANOSECS(150) - 10);                                    
; 194 | // assume 10 cycles for buslatches_get and address test                
; 195 | // ADDR, CONTROL (and DATA) stable since 150ns, set MSYN next          
; 197 | // use 150ns delay to check for internal address                       
; 198 | // page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);          
; 199 | // !!! optimizer may not move this around !!!                          
; 201 | // MSYN = latch[4], bit 4                                              
;----------------------------------------------------------------------
        .newblock
        LDI32    r11, 9
$1:     SUB      r11, r11, 1
        QBNE     $1, r11, 0            ; [ALU_PRU] |193| 
	.dwpsn	file "pru1_statemachine_dma.c",line 202,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 202 | buslatches_setbits(4, BIT(4), BIT(4)); // master assert MSYN           
;----------------------------------------------------------------------
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |202| $O$K22
        SET       r6.b0, r0.b0, 0x00000004 ; [ALU_PRU] |202| $O$C13
        MOV       r14, r6.b0            ; [ALU_PRU] |202| $O$C13
$C$DW$103	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$103, DW_AT_low_pc(0x00)
	.dwattr $C$DW$103, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$103, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |202| buslatches_pru0_dataout
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |202| $O$K22,_tmpval
        LDI       r30, 0x0400           ; [ALU_PRU] |202| 
        .newblock
        LDI32    r10, 1
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |202| 
	.dwpsn	file "pru1_statemachine_dma.c",line 204,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 204 | if (iopageregisters_read(addr, &data)) {                               
;----------------------------------------------------------------------
        MOV       r14, r9               ; [ALU_PRU] |204| addr
        ADD       r15, r2, 0            ; [ALU_PRU] |204| data,data
	.dwpsn	file "pru1_statemachine_dma.c",line 202,column 3,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |202| 
	.dwpsn	file "pru1_statemachine_dma.c",line 204,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 205 | // DATI to internal slave: put MSYN/SSYN/DATA protocol onto bus,       
; 206 | // slave puts data onto bus                                            
; 207 | // DATA[0..7] = latch[5]                                               
; 208 | buslatches_setbyte(5, data & 0xff);                                    
; 209 | // DATA[8..15] = latch[6]                                              
; 210 | buslatches_setbyte(6, data >> 8);                                      
; 211 | // theoretically another bus member could set bits in bus addr & data .
;     | ..                                                                     
; 212 | // if yes, we would have to read back the bus lines                    
; 213 | *sm_dma.dataptr = data;                                                
; 214 | //                      mailbox.dma.words[sm_dma.cur_wordidx] = data;  
; 216 | buslatches_setbits(4, BIT(5), BIT(5)); // slave assert SSYN            
; 217 | buslatches_setbits(4, BIT(4), 0); // master deassert MSYN              
; 218 | buslatches_setbyte(5, 0); // slave removes data                        
; 219 | buslatches_setbyte(6, 0);                                              
; 220 | // perhaps PRU2ARM_INTERRUPT now active,                               
; 221 | // assert SSYN after ARM completes "active" register logic and INIT    
; 222 | while (mailbox.events.eventmask) ;                                     
; 224 | buslatches_setbits(4, BIT(5), 0); // slave deassert SSYN               
; 225 | sm_dma.state = &sm_dma_state_99; // next word                          
; 226 | } else {                                                               
; 227 | // DATI to external slave                                              
; 228 | // wait for a slave SSYN                                               
;----------------------------------------------------------------------
$C$DW$104	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$104, DW_AT_low_pc(0x00)
	.dwattr $C$DW$104, DW_AT_name("iopageregisters_read")
	.dwattr $C$DW$104, DW_AT_TI_call

        JAL       r3.w2, ||iopageregisters_read|| ; [ALU_PRU] |204| iopageregisters_read
        QBNE      ||$C$L15||, r14.b0, 0x00 ; [ALU_PRU] |204| 
;* --------------------------------------------------------------------------*
;*** 229	-----------------------    *(volatile unsigned *)(C$11 = (volatile struct $$fake26 *)0x24000u) &= 0xfffffff7u;
;*** 229	-----------------------    (*(volatile struct $$fake35 *)C$11).$P$T18.CYCLE = C$12;
;*** 229	-----------------------    timeout_target = 3976u;
;*** 229	-----------------------    *(volatile unsigned *)C$11 |= 0x8u;
;*** 230	-----------------------    (*K$16).state = &sm_dma_state_11;
;*** 234	-----------------------    return 0;
	.dwpsn	file "pru1_statemachine_dma.c",line 229,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 229 | TIMEOUT_SET(NANOSECS(1000*UNIBUS_TIMEOUT_PERIOD_US));                  
; 230 | sm_dma.state = &sm_dma_state_11; // wait SSYN DATI                     
;----------------------------------------------------------------------
        LDI32     r0, 0x00024000        ; [ALU_PRU] |229| $O$C11
        LDI       r14, ||timeout_target|| ; [ALU_PRU] |229| timeout_target
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |229| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |229| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |229| 
        SBBO      &r5, r0, 12, 4        ; [ALU_PRU] |229| $O$C11,$O$C12
        LDI       r1, 0x0f88            ; [ALU_PRU] |229| 
        SBBO      &r1, r14, 0, 4        ; [ALU_PRU] |229| 
	.dwpsn	file "pru1_statemachine_dma.c",line 234,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 234 | return 0; // still running                                             
;----------------------------------------------------------------------
        LDI       r14.b0, 0x00          ; [ALU_PRU] |234| 
	.dwpsn	file "pru1_statemachine_dma.c",line 229,column 4,is_stmt,isa 0
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |229| $O$C11
        SET       r1, r1, 0x00000003    ; [ALU_PRU] |229| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |229| $O$C11
	.dwpsn	file "pru1_statemachine_dma.c",line 230,column 4,is_stmt,isa 0
        LDI       r0.w0, $CODE(||sm_dma_state_11||) ; [ALU_PRU] |230| sm_dma_state_11
        SBBO      &r0.w0, r8, 0, 2      ; [ALU_PRU] |230| $O$K16
	.dwpsn	file "pru1_statemachine_dma.c",line 234,column 2,is_stmt,isa 0
        JMP       ||$C$L26||            ; [ALU_PRU] |234| 
;* --------------------------------------------------------------------------*
||$C$L15||:    
;***	-----------------------g9:
;*** 208	-----------------------    buslatches_pru0_dataout(data&0xffu);
;*** 208	-----------------------    __R30 = 1280u;
;*** 208	-----------------------    __delay_cycles(6u);
;*** 208	-----------------------    __R30 = 3328u;
;*** 210	-----------------------    buslatches_pru0_dataout((int)data>>8);
;*** 210	-----------------------    __R30 = 1536u;
;*** 210	-----------------------    __delay_cycles(6u);
;*** 210	-----------------------    __R30 = 3584u;
;*** 213	-----------------------    *(*K$16).dataptr = data;
;*** 216	-----------------------    _tmpval = C$10 = (unsigned char)(*K$22|0x20);
;*** 216	-----------------------    buslatches_pru0_dataout((unsigned)C$10);
;*** 216	-----------------------    __R30 = 1024u;
;*** 216	-----------------------    *K$22 = _tmpval;
;*** 216	-----------------------    __delay_cycles(4u);
;*** 216	-----------------------    __R30 = 3072u;
;*** 217	-----------------------    _tmpval = C$9 = (unsigned char)(*K$22&0xef);
;*** 217	-----------------------    buslatches_pru0_dataout((unsigned)C$9);
;*** 217	-----------------------    __R30 = 1024u;
;*** 217	-----------------------    *K$22 = _tmpval;
;*** 217	-----------------------    __delay_cycles(4u);
;*** 217	-----------------------    __R30 = 3072u;
;*** 218	-----------------------    buslatches_pru0_dataout(0u);
;*** 218	-----------------------    __R30 = 1280u;
;*** 218	-----------------------    __delay_cycles(6u);
;*** 218	-----------------------    __R30 = 3328u;
;*** 219	-----------------------    buslatches_pru0_dataout(0u);
;*** 219	-----------------------    __R30 = 1536u;
;*** 219	-----------------------    __delay_cycles(6u);
;*** 219	-----------------------    __R30 = 3584u;
;***  	-----------------------    #pragma LOOP_FLAGS(4096u)
	.dwpsn	file "pru1_statemachine_dma.c",line 208,column 4,is_stmt,isa 0
        LBBO      &r0.w0, r2, 0, 2      ; [ALU_PRU] |208| data
        AND       r14, r0.w0, 0xff      ; [ALU_PRU] |208| 
$C$DW$105	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$105, DW_AT_low_pc(0x00)
	.dwattr $C$DW$105, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$105, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |208| buslatches_pru0_dataout
        LDI       r30, 0x0500           ; [ALU_PRU] |208| 
        .newblock
        LDI32    r12, 2
$1:     SUB      r12, r12, 1
        QBNE     $1, r12, 0            ; [ALU_PRU] |208| 
	.dwpsn	file "pru1_statemachine_dma.c",line 210,column 4,is_stmt,isa 0
        LBBO      &r0.w0, r2, 0, 2      ; [ALU_PRU] |210| data
	.dwpsn	file "pru1_statemachine_dma.c",line 208,column 4,is_stmt,isa 0
        LDI       r30, 0x0d00           ; [ALU_PRU] |208| 
	.dwpsn	file "pru1_statemachine_dma.c",line 210,column 4,is_stmt,isa 0
        MOV       r0, r0.w0             ; [ALU_PRU] |210| 
        LSR       r14, r0, 0x08         ; [ALU_PRU] |210| 
$C$DW$106	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$106, DW_AT_low_pc(0x00)
	.dwattr $C$DW$106, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$106, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |210| buslatches_pru0_dataout
        LDI       r30, 0x0600           ; [ALU_PRU] |210| 
        .newblock
        LDI32    r6, 2
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |210| 
	.dwpsn	file "pru1_statemachine_dma.c",line 213,column 4,is_stmt,isa 0
        LBBO      &r0.w0, r2, 0, 2      ; [ALU_PRU] |213| data
        LBBO      &r1, r8, 3, 4         ; [ALU_PRU] |213| $O$K16
	.dwpsn	file "pru1_statemachine_dma.c",line 210,column 4,is_stmt,isa 0
        LDI       r30, 0x0e00           ; [ALU_PRU] |210| 
	.dwpsn	file "pru1_statemachine_dma.c",line 213,column 4,is_stmt,isa 0
        SBBO      &r0.w0, r1, 0, 2      ; [ALU_PRU] |213| 
	.dwpsn	file "pru1_statemachine_dma.c",line 216,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |216| $O$K22
        SET       r6.b0, r0.b0, 0x00000005 ; [ALU_PRU] |216| $O$C10
        MOV       r14, r6.b0            ; [ALU_PRU] |216| $O$C10
$C$DW$107	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$107, DW_AT_low_pc(0x00)
	.dwattr $C$DW$107, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$107, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |216| buslatches_pru0_dataout
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |216| $O$K22,_tmpval
        LDI       r30, 0x0400           ; [ALU_PRU] |216| 
        .newblock
        LDI32    r11, 1
$1:     SUB      r11, r11, 1
        QBNE     $1, r11, 0            ; [ALU_PRU] |216| 
	.dwpsn	file "pru1_statemachine_dma.c",line 217,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |217| $O$K22
	.dwpsn	file "pru1_statemachine_dma.c",line 216,column 4,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |216| 
	.dwpsn	file "pru1_statemachine_dma.c",line 217,column 4,is_stmt,isa 0
        AND       r6.b0, r0.b0, 0xef    ; [ALU_PRU] |217| $O$C9
        MOV       r14, r6.b0            ; [ALU_PRU] |217| $O$C9
$C$DW$108	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$108, DW_AT_low_pc(0x00)
	.dwattr $C$DW$108, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$108, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |217| buslatches_pru0_dataout
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |217| $O$K22,_tmpval
        LDI       r30, 0x0400           ; [ALU_PRU] |217| 
        .newblock
        LDI32    r10, 1
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |217| 
        MOV       r14, r5               ; [ALU_PRU] 
        LDI       r30, 0x0c00           ; [ALU_PRU] |217| 
	.dwpsn	file "pru1_statemachine_dma.c",line 218,column 4,is_stmt,isa 0
$C$DW$109	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$109, DW_AT_low_pc(0x00)
	.dwattr $C$DW$109, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$109, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |218| buslatches_pru0_dataout
        LDI       r30, 0x0500           ; [ALU_PRU] |218| 
        .newblock
        LDI32    r9, 2
$1:     SUB      r9, r9, 1
        QBNE     $1, r9, 0             ; [ALU_PRU] |218| 
        MOV       r14, r5               ; [ALU_PRU] 
        LDI       r30, 0x0d00           ; [ALU_PRU] |218| 
	.dwpsn	file "pru1_statemachine_dma.c",line 219,column 4,is_stmt,isa 0
$C$DW$110	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$110, DW_AT_low_pc(0x00)
	.dwattr $C$DW$110, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$110, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |219| buslatches_pru0_dataout
        LDI       r30, 0x0600           ; [ALU_PRU] |219| 
        .newblock
        LDI32    r5, 2
$1:     SUB      r5, r5, 1
        QBNE     $1, r5, 0             ; [ALU_PRU] |219| 
        LDI       r30, 0x0e00           ; [ALU_PRU] |219| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L16||
;*
;*   Loop source line                : 208
;*   Loop closing brace source line  : 208
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L16||:    
;***	-----------------------g10:
;*** 222	-----------------------    if ( (*K$3).events.eventmask ) goto g10;
	.dwpsn	file "pru1_statemachine_dma.c",line 222,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r4, 12, 1     ; [ALU_PRU] |222| $O$K3
        QBNE      ||$C$L16||, r0.b0, 0x00 ; [ALU_PRU] |222| 
;* --------------------------------------------------------------------------*
;*** 224	-----------------------    _tmpval = C$8 = (unsigned char)(*K$22&0xdf);
;*** 224	-----------------------    buslatches_pru0_dataout((unsigned)C$8);
;*** 224	-----------------------    __R30 = 1024u;
;*** 224	-----------------------    *K$22 = _tmpval;
;*** 224	-----------------------    __delay_cycles(4u);
;*** 224	-----------------------    __R30 = 3072u;
;*** 225	-----------------------    (*K$16).state = &sm_dma_state_99;
;*** 234	-----------------------    return 0;
	.dwpsn	file "pru1_statemachine_dma.c",line 224,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |224| $O$K22
        AND       r4.b0, r0.b0, 0xdf    ; [ALU_PRU] |224| $O$C8
        MOV       r14, r4.b0            ; [ALU_PRU] |224| $O$C8
$C$DW$111	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$111, DW_AT_low_pc(0x00)
	.dwattr $C$DW$111, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$111, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |224| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |224| 
        SBBO      &r4.b0, r7, 0, 1      ; [ALU_PRU] |224| $O$K22,_tmpval
        .newblock
        LDI32    r5, 1
$1:     SUB      r5, r5, 1
        QBNE     $1, r5, 0             ; [ALU_PRU] |224| 
	.dwpsn	file "pru1_statemachine_dma.c",line 225,column 4,is_stmt,isa 0
        LDI       r0.w0, $CODE(||sm_dma_state_99||) ; [ALU_PRU] |225| sm_dma_state_99
	.dwpsn	file "pru1_statemachine_dma.c",line 234,column 2,is_stmt,isa 0
        LDI       r14.b0, 0x00          ; [ALU_PRU] |234| 
	.dwpsn	file "pru1_statemachine_dma.c",line 224,column 4,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |224| 
	.dwpsn	file "pru1_statemachine_dma.c",line 225,column 4,is_stmt,isa 0
        SBBO      &r0.w0, r8, 0, 2      ; [ALU_PRU] |225| $O$K16
	.dwpsn	file "pru1_statemachine_dma.c",line 234,column 2,is_stmt,isa 0
        JMP       ||$C$L26||            ; [ALU_PRU] |234| 
;* --------------------------------------------------------------------------*
||$C$L17||:    
;***	-----------------------g12:
;*** 130	-----------------------    tmpval = addr>>16&3u;
;*** 133	-----------------------    _tmpval = C$7 = (unsigned char)(*K$22&0xc0u|(tmpval |= 0x8u)&0x3fu);
;*** 133	-----------------------    buslatches_pru0_dataout((unsigned)C$7);
;*** 133	-----------------------    __R30 = 1024u;
;*** 133	-----------------------    *K$22 = _tmpval;
;*** 133	-----------------------    __delay_cycles(4u);
;*** 133	-----------------------    __R30 = 3072u;
;*** 136	-----------------------    data = C$6 = *(*K$16).dataptr;
;*** 137	-----------------------    buslatches_pru0_dataout(C$6&0xffu);
;*** 137	-----------------------    __R30 = 1280u;
;*** 137	-----------------------    __delay_cycles(6u);
;*** 137	-----------------------    __R30 = 3328u;
;*** 138	-----------------------    buslatches_pru0_dataout((int)data>>8);
;*** 138	-----------------------    __R30 = 1536u;
;*** 138	-----------------------    __delay_cycles(6u);
;*** 138	-----------------------    __R30 = 3584u;
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_statemachine_dma.c",line 130,column 3,is_stmt,isa 0
        LSR       r0, r9, 0x10          ; [ALU_PRU] |130| addr
        AND       r0, r0, 0x03          ; [ALU_PRU] |130| tmpval
	.dwpsn	file "pru1_statemachine_dma.c",line 133,column 3,is_stmt,isa 0
        SET       r0, r0, 0x00000003    ; [ALU_PRU] |133| tmpval,tmpval
        LBBO      &r0.b1, r7, 0, 1      ; [ALU_PRU] |133| $O$K22
        AND       r0.b0, r0.b0, 0x3f    ; [ALU_PRU] |133| 
        AND       r0.b1, r0.b1, 0xc0    ; [ALU_PRU] |133| 
        OR        r6.b0, r0.b1, r0.b0   ; [ALU_PRU] |133| $O$C7
        MOV       r14, r6.b0            ; [ALU_PRU] |133| $O$C7
$C$DW$112	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$112, DW_AT_low_pc(0x00)
	.dwattr $C$DW$112, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$112, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |133| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |133| 
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |133| $O$K22,_tmpval
        .newblock
        LDI32    r12, 1
$1:     SUB      r12, r12, 1
        QBNE     $1, r12, 0            ; [ALU_PRU] |133| 
	.dwpsn	file "pru1_statemachine_dma.c",line 136,column 3,is_stmt,isa 0
        LBBO      &r0, r8, 3, 4         ; [ALU_PRU] |136| $O$K16
	.dwpsn	file "pru1_statemachine_dma.c",line 133,column 3,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |133| 
	.dwpsn	file "pru1_statemachine_dma.c",line 136,column 3,is_stmt,isa 0
        LBBO      &r0.w0, r0, 0, 2      ; [ALU_PRU] |136| $O$C6
        SBBO      &r0.w0, r2, 0, 2      ; [ALU_PRU] |136| data,$O$C6
	.dwpsn	file "pru1_statemachine_dma.c",line 137,column 3,is_stmt,isa 0
        AND       r14, r0.w0, 0xff      ; [ALU_PRU] |137| $O$C6
$C$DW$113	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$113, DW_AT_low_pc(0x00)
	.dwattr $C$DW$113, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$113, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |137| buslatches_pru0_dataout
        LDI       r30, 0x0500           ; [ALU_PRU] |137| 
        .newblock
        LDI32    r11, 2
$1:     SUB      r11, r11, 1
        QBNE     $1, r11, 0            ; [ALU_PRU] |137| 
	.dwpsn	file "pru1_statemachine_dma.c",line 138,column 3,is_stmt,isa 0
        LBBO      &r0.w0, r2, 0, 2      ; [ALU_PRU] |138| data
	.dwpsn	file "pru1_statemachine_dma.c",line 137,column 3,is_stmt,isa 0
        LDI       r30, 0x0d00           ; [ALU_PRU] |137| 
	.dwpsn	file "pru1_statemachine_dma.c",line 138,column 3,is_stmt,isa 0
        MOV       r0, r0.w0             ; [ALU_PRU] |138| 
        LSR       r14, r0, 0x08         ; [ALU_PRU] |138| 
$C$DW$114	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$114, DW_AT_low_pc(0x00)
	.dwattr $C$DW$114, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$114, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |138| buslatches_pru0_dataout
        LDI       r30, 0x0600           ; [ALU_PRU] |138| 
        .newblock
        LDI32    r10, 2
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |138| 
        LDI       r30, 0x0e00           ; [ALU_PRU] |138| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L18||
;*
;*   Loop source line                : 133
;*   Loop closing brace source line  : 133
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L18||:    
;***	-----------------------g13:
;*** 141	-----------------------    __R30 = 3072u;
;*** 141	-----------------------    __delay_cycles(10u);
;*** 141	-----------------------    if ( __R31&0x20 ) goto g13;
	.dwpsn	file "pru1_statemachine_dma.c",line 141,column 3,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |141| 
        .newblock
        LDI32    r0, 4
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |141| 
        QBBS      ||$C$L18||, r31, 0x05 ; [ALU_PRU] |141| 
;* --------------------------------------------------------------------------*
;*** 143	-----------------------    __delay_cycles(20u);
;*** 153	-----------------------    _tmpval = C$5 = (unsigned char)(*K$22|0x10);
;*** 153	-----------------------    buslatches_pru0_dataout((unsigned)C$5);
;*** 153	-----------------------    __R30 = 1024u;
;*** 153	-----------------------    *K$22 = _tmpval;
;*** 153	-----------------------    __delay_cycles(4u);
;*** 153	-----------------------    __R30 = 3072u;
;*** 157	-----------------------    switch ( control ) {case 2: goto g19;, case 3: goto g15;, DEFAULT goto g20};
	.dwpsn	file "pru1_statemachine_dma.c",line 143,column 3,is_stmt,isa 0
        .newblock
        LDI32    r0, 9
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |143| 
	.dwpsn	file "pru1_statemachine_dma.c",line 153,column 3,is_stmt,isa 0
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |153| $O$K22
        SET       r6.b0, r0.b0, 0x00000004 ; [ALU_PRU] |153| $O$C5
        MOV       r14, r6.b0            ; [ALU_PRU] |153| $O$C5
$C$DW$115	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$115, DW_AT_low_pc(0x00)
	.dwattr $C$DW$115, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$115, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |153| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |153| 
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |153| $O$K22,_tmpval
        .newblock
        LDI32    r10, 1
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |153| 
	.dwpsn	file "pru1_statemachine_dma.c",line 157,column 3,is_stmt,isa 0
        MOV       r0, r6.b1             ; [ALU_PRU] |157| control
	.dwpsn	file "pru1_statemachine_dma.c",line 153,column 3,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |153| 
	.dwpsn	file "pru1_statemachine_dma.c",line 157,column 3,is_stmt,isa 0
        QBEQ      ||$C$L22||, r0, 0x02  ; [ALU_PRU] |157| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L19||, r0, 0x03  ; [ALU_PRU] |157| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L23||            ; [ALU_PRU] |157| 
;* --------------------------------------------------------------------------*
||$C$L19||:    
;***	-----------------------g15:
;*** 163	-----------------------    if ( addr&1u ) goto g17;
	.dwpsn	file "pru1_statemachine_dma.c",line 163,column 4,is_stmt,isa 0
        QBBS      ||$C$L20||, r9, 0x00  ; [ALU_PRU] |163| addr
;* --------------------------------------------------------------------------*
;*** 163	-----------------------    b = data;
;*** 163	-----------------------    goto g18;
        LBBO      &r15.b0, r2, 0, 1     ; [ALU_PRU] |163| b,data
        JMP       ||$C$L21||            ; [ALU_PRU] |163| 
;* --------------------------------------------------------------------------*
||$C$L20||:    
;***	-----------------------g17:
;*** 163	-----------------------    b = (int)data>>8;
        LBBO      &r0.w0, r2, 0, 2      ; [ALU_PRU] |163| data
        MOV       r0, r0.w0             ; [ALU_PRU] |163| 
        MOV       r15.b0, r0.b1         ; [ALU_PRU] |163| b
;* --------------------------------------------------------------------------*
||$C$L21||:    
;***	-----------------------g18:
;*** 164	-----------------------    if ( !iopageregisters_write_b(addr, b) ) goto g20;
	.dwpsn	file "pru1_statemachine_dma.c",line 164,column 4,is_stmt,isa 0
        MOV       r14, r9               ; [ALU_PRU] |164| addr
$C$DW$116	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$116, DW_AT_low_pc(0x00)
	.dwattr $C$DW$116, DW_AT_name("iopageregisters_write_b")
	.dwattr $C$DW$116, DW_AT_TI_call

        JAL       r3.w2, ||iopageregisters_write_b|| ; [ALU_PRU] |164| iopageregisters_write_b
        QBEQ      ||$C$L23||, r14.b0, 0x00 ; [ALU_PRU] |164| 
;* --------------------------------------------------------------------------*
;*** 164	-----------------------    goto g21;
        JMP       ||$C$L24||            ; [ALU_PRU] |164| 
;* --------------------------------------------------------------------------*
||$C$L22||:    
;***	-----------------------g19:
;*** 159	-----------------------    if ( iopageregisters_write_w(addr, data) ) goto g21;
	.dwpsn	file "pru1_statemachine_dma.c",line 159,column 4,is_stmt,isa 0
        MOV       r14, r9               ; [ALU_PRU] |159| addr
        LBBO      &r15.w0, r2, 0, 2     ; [ALU_PRU] |159| data
$C$DW$117	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$117, DW_AT_low_pc(0x00)
	.dwattr $C$DW$117, DW_AT_name("iopageregisters_write_w")
	.dwattr $C$DW$117, DW_AT_TI_call

        JAL       r3.w2, ||iopageregisters_write_w|| ; [ALU_PRU] |159| iopageregisters_write_w
        QBNE      ||$C$L24||, r14.b0, 0x00 ; [ALU_PRU] |159| 
;* --------------------------------------------------------------------------*
||$C$L23||:    
;***	-----------------------g20:
;*** 183	-----------------------    *(volatile unsigned *)(C$4 = (volatile struct $$fake26 *)0x24000u) &= 0xfffffff7u;
;*** 183	-----------------------    (*(volatile struct $$fake35 *)C$4).$P$T18.CYCLE = 0u;
;*** 183	-----------------------    timeout_target = 3976u;
;*** 183	-----------------------    *(volatile unsigned *)C$4 |= 0x8u;
;*** 184	-----------------------    (*K$16).state = &sm_dma_state_21;
;*** 234	-----------------------    return 0;
	.dwpsn	file "pru1_statemachine_dma.c",line 183,column 4,is_stmt,isa 0
        LDI32     r0, 0x00024000        ; [ALU_PRU] |183| $O$C4
        LDI       r14, ||timeout_target|| ; [ALU_PRU] |183| timeout_target
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |183| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |183| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |183| 
        LDI       r1, 0x0000            ; [ALU_PRU] |183| 
        SBBO      &r1, r0, 12, 4        ; [ALU_PRU] |183| $O$C4
        LDI       r1, 0x0f88            ; [ALU_PRU] |183| 
        SBBO      &r1, r14, 0, 4        ; [ALU_PRU] |183| 
	.dwpsn	file "pru1_statemachine_dma.c",line 234,column 2,is_stmt,isa 0
        LDI       r14.b0, 0x00          ; [ALU_PRU] |234| 
	.dwpsn	file "pru1_statemachine_dma.c",line 183,column 4,is_stmt,isa 0
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |183| $O$C4
        SET       r1, r1, 0x00000003    ; [ALU_PRU] |183| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |183| $O$C4
	.dwpsn	file "pru1_statemachine_dma.c",line 184,column 4,is_stmt,isa 0
        LDI       r0.w0, $CODE(||sm_dma_state_21||) ; [ALU_PRU] |184| sm_dma_state_21
        SBBO      &r0.w0, r8, 0, 2      ; [ALU_PRU] |184| $O$K16
	.dwpsn	file "pru1_statemachine_dma.c",line 234,column 2,is_stmt,isa 0
        JMP       ||$C$L26||            ; [ALU_PRU] |234| 
;* --------------------------------------------------------------------------*
||$C$L24||:    
;***	-----------------------g21:
;*** 170	-----------------------    _tmpval = C$3 = (unsigned char)(*K$22|0x20);
;*** 170	-----------------------    buslatches_pru0_dataout((unsigned)C$3);
;*** 170	-----------------------    __R30 = 1024u;
;*** 170	-----------------------    *K$22 = _tmpval;
;*** 170	-----------------------    __delay_cycles(4u);
;*** 170	-----------------------    __R30 = 3072u;
;*** 171	-----------------------    _tmpval = C$2 = (unsigned char)(*K$22&0xef);
;*** 171	-----------------------    buslatches_pru0_dataout((unsigned)C$2);
;*** 171	-----------------------    __R30 = 1024u;
;*** 171	-----------------------    *K$22 = _tmpval;
;*** 171	-----------------------    __delay_cycles(4u);
;*** 171	-----------------------    __R30 = 3072u;
;*** 172	-----------------------    buslatches_pru0_dataout(0u);
;*** 172	-----------------------    __R30 = 1280u;
;*** 172	-----------------------    __delay_cycles(6u);
;*** 172	-----------------------    __R30 = 3328u;
;*** 173	-----------------------    buslatches_pru0_dataout(0u);
;*** 173	-----------------------    __R30 = 1536u;
;*** 173	-----------------------    __delay_cycles(6u);
;*** 173	-----------------------    __R30 = 3584u;
;***  	-----------------------    #pragma LOOP_FLAGS(4096u)
	.dwpsn	file "pru1_statemachine_dma.c",line 170,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |170| $O$K22
        SET       r6.b0, r0.b0, 0x00000005 ; [ALU_PRU] |170| $O$C3
        MOV       r14, r6.b0            ; [ALU_PRU] |170| $O$C3
$C$DW$118	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$118, DW_AT_low_pc(0x00)
	.dwattr $C$DW$118, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$118, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |170| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |170| 
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |170| $O$K22,_tmpval
        .newblock
        LDI32    r11, 1
$1:     SUB      r11, r11, 1
        QBNE     $1, r11, 0            ; [ALU_PRU] |170| 
	.dwpsn	file "pru1_statemachine_dma.c",line 171,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |171| $O$K22
	.dwpsn	file "pru1_statemachine_dma.c",line 170,column 4,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |170| 
	.dwpsn	file "pru1_statemachine_dma.c",line 171,column 4,is_stmt,isa 0
        AND       r6.b0, r0.b0, 0xef    ; [ALU_PRU] |171| $O$C2
        MOV       r14, r6.b0            ; [ALU_PRU] |171| $O$C2
$C$DW$119	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$119, DW_AT_low_pc(0x00)
	.dwattr $C$DW$119, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$119, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |171| buslatches_pru0_dataout
        SBBO      &r6.b0, r7, 0, 1      ; [ALU_PRU] |171| $O$K22,_tmpval
        LDI       r30, 0x0400           ; [ALU_PRU] |171| 
        .newblock
        LDI32    r10, 1
$1:     SUB      r10, r10, 1
        QBNE     $1, r10, 0            ; [ALU_PRU] |171| 
        MOV       r14, r5               ; [ALU_PRU] 
        LDI       r30, 0x0c00           ; [ALU_PRU] |171| 
	.dwpsn	file "pru1_statemachine_dma.c",line 172,column 4,is_stmt,isa 0
$C$DW$120	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$120, DW_AT_low_pc(0x00)
	.dwattr $C$DW$120, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$120, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |172| buslatches_pru0_dataout
        LDI       r30, 0x0500           ; [ALU_PRU] |172| 
        .newblock
        LDI32    r9, 2
$1:     SUB      r9, r9, 1
        QBNE     $1, r9, 0             ; [ALU_PRU] |172| 
        MOV       r14, r5               ; [ALU_PRU] 
        LDI       r30, 0x0d00           ; [ALU_PRU] |172| 
	.dwpsn	file "pru1_statemachine_dma.c",line 173,column 4,is_stmt,isa 0
$C$DW$121	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$121, DW_AT_low_pc(0x00)
	.dwattr $C$DW$121, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$121, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |173| buslatches_pru0_dataout
        LDI       r30, 0x0600           ; [ALU_PRU] |173| 
        .newblock
        LDI32    r5, 2
$1:     SUB      r5, r5, 1
        QBNE     $1, r5, 0             ; [ALU_PRU] |173| 
        LDI       r30, 0x0e00           ; [ALU_PRU] |173| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L25||
;*
;*   Loop source line                : 170
;*   Loop closing brace source line  : 170
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L25||:    
;***	-----------------------g22:
;*** 176	-----------------------    if ( (*K$3).events.eventmask ) goto g22;
	.dwpsn	file "pru1_statemachine_dma.c",line 176,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r4, 12, 1     ; [ALU_PRU] |176| $O$K3
        QBNE      ||$C$L25||, r0.b0, 0x00 ; [ALU_PRU] |176| 
;* --------------------------------------------------------------------------*
;*** 178	-----------------------    _tmpval = C$1 = (unsigned char)(*K$22&0xdf);
;*** 178	-----------------------    buslatches_pru0_dataout((unsigned)C$1);
;*** 178	-----------------------    __R30 = 1024u;
;*** 178	-----------------------    *K$22 = _tmpval;
;*** 178	-----------------------    __delay_cycles(4u);
;*** 178	-----------------------    __R30 = 3072u;
;*** 179	-----------------------    (*K$16).state = &sm_dma_state_99;
;*** 234	-----------------------    return 0;
	.dwpsn	file "pru1_statemachine_dma.c",line 178,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r7, 0, 1      ; [ALU_PRU] |178| $O$K22
        AND       r4.b0, r0.b0, 0xdf    ; [ALU_PRU] |178| $O$C1
        MOV       r14, r4.b0            ; [ALU_PRU] |178| $O$C1
$C$DW$122	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$122, DW_AT_low_pc(0x00)
	.dwattr $C$DW$122, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$122, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |178| buslatches_pru0_dataout
        LDI       r30, 0x0400           ; [ALU_PRU] |178| 
        SBBO      &r4.b0, r7, 0, 1      ; [ALU_PRU] |178| $O$K22,_tmpval
        .newblock
        LDI32    r5, 1
$1:     SUB      r5, r5, 1
        QBNE     $1, r5, 0             ; [ALU_PRU] |178| 
	.dwpsn	file "pru1_statemachine_dma.c",line 234,column 2,is_stmt,isa 0
        LDI       r14.b0, 0x00          ; [ALU_PRU] |234| 
	.dwpsn	file "pru1_statemachine_dma.c",line 179,column 4,is_stmt,isa 0
        LDI       r0.w0, $CODE(||sm_dma_state_99||) ; [ALU_PRU] |179| sm_dma_state_99
	.dwpsn	file "pru1_statemachine_dma.c",line 178,column 4,is_stmt,isa 0
        LDI       r30, 0x0c00           ; [ALU_PRU] |178| 
	.dwpsn	file "pru1_statemachine_dma.c",line 179,column 4,is_stmt,isa 0
        SBBO      &r0.w0, r8, 0, 2      ; [ALU_PRU] |179| $O$K16
;* --------------------------------------------------------------------------*
||$C$L26||:    
        LBBO      &r3.b2, r2, 2, 38     ; [ALU_PRU] 
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
        ADD       r2, r2, 0x28          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$123	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$123, DW_AT_low_pc(0x00)
	.dwattr $C$DW$123, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$62, DW_AT_TI_end_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$62, DW_AT_TI_end_line(0xeb)
	.dwattr $C$DW$62, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$62

	.sect	".text:sm_dma_start"
	.clink
	.global	||sm_dma_start||

$C$DW$124	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$124, DW_AT_name("sm_dma_start")
	.dwattr $C$DW$124, DW_AT_low_pc(||sm_dma_start||)
	.dwattr $C$DW$124, DW_AT_high_pc(0x00)
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("sm_dma_start")
	.dwattr $C$DW$124, DW_AT_external
	.dwattr $C$DW$124, DW_AT_TI_begin_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$124, DW_AT_TI_begin_line(0x54)
	.dwattr $C$DW$124, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$124, DW_AT_decl_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$124, DW_AT_decl_line(0x54)
	.dwattr $C$DW$124, DW_AT_decl_column(0x06)
	.dwattr $C$DW$124, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru1_statemachine_dma.c",line 84,column 21,is_stmt,address ||sm_dma_start||,isa 0

	.dwfde $C$DW$CIE, ||sm_dma_start||
;----------------------------------------------------------------------
;  84 | void sm_dma_start() {                                                  
;  85 | // assert BBSY: latch[1], bit 6                                        
;  86 | // buslatches_setbits(1, BIT(6), BIT(6));                              
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: sm_dma_start                  FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||sm_dma_start||:
;* --------------------------------------------------------------------------*
;* r0_0  assigned to $O$C1
$C$DW$125	.dwtag  DW_TAG_variable
	.dwattr $C$DW$125, DW_AT_name("$O$C1")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$125, DW_AT_location[DW_OP_reg0]

;* r1_0  assigned to $O$C2
$C$DW$126	.dwtag  DW_TAG_variable
	.dwattr $C$DW$126, DW_AT_name("$O$C2")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$126, DW_AT_location[DW_OP_reg4]

	.dwcfi	cfa_offset, 0
;*** 88	-----------------------    C$1 = &mailbox;
;*** 88	-----------------------    (*C$1).$P$T1.dma.cur_addr = (*C$1).$P$T1.dma.startaddr;
;*** 89	-----------------------    (*(C$2 = &sm_dma)).dataptr = (volatile unsigned short *)C$1+36;
;*** 90	-----------------------    (*C$2).state = &sm_dma_state_1;
;*** 91	-----------------------    (*C$2).cur_wordsleft = (*C$1).$P$T1.dma.wordcount;
;*** 92	-----------------------    (*C$1).$P$T1.dma.cur_status = 2u;
;***  	-----------------------    return;
	.dwpsn	file "pru1_statemachine_dma.c",line 88,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  88 | mailbox.dma.cur_addr = mailbox.dma.startaddr;                          
;----------------------------------------------------------------------
        LDI32     r0, ||mailbox||       ; [ALU_PRU] |88| $O$C1,mailbox
        LBBO      &r1, r0, 32, 4        ; [ALU_PRU] |88| $O$C1
        SBBO      &r1, r0, 28, 4        ; [ALU_PRU] |88| $O$C1
	.dwpsn	file "pru1_statemachine_dma.c",line 89,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  89 | sm_dma.dataptr = (uint16_t *) mailbox.dma.words; // point to start of d
;     | ata buffer                                                             
;----------------------------------------------------------------------
        LDI       r1, ||sm_dma||        ; [ALU_PRU] |89| $O$C2,sm_dma
        ADD       r14, r0, 0x24         ; [ALU_PRU] |89| $O$C1
        SBBO      &r14, r1, 3, 4        ; [ALU_PRU] |89| $O$C2
	.dwpsn	file "pru1_statemachine_dma.c",line 90,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  90 | sm_dma.state = &sm_dma_state_1;                                        
;----------------------------------------------------------------------
        LDI       r14.w0, $CODE(||sm_dma_state_1||) ; [ALU_PRU] |90| sm_dma_state_1
        SBBO      &r14.w0, r1, 0, 2     ; [ALU_PRU] |90| $O$C2
	.dwpsn	file "pru1_statemachine_dma.c",line 91,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  91 | sm_dma.cur_wordsleft = mailbox.dma.wordcount;                          
;----------------------------------------------------------------------
        LBBO      &r14.w0, r0, 26, 2    ; [ALU_PRU] |91| $O$C1
        SBBO      &r14.w0, r1, 7, 2     ; [ALU_PRU] |91| $O$C2
	.dwpsn	file "pru1_statemachine_dma.c",line 92,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
;  92 | mailbox.dma.cur_status = DMA_STATE_RUNNING;                            
;  93 | // next call to sm_dma.state() starts state machine                    
;----------------------------------------------------------------------
        LDI       r1.b0, 0x02           ; [ALU_PRU] |92| 
        SBBO      &r1.b0, r0, 24, 1     ; [ALU_PRU] |92| $O$C1
$C$DW$127	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$127, DW_AT_low_pc(0x00)
	.dwattr $C$DW$127, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$124, DW_AT_TI_end_file("pru1_statemachine_dma.c")
	.dwattr $C$DW$124, DW_AT_TI_end_line(0x5e)
	.dwattr $C$DW$124, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$124

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||mailbox||
	.global	||buslatches||
	.global	||timeout_target||
	.global	||sm_arb||
	.global	||buslatches_pru0_dataout||
	.global	||iopageregisters_write_w||
	.global	||iopageregisters_write_b||
	.global	||iopageregisters_read||
	.global	||sm_arb_state_idle||

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x40000)
$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$75)
	.dwattr $C$DW$128, DW_AT_name("$P$T0")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$128, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$128, DW_AT_decl_line(0x34)
	.dwattr $C$DW$128, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$19, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$19

$C$DW$T$20	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$20, DW_AT_name("unibus_memory_t")
	.dwattr $C$DW$T$20, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$20, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$20, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x03)


$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x40000)
$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$129, DW_AT_name("memory")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("memory")
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$129, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$129, DW_AT_decl_line(0x17)
	.dwattr $C$DW$129, DW_AT_decl_column(0x12)

	.dwattr $C$DW$T$21, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x14)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$21

$C$DW$T$32	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$32, DW_AT_name("ddrmem_t")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$32, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$T$32, DW_AT_decl_line(0x18)
	.dwattr $C$DW$T$32, DW_AT_decl_column(0x03)

$C$DW$T$33	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$32)

$C$DW$T$34	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$34, DW_AT_address_class(0x20)


$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x0c)
$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$130, DW_AT_name("eventmask")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("eventmask")
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$130, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$130, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$130, DW_AT_decl_column(0x0a)

$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$131, DW_AT_name("unibus_control")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("unibus_control")
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$131, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$131, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$131, DW_AT_decl_column(0x0a)

$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$132, DW_AT_name("device_handle")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("device_handle")
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$132, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$132, DW_AT_decl_line(0x7f)
	.dwattr $C$DW$132, DW_AT_decl_column(0x0a)

$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$133, DW_AT_name("device_register_idx")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("device_register_idx")
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$133, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$133, DW_AT_decl_line(0x81)
	.dwattr $C$DW$133, DW_AT_decl_column(0x0a)

$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$134, DW_AT_name("addr")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$134, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$134, DW_AT_decl_line(0x83)
	.dwattr $C$DW$134, DW_AT_decl_column(0x0b)

$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$135, DW_AT_name("data")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("data")
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$135, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$135, DW_AT_decl_line(0x84)
	.dwattr $C$DW$135, DW_AT_decl_column(0x0b)

$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$136, DW_AT_name("initialization_signals_prev")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("initialization_signals_prev")
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0xa]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$136, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$136, DW_AT_decl_line(0x87)
	.dwattr $C$DW$136, DW_AT_decl_column(0x0a)

$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$137, DW_AT_name("initialization_signals_cur")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("initialization_signals_cur")
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0xb]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$137, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$137, DW_AT_decl_line(0x88)
	.dwattr $C$DW$137, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$25, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x79)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$25

$C$DW$T$35	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$35, DW_AT_name("mailbox_events_t")
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$35, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$35, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x03)


$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x08)
$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$138, DW_AT_name("addr")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$138, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$138, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$138, DW_AT_decl_column(0x0b)

$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$139, DW_AT_name("val")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$139, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$139, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$139, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$26, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$26

$C$DW$T$76	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$76, DW_AT_name("mailbox_test_t")
	.dwattr $C$DW$T$76, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$76, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$76, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$76, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$76, DW_AT_decl_column(0x03)


$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x0c)
$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$140, DW_AT_name("addr")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$140, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$140, DW_AT_decl_line(0x51)
	.dwattr $C$DW$140, DW_AT_decl_column(0x0b)

$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$141, DW_AT_name("bitmask")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("bitmask")
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$141, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$141, DW_AT_decl_line(0x52)
	.dwattr $C$DW$141, DW_AT_decl_column(0x0b)

$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$142, DW_AT_name("val")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$142, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$142, DW_AT_decl_line(0x53)
	.dwattr $C$DW$142, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$27, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0x50)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$27

$C$DW$T$77	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$77, DW_AT_name("mailbox_buslatch_t")
	.dwattr $C$DW$T$77, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$77, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$77, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$77, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$77, DW_AT_decl_column(0x03)


$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x04)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$143, DW_AT_name("addr_0_7")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("addr_0_7")
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$143, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$143, DW_AT_decl_line(0x57)
	.dwattr $C$DW$143, DW_AT_decl_column(0x0a)

$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$144, DW_AT_name("addr_8_15")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("addr_8_15")
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$144, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$144, DW_AT_decl_line(0x58)
	.dwattr $C$DW$144, DW_AT_decl_column(0x0a)

$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$145, DW_AT_name("data_0_7")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("data_0_7")
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$145, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$145, DW_AT_decl_line(0x59)
	.dwattr $C$DW$145, DW_AT_decl_column(0x0a)

$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$146, DW_AT_name("data_8_15")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("data_8_15")
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$146, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$146, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$146, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$28, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$28

$C$DW$T$78	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$78, DW_AT_name("mailbox_buslatch_test_t")
	.dwattr $C$DW$T$78, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$T$78, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$78, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$78, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$T$78, DW_AT_decl_column(0x03)


$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x40c)
$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$147, DW_AT_name("cur_status")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("cur_status")
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$147, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$147, DW_AT_decl_line(0x61)
	.dwattr $C$DW$147, DW_AT_decl_column(0x0a)

$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$148, DW_AT_name("control")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("control")
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$148, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$148, DW_AT_decl_line(0x62)
	.dwattr $C$DW$148, DW_AT_decl_column(0x0a)

$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$149, DW_AT_name("wordcount")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("wordcount")
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$149, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$149, DW_AT_decl_line(0x63)
	.dwattr $C$DW$149, DW_AT_decl_column(0x0b)

$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$150, DW_AT_name("cur_addr")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("cur_addr")
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$150, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$150, DW_AT_decl_line(0x64)
	.dwattr $C$DW$150, DW_AT_decl_column(0x0b)

$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$151, DW_AT_name("startaddr")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("startaddr")
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$151, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$151, DW_AT_decl_line(0x65)
	.dwattr $C$DW$151, DW_AT_decl_column(0x0b)

$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$152, DW_AT_name("words")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("words")
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$152, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$152, DW_AT_decl_line(0x66)
	.dwattr $C$DW$152, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$30, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$30

$C$DW$T$79	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$79, DW_AT_name("mailbox_dma_t")
	.dwattr $C$DW$T$79, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$79, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$79, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$79, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$79, DW_AT_decl_column(0x03)


$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x03)
$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$153, DW_AT_name("vector")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("vector")
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$153, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$153, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$153, DW_AT_decl_column(0x0b)

$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$154, DW_AT_name("priority_bit")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("priority_bit")
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$154, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$154, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$154, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$31, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$31

$C$DW$T$80	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$80, DW_AT_name("mailbox_intr_t")
	.dwattr $C$DW$T$80, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$T$80, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$80, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$80, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$T$80, DW_AT_decl_column(0x03)


$C$DW$T$36	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$36, DW_AT_byte_size(0x424)
$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$155, DW_AT_name("arm2pru_req")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("arm2pru_req")
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$155, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$155, DW_AT_decl_line(0x90)
	.dwattr $C$DW$155, DW_AT_decl_column(0x0b)

$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$156, DW_AT_name("arm2pru_resp")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("arm2pru_resp")
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$156, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$156, DW_AT_decl_line(0x91)
	.dwattr $C$DW$156, DW_AT_decl_column(0x0b)

$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$157, DW_AT_name("ddrmem_base_physical")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("ddrmem_base_physical")
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$157, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$157, DW_AT_decl_line(0x94)
	.dwattr $C$DW$157, DW_AT_decl_column(0x15)

$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$158, DW_AT_name("events")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("events")
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$158, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$158, DW_AT_decl_line(0x97)
	.dwattr $C$DW$158, DW_AT_decl_column(0x13)

$C$DW$159	.dwtag  DW_TAG_member
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$81)
	.dwattr $C$DW$159, DW_AT_name("$P$T1")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$159, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$159, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$159, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$159, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$36, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$36, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$T$36, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$36

$C$DW$T$129	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$129, DW_AT_type(*$C$DW$T$36)

$C$DW$T$130	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$130, DW_AT_type(*$C$DW$T$129)
	.dwattr $C$DW$T$130, DW_AT_address_class(0x20)

$C$DW$T$131	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$131, DW_AT_name("mailbox_t")
	.dwattr $C$DW$T$131, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$T$131, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$131, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$131, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$T$131, DW_AT_decl_column(0x03)

$C$DW$T$132	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$132, DW_AT_type(*$C$DW$T$131)


$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x10)
$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$160, DW_AT_name("cur_reg_val")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("cur_reg_val")
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$160, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$160, DW_AT_decl_line(0x22)
	.dwattr $C$DW$160, DW_AT_decl_column(0x0a)

$C$DW$161	.dwtag  DW_TAG_member
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$161, DW_AT_name("bidi_bitwidth")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("bidi_bitwidth")
	.dwattr $C$DW$161, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$161, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$161, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$161, DW_AT_decl_line(0x26)
	.dwattr $C$DW$161, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$38, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$T$38, DW_AT_decl_line(0x21)
	.dwattr $C$DW$T$38, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$38

$C$DW$T$134	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$134, DW_AT_name("buslatches_t")
	.dwattr $C$DW$T$134, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$134, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$134, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$T$134, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$134, DW_AT_decl_column(0x03)


$C$DW$T$39	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$39, DW_AT_byte_size(0x04)
$C$DW$162	.dwtag  DW_TAG_member
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$162, DW_AT_name("REVID")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$162, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$162, DW_AT_bit_size(0x20)
	.dwattr $C$DW$162, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$162, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$162, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$162, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$162, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$39, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$39

$C$DW$T$83	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$83, DW_AT_type(*$C$DW$T$39)


$C$DW$T$40	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x04)
$C$DW$163	.dwtag  DW_TAG_member
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$163, DW_AT_name("IDLE_MODE")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("IDLE_MODE")
	.dwattr $C$DW$163, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$163, DW_AT_bit_size(0x02)
	.dwattr $C$DW$163, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$163, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$163, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$163, DW_AT_decl_line(0x37)
	.dwattr $C$DW$163, DW_AT_decl_column(0x0d)

$C$DW$164	.dwtag  DW_TAG_member
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$164, DW_AT_name("STANDBY_MODE")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("STANDBY_MODE")
	.dwattr $C$DW$164, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$164, DW_AT_bit_size(0x02)
	.dwattr $C$DW$164, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$164, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$164, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$164, DW_AT_decl_line(0x38)
	.dwattr $C$DW$164, DW_AT_decl_column(0x0d)

$C$DW$165	.dwtag  DW_TAG_member
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$165, DW_AT_name("STANDBY_INIT")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("STANDBY_INIT")
	.dwattr $C$DW$165, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$165, DW_AT_bit_size(0x01)
	.dwattr $C$DW$165, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$165, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$165, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$165, DW_AT_decl_line(0x39)
	.dwattr $C$DW$165, DW_AT_decl_column(0x0d)

$C$DW$166	.dwtag  DW_TAG_member
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$166, DW_AT_name("SUB_MWAIT")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("SUB_MWAIT")
	.dwattr $C$DW$166, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$166, DW_AT_bit_size(0x01)
	.dwattr $C$DW$166, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$166, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$166, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$166, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$166, DW_AT_decl_column(0x0d)

$C$DW$167	.dwtag  DW_TAG_member
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$167, DW_AT_name("rsvd6")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("rsvd6")
	.dwattr $C$DW$167, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$167, DW_AT_bit_size(0x1a)
	.dwattr $C$DW$167, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$167, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$167, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$167, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$167, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$40, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$40, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$40, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$40

$C$DW$T$85	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$85, DW_AT_type(*$C$DW$T$40)


$C$DW$T$41	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x04)
$C$DW$168	.dwtag  DW_TAG_member
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$168, DW_AT_name("PRU0_GPI_MODE")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("PRU0_GPI_MODE")
	.dwattr $C$DW$168, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$168, DW_AT_bit_size(0x02)
	.dwattr $C$DW$168, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$168, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$168, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$168, DW_AT_decl_line(0x45)
	.dwattr $C$DW$168, DW_AT_decl_column(0x0d)

$C$DW$169	.dwtag  DW_TAG_member
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$169, DW_AT_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$169, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$169, DW_AT_bit_size(0x01)
	.dwattr $C$DW$169, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$169, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$169, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$169, DW_AT_decl_line(0x46)
	.dwattr $C$DW$169, DW_AT_decl_column(0x0d)

$C$DW$170	.dwtag  DW_TAG_member
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$170, DW_AT_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$170, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$170, DW_AT_bit_size(0x05)
	.dwattr $C$DW$170, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$170, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$170, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$170, DW_AT_decl_line(0x47)
	.dwattr $C$DW$170, DW_AT_decl_column(0x0d)

$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$171, DW_AT_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$171, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$171, DW_AT_bit_size(0x05)
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$171, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$171, DW_AT_decl_line(0x48)
	.dwattr $C$DW$171, DW_AT_decl_column(0x0d)

$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$172, DW_AT_name("PRU0_GPI_SB")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("PRU0_GPI_SB")
	.dwattr $C$DW$172, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$172, DW_AT_bit_size(0x01)
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$172, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$172, DW_AT_decl_line(0x49)
	.dwattr $C$DW$172, DW_AT_decl_column(0x0d)

$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$173, DW_AT_name("PRU0_GPO_MODE")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("PRU0_GPO_MODE")
	.dwattr $C$DW$173, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$173, DW_AT_bit_size(0x01)
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$173, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$173, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$173, DW_AT_decl_column(0x0d)

$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$174, DW_AT_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$174, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$174, DW_AT_bit_size(0x05)
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$174, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$174, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$174, DW_AT_decl_column(0x0d)

$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$175, DW_AT_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$175, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$175, DW_AT_bit_size(0x05)
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$175, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$175, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$175, DW_AT_decl_column(0x0d)

$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$176, DW_AT_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$176, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$176, DW_AT_bit_size(0x01)
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$176, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$176, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$176, DW_AT_decl_column(0x0d)

$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$177, DW_AT_name("rsvd26")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$177, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$177, DW_AT_bit_size(0x06)
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$177, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$177, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$177, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$41, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$41

$C$DW$T$87	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$87, DW_AT_type(*$C$DW$T$41)


$C$DW$T$42	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$42, DW_AT_byte_size(0x04)
$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$178, DW_AT_name("PRU1_GPI_MODE")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("PRU1_GPI_MODE")
	.dwattr $C$DW$178, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$178, DW_AT_bit_size(0x02)
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$178, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$178, DW_AT_decl_line(0x58)
	.dwattr $C$DW$178, DW_AT_decl_column(0x0d)

$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$179, DW_AT_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$179, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$179, DW_AT_bit_size(0x01)
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$179, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$179, DW_AT_decl_line(0x59)
	.dwattr $C$DW$179, DW_AT_decl_column(0x0d)

$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$180, DW_AT_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$180, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$180, DW_AT_bit_size(0x05)
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$180, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$180, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$180, DW_AT_decl_column(0x0d)

$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$181, DW_AT_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$181, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$181, DW_AT_bit_size(0x05)
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$181, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$181, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$181, DW_AT_decl_column(0x0d)

$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$182, DW_AT_name("PRU1_GPI_SB")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("PRU1_GPI_SB")
	.dwattr $C$DW$182, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$182, DW_AT_bit_size(0x01)
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$182, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$182, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$182, DW_AT_decl_column(0x0d)

$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$183, DW_AT_name("PRU1_GPO_MODE")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("PRU1_GPO_MODE")
	.dwattr $C$DW$183, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$183, DW_AT_bit_size(0x01)
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$183, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$183, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$183, DW_AT_decl_column(0x0d)

$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$184, DW_AT_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$184, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$184, DW_AT_bit_size(0x05)
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$184, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$184, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$184, DW_AT_decl_column(0x0d)

$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$185, DW_AT_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$185, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$185, DW_AT_bit_size(0x05)
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$185, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$185, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$185, DW_AT_decl_column(0x0d)

$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$186, DW_AT_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$186, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$186, DW_AT_bit_size(0x01)
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$186, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$186, DW_AT_decl_line(0x60)
	.dwattr $C$DW$186, DW_AT_decl_column(0x0d)

$C$DW$187	.dwtag  DW_TAG_member
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$187, DW_AT_name("rsvd26")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$187, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$187, DW_AT_bit_size(0x06)
	.dwattr $C$DW$187, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$187, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$187, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$187, DW_AT_decl_line(0x61)
	.dwattr $C$DW$187, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$42, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$42

$C$DW$T$89	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$89, DW_AT_type(*$C$DW$T$42)


$C$DW$T$43	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$43, DW_AT_byte_size(0x04)
$C$DW$188	.dwtag  DW_TAG_member
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$188, DW_AT_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$188, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$188, DW_AT_bit_size(0x01)
	.dwattr $C$DW$188, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$188, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$188, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$188, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$188, DW_AT_decl_column(0x0d)

$C$DW$189	.dwtag  DW_TAG_member
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$189, DW_AT_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$189, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$189, DW_AT_bit_size(0x01)
	.dwattr $C$DW$189, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$189, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$189, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$189, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$189, DW_AT_decl_column(0x0d)

$C$DW$190	.dwtag  DW_TAG_member
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$190, DW_AT_name("PRU0_CLK_EN")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("PRU0_CLK_EN")
	.dwattr $C$DW$190, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$190, DW_AT_bit_size(0x01)
	.dwattr $C$DW$190, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$190, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$190, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$190, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$190, DW_AT_decl_column(0x0d)

$C$DW$191	.dwtag  DW_TAG_member
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$191, DW_AT_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$191, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$191, DW_AT_bit_size(0x01)
	.dwattr $C$DW$191, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$191, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$191, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$191, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$191, DW_AT_decl_column(0x0d)

$C$DW$192	.dwtag  DW_TAG_member
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$192, DW_AT_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$192, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$192, DW_AT_bit_size(0x01)
	.dwattr $C$DW$192, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$192, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$192, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$192, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$192, DW_AT_decl_column(0x0d)

$C$DW$193	.dwtag  DW_TAG_member
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$193, DW_AT_name("PRU1_CLK_EN")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("PRU1_CLK_EN")
	.dwattr $C$DW$193, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$193, DW_AT_bit_size(0x01)
	.dwattr $C$DW$193, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$193, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$193, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$193, DW_AT_decl_line(0x70)
	.dwattr $C$DW$193, DW_AT_decl_column(0x0d)

$C$DW$194	.dwtag  DW_TAG_member
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$194, DW_AT_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$194, DW_AT_bit_offset(0x19)
	.dwattr $C$DW$194, DW_AT_bit_size(0x01)
	.dwattr $C$DW$194, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$194, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$194, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$194, DW_AT_decl_line(0x71)
	.dwattr $C$DW$194, DW_AT_decl_column(0x0d)

$C$DW$195	.dwtag  DW_TAG_member
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$195, DW_AT_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$195, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$195, DW_AT_bit_size(0x01)
	.dwattr $C$DW$195, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$195, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$195, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$195, DW_AT_decl_line(0x72)
	.dwattr $C$DW$195, DW_AT_decl_column(0x0d)

$C$DW$196	.dwtag  DW_TAG_member
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$196, DW_AT_name("INTC_CLK_EN")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("INTC_CLK_EN")
	.dwattr $C$DW$196, DW_AT_bit_offset(0x17)
	.dwattr $C$DW$196, DW_AT_bit_size(0x01)
	.dwattr $C$DW$196, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$196, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$196, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$196, DW_AT_decl_line(0x73)
	.dwattr $C$DW$196, DW_AT_decl_column(0x0d)

$C$DW$197	.dwtag  DW_TAG_member
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$197, DW_AT_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$197, DW_AT_bit_offset(0x16)
	.dwattr $C$DW$197, DW_AT_bit_size(0x01)
	.dwattr $C$DW$197, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$197, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$197, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$197, DW_AT_decl_line(0x74)
	.dwattr $C$DW$197, DW_AT_decl_column(0x0d)

$C$DW$198	.dwtag  DW_TAG_member
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$198, DW_AT_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$198, DW_AT_bit_offset(0x15)
	.dwattr $C$DW$198, DW_AT_bit_size(0x01)
	.dwattr $C$DW$198, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$198, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$198, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$198, DW_AT_decl_line(0x75)
	.dwattr $C$DW$198, DW_AT_decl_column(0x0d)

$C$DW$199	.dwtag  DW_TAG_member
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$199, DW_AT_name("UART_CLK_EN")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("UART_CLK_EN")
	.dwattr $C$DW$199, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$199, DW_AT_bit_size(0x01)
	.dwattr $C$DW$199, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$199, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$199, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$199, DW_AT_decl_line(0x76)
	.dwattr $C$DW$199, DW_AT_decl_column(0x0d)

$C$DW$200	.dwtag  DW_TAG_member
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$200, DW_AT_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$200, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$200, DW_AT_bit_size(0x01)
	.dwattr $C$DW$200, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$200, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$200, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$200, DW_AT_decl_line(0x77)
	.dwattr $C$DW$200, DW_AT_decl_column(0x0d)

$C$DW$201	.dwtag  DW_TAG_member
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$201, DW_AT_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$201, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$201, DW_AT_bit_size(0x01)
	.dwattr $C$DW$201, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$201, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$201, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$201, DW_AT_decl_line(0x78)
	.dwattr $C$DW$201, DW_AT_decl_column(0x0d)

$C$DW$202	.dwtag  DW_TAG_member
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$202, DW_AT_name("ECAP_CLK_EN")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("ECAP_CLK_EN")
	.dwattr $C$DW$202, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$202, DW_AT_bit_size(0x01)
	.dwattr $C$DW$202, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$202, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$202, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$202, DW_AT_decl_line(0x79)
	.dwattr $C$DW$202, DW_AT_decl_column(0x0d)

$C$DW$203	.dwtag  DW_TAG_member
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$203, DW_AT_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$203, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$203, DW_AT_bit_size(0x01)
	.dwattr $C$DW$203, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$203, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$203, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$203, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$203, DW_AT_decl_column(0x0d)

$C$DW$204	.dwtag  DW_TAG_member
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$204, DW_AT_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$204, DW_AT_bit_offset(0x0f)
	.dwattr $C$DW$204, DW_AT_bit_size(0x01)
	.dwattr $C$DW$204, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$204, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$204, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$204, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$204, DW_AT_decl_column(0x0d)

$C$DW$205	.dwtag  DW_TAG_member
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$205, DW_AT_name("IEP_CLK_EN")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("IEP_CLK_EN")
	.dwattr $C$DW$205, DW_AT_bit_offset(0x0e)
	.dwattr $C$DW$205, DW_AT_bit_size(0x01)
	.dwattr $C$DW$205, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$205, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$205, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$205, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$205, DW_AT_decl_column(0x0d)

$C$DW$206	.dwtag  DW_TAG_member
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$206, DW_AT_name("rsvd18")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("rsvd18")
	.dwattr $C$DW$206, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$206, DW_AT_bit_size(0x0e)
	.dwattr $C$DW$206, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$206, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$206, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$206, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$206, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$43, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$43

$C$DW$T$91	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$91, DW_AT_type(*$C$DW$T$43)


$C$DW$T$44	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x04)
$C$DW$207	.dwtag  DW_TAG_member
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$207, DW_AT_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$207, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$207, DW_AT_bit_size(0x04)
	.dwattr $C$DW$207, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$207, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$207, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$207, DW_AT_decl_line(0x87)
	.dwattr $C$DW$207, DW_AT_decl_column(0x0d)

$C$DW$208	.dwtag  DW_TAG_member
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$208, DW_AT_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$208, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$208, DW_AT_bit_size(0x04)
	.dwattr $C$DW$208, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$208, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$208, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$208, DW_AT_decl_line(0x88)
	.dwattr $C$DW$208, DW_AT_decl_column(0x0d)

$C$DW$209	.dwtag  DW_TAG_member
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$209, DW_AT_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$209, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$209, DW_AT_bit_size(0x04)
	.dwattr $C$DW$209, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$209, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$209, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$209, DW_AT_decl_line(0x89)
	.dwattr $C$DW$209, DW_AT_decl_column(0x0d)

$C$DW$210	.dwtag  DW_TAG_member
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$210, DW_AT_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$210, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$210, DW_AT_bit_size(0x04)
	.dwattr $C$DW$210, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$210, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$210, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$210, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$210, DW_AT_decl_column(0x0d)

$C$DW$211	.dwtag  DW_TAG_member
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$211, DW_AT_name("RAM_PE_RAW")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("RAM_PE_RAW")
	.dwattr $C$DW$211, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$211, DW_AT_bit_size(0x04)
	.dwattr $C$DW$211, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$211, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$211, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$211, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$211, DW_AT_decl_column(0x0d)

$C$DW$212	.dwtag  DW_TAG_member
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$212, DW_AT_name("rsvd20")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$212, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$212, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$212, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$212, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$212, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$212, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$212, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$44, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x86)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$44

$C$DW$T$93	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$93, DW_AT_type(*$C$DW$T$44)


$C$DW$T$45	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$45, DW_AT_byte_size(0x04)
$C$DW$213	.dwtag  DW_TAG_member
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$213, DW_AT_name("PRU0_IMEM_PE")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("PRU0_IMEM_PE")
	.dwattr $C$DW$213, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$213, DW_AT_bit_size(0x04)
	.dwattr $C$DW$213, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$213, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$213, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$213, DW_AT_decl_line(0x96)
	.dwattr $C$DW$213, DW_AT_decl_column(0x0d)

$C$DW$214	.dwtag  DW_TAG_member
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$214, DW_AT_name("PRU0_DMEM_PE")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("PRU0_DMEM_PE")
	.dwattr $C$DW$214, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$214, DW_AT_bit_size(0x04)
	.dwattr $C$DW$214, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$214, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$214, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$214, DW_AT_decl_line(0x97)
	.dwattr $C$DW$214, DW_AT_decl_column(0x0d)

$C$DW$215	.dwtag  DW_TAG_member
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$215, DW_AT_name("PRU1_IMEM_PE")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("PRU1_IMEM_PE")
	.dwattr $C$DW$215, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$215, DW_AT_bit_size(0x04)
	.dwattr $C$DW$215, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$215, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$215, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$215, DW_AT_decl_line(0x98)
	.dwattr $C$DW$215, DW_AT_decl_column(0x0d)

$C$DW$216	.dwtag  DW_TAG_member
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$216, DW_AT_name("PRU1_DMEM_PE")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("PRU1_DMEM_PE")
	.dwattr $C$DW$216, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$216, DW_AT_bit_size(0x04)
	.dwattr $C$DW$216, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$216, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$216, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$216, DW_AT_decl_line(0x99)
	.dwattr $C$DW$216, DW_AT_decl_column(0x0d)

$C$DW$217	.dwtag  DW_TAG_member
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$217, DW_AT_name("RAM_PE")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("RAM_PE")
	.dwattr $C$DW$217, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$217, DW_AT_bit_size(0x04)
	.dwattr $C$DW$217, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$217, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$217, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$217, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$217, DW_AT_decl_column(0x0d)

$C$DW$218	.dwtag  DW_TAG_member
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$218, DW_AT_name("rsvd20")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$218, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$218, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$218, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$218, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$218, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$218, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$218, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$45, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$45, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$45, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$45

$C$DW$T$95	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$95, DW_AT_type(*$C$DW$T$45)


$C$DW$T$46	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x04)
$C$DW$219	.dwtag  DW_TAG_member
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$219, DW_AT_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$219, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$219, DW_AT_bit_size(0x04)
	.dwattr $C$DW$219, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$219, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$219, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$219, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$219, DW_AT_decl_column(0x0d)

$C$DW$220	.dwtag  DW_TAG_member
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$220, DW_AT_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$220, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$220, DW_AT_bit_size(0x04)
	.dwattr $C$DW$220, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$220, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$220, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$220, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$220, DW_AT_decl_column(0x0d)

$C$DW$221	.dwtag  DW_TAG_member
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$221, DW_AT_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$221, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$221, DW_AT_bit_size(0x04)
	.dwattr $C$DW$221, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$221, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$221, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$221, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$221, DW_AT_decl_column(0x0d)

$C$DW$222	.dwtag  DW_TAG_member
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$222, DW_AT_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$222, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$222, DW_AT_bit_size(0x04)
	.dwattr $C$DW$222, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$222, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$222, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$222, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$222, DW_AT_decl_column(0x0d)

$C$DW$223	.dwtag  DW_TAG_member
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$223, DW_AT_name("RAM_PE_SET")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("RAM_PE_SET")
	.dwattr $C$DW$223, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$223, DW_AT_bit_size(0x04)
	.dwattr $C$DW$223, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$223, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$223, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$223, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$223, DW_AT_decl_column(0x0d)

$C$DW$224	.dwtag  DW_TAG_member
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$224, DW_AT_name("rsvd20")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$224, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$224, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$224, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$224, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$224, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$224, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$224, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$46, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$46, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$46, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$46

$C$DW$T$97	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$97, DW_AT_type(*$C$DW$T$46)


$C$DW$T$47	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x04)
$C$DW$225	.dwtag  DW_TAG_member
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$225, DW_AT_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$225, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$225, DW_AT_bit_size(0x04)
	.dwattr $C$DW$225, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$225, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$225, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$225, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$225, DW_AT_decl_column(0x0d)

$C$DW$226	.dwtag  DW_TAG_member
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$226, DW_AT_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$226, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$226, DW_AT_bit_size(0x04)
	.dwattr $C$DW$226, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$226, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$226, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$226, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$226, DW_AT_decl_column(0x0d)

$C$DW$227	.dwtag  DW_TAG_member
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$227, DW_AT_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$227, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$227, DW_AT_bit_size(0x04)
	.dwattr $C$DW$227, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$227, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$227, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$227, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$227, DW_AT_decl_column(0x0d)

$C$DW$228	.dwtag  DW_TAG_member
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$228, DW_AT_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$228, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$228, DW_AT_bit_size(0x04)
	.dwattr $C$DW$228, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$228, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$228, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$228, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$228, DW_AT_decl_column(0x0d)

$C$DW$229	.dwtag  DW_TAG_member
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$229, DW_AT_name("rsvd16")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$229, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$229, DW_AT_bit_size(0x10)
	.dwattr $C$DW$229, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$229, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$229, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$229, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$229, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$47, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$47

$C$DW$T$99	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$99, DW_AT_type(*$C$DW$T$47)


$C$DW$T$48	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$48, DW_AT_byte_size(0x04)
$C$DW$230	.dwtag  DW_TAG_member
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$230, DW_AT_name("PMAO_PRU0")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("PMAO_PRU0")
	.dwattr $C$DW$230, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$230, DW_AT_bit_size(0x01)
	.dwattr $C$DW$230, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$230, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$230, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$230, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$230, DW_AT_decl_column(0x0d)

$C$DW$231	.dwtag  DW_TAG_member
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$231, DW_AT_name("PMAO_PRU1")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("PMAO_PRU1")
	.dwattr $C$DW$231, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$231, DW_AT_bit_size(0x01)
	.dwattr $C$DW$231, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$231, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$231, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$231, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$231, DW_AT_decl_column(0x0d)

$C$DW$232	.dwtag  DW_TAG_member
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$232, DW_AT_name("rsvd2")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$232, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$232, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$232, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$232, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$232, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$232, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$232, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$48, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$48, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$T$48, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$48

$C$DW$T$101	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$101, DW_AT_type(*$C$DW$T$48)


$C$DW$T$49	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x04)
$C$DW$233	.dwtag  DW_TAG_member
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$233, DW_AT_name("OCP_EN")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("OCP_EN")
	.dwattr $C$DW$233, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$233, DW_AT_bit_size(0x01)
	.dwattr $C$DW$233, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$233, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$233, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$233, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$233, DW_AT_decl_column(0x0d)

$C$DW$234	.dwtag  DW_TAG_member
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$234, DW_AT_name("rsvd1")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$234, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$234, DW_AT_bit_size(0x1f)
	.dwattr $C$DW$234, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$234, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$234, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$234, DW_AT_decl_line(0xd4)
	.dwattr $C$DW$234, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$49, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$49, DW_AT_decl_line(0xd2)
	.dwattr $C$DW$T$49, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$49

$C$DW$T$103	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$103, DW_AT_type(*$C$DW$T$49)


$C$DW$T$50	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$50, DW_AT_byte_size(0x04)
$C$DW$235	.dwtag  DW_TAG_member
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$235, DW_AT_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$235, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$235, DW_AT_bit_size(0x01)
	.dwattr $C$DW$235, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$235, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$235, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$235, DW_AT_decl_line(0xde)
	.dwattr $C$DW$235, DW_AT_decl_column(0x0d)

$C$DW$236	.dwtag  DW_TAG_member
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$236, DW_AT_name("XFR_SHIFT_EN")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("XFR_SHIFT_EN")
	.dwattr $C$DW$236, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$236, DW_AT_bit_size(0x01)
	.dwattr $C$DW$236, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$236, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$236, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$236, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$236, DW_AT_decl_column(0x0d)

$C$DW$237	.dwtag  DW_TAG_member
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$237, DW_AT_name("rsvd2")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$237, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$237, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$237, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$237, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$237, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$237, DW_AT_decl_line(0xe0)
	.dwattr $C$DW$237, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$50, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$50, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$T$50, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$50

$C$DW$T$105	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$105, DW_AT_type(*$C$DW$T$50)


$C$DW$T$51	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$51, DW_AT_byte_size(0x04)
$C$DW$238	.dwtag  DW_TAG_member
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$238, DW_AT_name("PIN_MUX_SEL")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("PIN_MUX_SEL")
	.dwattr $C$DW$238, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$238, DW_AT_bit_size(0x08)
	.dwattr $C$DW$238, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$238, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$238, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$238, DW_AT_decl_line(0xec)
	.dwattr $C$DW$238, DW_AT_decl_column(0x0d)

$C$DW$239	.dwtag  DW_TAG_member
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$239, DW_AT_name("rsvd2")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$239, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$239, DW_AT_bit_size(0x18)
	.dwattr $C$DW$239, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$239, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$239, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$239, DW_AT_decl_line(0xed)
	.dwattr $C$DW$239, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$51, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$51, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$T$51, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$51

$C$DW$T$107	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$107, DW_AT_type(*$C$DW$T$51)


$C$DW$T$54	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x44)
$C$DW$240	.dwtag  DW_TAG_member
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$240, DW_AT_name("$P$T2")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$240, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$240, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$240, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$240, DW_AT_decl_line(0x29)
	.dwattr $C$DW$240, DW_AT_decl_column(0x02)

$C$DW$241	.dwtag  DW_TAG_member
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$241, DW_AT_name("$P$T3")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$241, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$241, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$241, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$241, DW_AT_decl_line(0x33)
	.dwattr $C$DW$241, DW_AT_decl_column(0x02)

$C$DW$242	.dwtag  DW_TAG_member
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$242, DW_AT_name("$P$T4")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$242, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$242, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$242, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$242, DW_AT_decl_line(0x41)
	.dwattr $C$DW$242, DW_AT_decl_column(0x02)

$C$DW$243	.dwtag  DW_TAG_member
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$90)
	.dwattr $C$DW$243, DW_AT_name("$P$T5")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$243, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$243, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$243, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$243, DW_AT_decl_line(0x54)
	.dwattr $C$DW$243, DW_AT_decl_column(0x02)

$C$DW$244	.dwtag  DW_TAG_member
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$92)
	.dwattr $C$DW$244, DW_AT_name("$P$T6")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$244, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$244, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$244, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$244, DW_AT_decl_line(0x67)
	.dwattr $C$DW$244, DW_AT_decl_column(0x02)

$C$DW$245	.dwtag  DW_TAG_member
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$94)
	.dwattr $C$DW$245, DW_AT_name("$P$T7")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$245, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$245, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$245, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$245, DW_AT_decl_line(0x83)
	.dwattr $C$DW$245, DW_AT_decl_column(0x02)

$C$DW$246	.dwtag  DW_TAG_member
	.dwattr $C$DW$246, DW_AT_type(*$C$DW$T$96)
	.dwattr $C$DW$246, DW_AT_name("$P$T8")
	.dwattr $C$DW$246, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$246, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$246, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$246, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$246, DW_AT_decl_line(0x92)
	.dwattr $C$DW$246, DW_AT_decl_column(0x02)

$C$DW$247	.dwtag  DW_TAG_member
	.dwattr $C$DW$247, DW_AT_type(*$C$DW$T$98)
	.dwattr $C$DW$247, DW_AT_name("$P$T9")
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("$P$T9")
	.dwattr $C$DW$247, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$247, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$247, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$247, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$247, DW_AT_decl_column(0x02)

$C$DW$248	.dwtag  DW_TAG_member
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$100)
	.dwattr $C$DW$248, DW_AT_name("$P$T10")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("$P$T10")
	.dwattr $C$DW$248, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$248, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$248, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$248, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$248, DW_AT_decl_column(0x02)

$C$DW$249	.dwtag  DW_TAG_member
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$249, DW_AT_name("rsvd24")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$249, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$249, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$249, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$249, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$249, DW_AT_decl_column(0x0b)

$C$DW$250	.dwtag  DW_TAG_member
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$102)
	.dwattr $C$DW$250, DW_AT_name("$P$T11")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("$P$T11")
	.dwattr $C$DW$250, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$250, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$250, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$250, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$250, DW_AT_decl_column(0x02)

$C$DW$251	.dwtag  DW_TAG_member
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$251, DW_AT_name("rsvd2c")
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("rsvd2c")
	.dwattr $C$DW$251, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$251, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$251, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$251, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$251, DW_AT_decl_column(0x0b)

$C$DW$252	.dwtag  DW_TAG_member
	.dwattr $C$DW$252, DW_AT_type(*$C$DW$T$104)
	.dwattr $C$DW$252, DW_AT_name("$P$T12")
	.dwattr $C$DW$252, DW_AT_TI_symbol_name("$P$T12")
	.dwattr $C$DW$252, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$252, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$252, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$252, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$252, DW_AT_decl_column(0x02)

$C$DW$253	.dwtag  DW_TAG_member
	.dwattr $C$DW$253, DW_AT_type(*$C$DW$T$106)
	.dwattr $C$DW$253, DW_AT_name("$P$T13")
	.dwattr $C$DW$253, DW_AT_TI_symbol_name("$P$T13")
	.dwattr $C$DW$253, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$253, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$253, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$253, DW_AT_decl_line(0xda)
	.dwattr $C$DW$253, DW_AT_decl_column(0x02)

$C$DW$254	.dwtag  DW_TAG_member
	.dwattr $C$DW$254, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$254, DW_AT_name("rsvd38")
	.dwattr $C$DW$254, DW_AT_TI_symbol_name("rsvd38")
	.dwattr $C$DW$254, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$254, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$254, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$254, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$254, DW_AT_decl_column(0x0b)

$C$DW$255	.dwtag  DW_TAG_member
	.dwattr $C$DW$255, DW_AT_type(*$C$DW$T$108)
	.dwattr $C$DW$255, DW_AT_name("$P$T14")
	.dwattr $C$DW$255, DW_AT_TI_symbol_name("$P$T14")
	.dwattr $C$DW$255, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$255, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$255, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$255, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$255, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$54, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$54, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$54, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$54

$C$DW$T$135	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$135, DW_AT_name("pruCfg")
	.dwattr $C$DW$T$135, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$T$135, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$135, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$135, DW_AT_decl_line(0xf0)
	.dwattr $C$DW$T$135, DW_AT_decl_column(0x03)

$C$DW$T$136	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$136, DW_AT_type(*$C$DW$T$135)


$C$DW$T$58	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x03)
$C$DW$256	.dwtag  DW_TAG_member
	.dwattr $C$DW$256, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$256, DW_AT_name("state")
	.dwattr $C$DW$256, DW_AT_TI_symbol_name("state")
	.dwattr $C$DW$256, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$256, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$256, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$256, DW_AT_decl_line(0x22)
	.dwattr $C$DW$256, DW_AT_decl_column(0x18)

$C$DW$257	.dwtag  DW_TAG_member
	.dwattr $C$DW$257, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$257, DW_AT_name("priority_bit")
	.dwattr $C$DW$257, DW_AT_TI_symbol_name("priority_bit")
	.dwattr $C$DW$257, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$257, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$257, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$257, DW_AT_decl_line(0x23)
	.dwattr $C$DW$257, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$58, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x21)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$58

$C$DW$T$137	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$137, DW_AT_name("statemachine_arbitration_t")
	.dwattr $C$DW$T$137, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$137, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$137, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$T$137, DW_AT_decl_line(0x25)
	.dwattr $C$DW$T$137, DW_AT_decl_column(0x03)


$C$DW$T$61	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$61, DW_AT_byte_size(0x09)
$C$DW$258	.dwtag  DW_TAG_member
	.dwattr $C$DW$258, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$258, DW_AT_name("state")
	.dwattr $C$DW$258, DW_AT_TI_symbol_name("state")
	.dwattr $C$DW$258, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$258, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$258, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$258, DW_AT_decl_line(0x26)
	.dwattr $C$DW$258, DW_AT_decl_column(0x18)

$C$DW$259	.dwtag  DW_TAG_member
	.dwattr $C$DW$259, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$259, DW_AT_name("state_timeout")
	.dwattr $C$DW$259, DW_AT_TI_symbol_name("state_timeout")
	.dwattr $C$DW$259, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$259, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$259, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$259, DW_AT_decl_line(0x27)
	.dwattr $C$DW$259, DW_AT_decl_column(0x0a)

$C$DW$260	.dwtag  DW_TAG_member
	.dwattr $C$DW$260, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$260, DW_AT_name("dataptr")
	.dwattr $C$DW$260, DW_AT_TI_symbol_name("dataptr")
	.dwattr $C$DW$260, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$260, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$260, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$260, DW_AT_decl_line(0x28)
	.dwattr $C$DW$260, DW_AT_decl_column(0x0c)

$C$DW$261	.dwtag  DW_TAG_member
	.dwattr $C$DW$261, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$261, DW_AT_name("cur_wordsleft")
	.dwattr $C$DW$261, DW_AT_TI_symbol_name("cur_wordsleft")
	.dwattr $C$DW$261, DW_AT_data_member_location[DW_OP_plus_uconst 0x7]
	.dwattr $C$DW$261, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$261, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$261, DW_AT_decl_line(0x29)
	.dwattr $C$DW$261, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$61, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x25)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$61

$C$DW$T$138	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$138, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$T$138, DW_AT_address_class(0x20)

$C$DW$T$139	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$139, DW_AT_name("statemachine_dma_t")
	.dwattr $C$DW$T$139, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$T$139, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$139, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$T$139, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$T$139, DW_AT_decl_column(0x03)


$C$DW$T$62	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$62, DW_AT_byte_size(0x04)
$C$DW$262	.dwtag  DW_TAG_member
	.dwattr $C$DW$262, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$262, DW_AT_name("SOFT_RST_N")
	.dwattr $C$DW$262, DW_AT_TI_symbol_name("SOFT_RST_N")
	.dwattr $C$DW$262, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$262, DW_AT_bit_size(0x01)
	.dwattr $C$DW$262, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$262, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$262, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$262, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$262, DW_AT_decl_column(0x0d)

$C$DW$263	.dwtag  DW_TAG_member
	.dwattr $C$DW$263, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$263, DW_AT_name("EN")
	.dwattr $C$DW$263, DW_AT_TI_symbol_name("EN")
	.dwattr $C$DW$263, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$263, DW_AT_bit_size(0x01)
	.dwattr $C$DW$263, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$263, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$263, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$263, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$263, DW_AT_decl_column(0x0d)

$C$DW$264	.dwtag  DW_TAG_member
	.dwattr $C$DW$264, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$264, DW_AT_name("SLEEPING")
	.dwattr $C$DW$264, DW_AT_TI_symbol_name("SLEEPING")
	.dwattr $C$DW$264, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$264, DW_AT_bit_size(0x01)
	.dwattr $C$DW$264, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$264, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$264, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$264, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$264, DW_AT_decl_column(0x0d)

$C$DW$265	.dwtag  DW_TAG_member
	.dwattr $C$DW$265, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$265, DW_AT_name("CTR_EN")
	.dwattr $C$DW$265, DW_AT_TI_symbol_name("CTR_EN")
	.dwattr $C$DW$265, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$265, DW_AT_bit_size(0x01)
	.dwattr $C$DW$265, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$265, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$265, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$265, DW_AT_decl_line(0x30)
	.dwattr $C$DW$265, DW_AT_decl_column(0x0d)

$C$DW$266	.dwtag  DW_TAG_member
	.dwattr $C$DW$266, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$266, DW_AT_name("rsvd4")
	.dwattr $C$DW$266, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$266, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$266, DW_AT_bit_size(0x04)
	.dwattr $C$DW$266, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$266, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$266, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$266, DW_AT_decl_line(0x31)
	.dwattr $C$DW$266, DW_AT_decl_column(0x0d)

$C$DW$267	.dwtag  DW_TAG_member
	.dwattr $C$DW$267, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$267, DW_AT_name("SINGLE_STEP")
	.dwattr $C$DW$267, DW_AT_TI_symbol_name("SINGLE_STEP")
	.dwattr $C$DW$267, DW_AT_bit_offset(0x17)
	.dwattr $C$DW$267, DW_AT_bit_size(0x01)
	.dwattr $C$DW$267, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$267, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$267, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$267, DW_AT_decl_line(0x32)
	.dwattr $C$DW$267, DW_AT_decl_column(0x0d)

$C$DW$268	.dwtag  DW_TAG_member
	.dwattr $C$DW$268, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$268, DW_AT_name("rsvd9")
	.dwattr $C$DW$268, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$268, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$268, DW_AT_bit_size(0x06)
	.dwattr $C$DW$268, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$268, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$268, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$268, DW_AT_decl_line(0x33)
	.dwattr $C$DW$268, DW_AT_decl_column(0x0d)

$C$DW$269	.dwtag  DW_TAG_member
	.dwattr $C$DW$269, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$269, DW_AT_name("RUNSTATE")
	.dwattr $C$DW$269, DW_AT_TI_symbol_name("RUNSTATE")
	.dwattr $C$DW$269, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$269, DW_AT_bit_size(0x01)
	.dwattr $C$DW$269, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$269, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$269, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$269, DW_AT_decl_line(0x34)
	.dwattr $C$DW$269, DW_AT_decl_column(0x0d)

$C$DW$270	.dwtag  DW_TAG_member
	.dwattr $C$DW$270, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$270, DW_AT_name("PCTR_RST_VAL")
	.dwattr $C$DW$270, DW_AT_TI_symbol_name("PCTR_RST_VAL")
	.dwattr $C$DW$270, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$270, DW_AT_bit_size(0x10)
	.dwattr $C$DW$270, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$270, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$270, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$270, DW_AT_decl_line(0x35)
	.dwattr $C$DW$270, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$62, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$62

$C$DW$T$109	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$109, DW_AT_type(*$C$DW$T$62)

$C$DW$T$140	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$140, DW_AT_type(*$C$DW$T$109)
	.dwattr $C$DW$T$140, DW_AT_address_class(0x20)


$C$DW$T$63	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x04)
$C$DW$271	.dwtag  DW_TAG_member
	.dwattr $C$DW$271, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$271, DW_AT_name("PCTR")
	.dwattr $C$DW$271, DW_AT_TI_symbol_name("PCTR")
	.dwattr $C$DW$271, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$271, DW_AT_bit_size(0x10)
	.dwattr $C$DW$271, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$271, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$271, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$271, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$271, DW_AT_decl_column(0x0d)

$C$DW$272	.dwtag  DW_TAG_member
	.dwattr $C$DW$272, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$272, DW_AT_name("rsvd16")
	.dwattr $C$DW$272, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$272, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$272, DW_AT_bit_size(0x10)
	.dwattr $C$DW$272, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$272, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$272, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$272, DW_AT_decl_line(0x40)
	.dwattr $C$DW$272, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$63, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$63

$C$DW$T$111	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$111, DW_AT_type(*$C$DW$T$63)


$C$DW$T$64	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$64, DW_AT_byte_size(0x04)
$C$DW$273	.dwtag  DW_TAG_member
	.dwattr $C$DW$273, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$273, DW_AT_name("BITWISE_ENS")
	.dwattr $C$DW$273, DW_AT_TI_symbol_name("BITWISE_ENS")
	.dwattr $C$DW$273, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$273, DW_AT_bit_size(0x20)
	.dwattr $C$DW$273, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$273, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$273, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$273, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$273, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$64, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$64, DW_AT_decl_line(0x49)
	.dwattr $C$DW$T$64, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$64

$C$DW$T$113	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$113, DW_AT_type(*$C$DW$T$64)


$C$DW$T$65	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$65, DW_AT_byte_size(0x04)
$C$DW$274	.dwtag  DW_TAG_member
	.dwattr $C$DW$274, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$274, DW_AT_name("CYCLECOUNT")
	.dwattr $C$DW$274, DW_AT_TI_symbol_name("CYCLECOUNT")
	.dwattr $C$DW$274, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$274, DW_AT_bit_size(0x20)
	.dwattr $C$DW$274, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$274, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$274, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$274, DW_AT_decl_line(0x54)
	.dwattr $C$DW$274, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$65, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x53)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$65

$C$DW$T$115	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$115, DW_AT_type(*$C$DW$T$65)


$C$DW$T$66	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$66, DW_AT_byte_size(0x04)
$C$DW$275	.dwtag  DW_TAG_member
	.dwattr $C$DW$275, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$275, DW_AT_name("STALLCOUNT")
	.dwattr $C$DW$275, DW_AT_TI_symbol_name("STALLCOUNT")
	.dwattr $C$DW$275, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$275, DW_AT_bit_size(0x20)
	.dwattr $C$DW$275, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$275, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$275, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$275, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$275, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$66, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$66, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$T$66, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$66

$C$DW$T$117	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$117, DW_AT_type(*$C$DW$T$66)


$C$DW$T$67	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$67, DW_AT_byte_size(0x04)
$C$DW$276	.dwtag  DW_TAG_member
	.dwattr $C$DW$276, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$276, DW_AT_name("C24_BLK_IDX")
	.dwattr $C$DW$276, DW_AT_TI_symbol_name("C24_BLK_IDX")
	.dwattr $C$DW$276, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$276, DW_AT_bit_size(0x08)
	.dwattr $C$DW$276, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$276, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$276, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$276, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$276, DW_AT_decl_column(0x0d)

$C$DW$277	.dwtag  DW_TAG_member
	.dwattr $C$DW$277, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$277, DW_AT_name("rsvd8")
	.dwattr $C$DW$277, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$277, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$277, DW_AT_bit_size(0x08)
	.dwattr $C$DW$277, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$277, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$277, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$277, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$277, DW_AT_decl_column(0x0d)

$C$DW$278	.dwtag  DW_TAG_member
	.dwattr $C$DW$278, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$278, DW_AT_name("C25_BLK_IDX")
	.dwattr $C$DW$278, DW_AT_TI_symbol_name("C25_BLK_IDX")
	.dwattr $C$DW$278, DW_AT_bit_offset(0x08)
	.dwattr $C$DW$278, DW_AT_bit_size(0x08)
	.dwattr $C$DW$278, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$278, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$278, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$278, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$278, DW_AT_decl_column(0x0d)

$C$DW$279	.dwtag  DW_TAG_member
	.dwattr $C$DW$279, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$279, DW_AT_name("rsvd24")
	.dwattr $C$DW$279, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$279, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$279, DW_AT_bit_size(0x08)
	.dwattr $C$DW$279, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$279, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$279, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$279, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$279, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$67, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$67

$C$DW$T$119	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$119, DW_AT_type(*$C$DW$T$67)


$C$DW$T$68	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$68, DW_AT_byte_size(0x04)
$C$DW$280	.dwtag  DW_TAG_member
	.dwattr $C$DW$280, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$280, DW_AT_name("C26_BLK_IDX")
	.dwattr $C$DW$280, DW_AT_TI_symbol_name("C26_BLK_IDX")
	.dwattr $C$DW$280, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$280, DW_AT_bit_size(0x08)
	.dwattr $C$DW$280, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$280, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$280, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$280, DW_AT_decl_line(0x78)
	.dwattr $C$DW$280, DW_AT_decl_column(0x0d)

$C$DW$281	.dwtag  DW_TAG_member
	.dwattr $C$DW$281, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$281, DW_AT_name("rsvd8")
	.dwattr $C$DW$281, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$281, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$281, DW_AT_bit_size(0x08)
	.dwattr $C$DW$281, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$281, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$281, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$281, DW_AT_decl_line(0x79)
	.dwattr $C$DW$281, DW_AT_decl_column(0x0d)

$C$DW$282	.dwtag  DW_TAG_member
	.dwattr $C$DW$282, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$282, DW_AT_name("C27_BLK_IDX")
	.dwattr $C$DW$282, DW_AT_TI_symbol_name("C27_BLK_IDX")
	.dwattr $C$DW$282, DW_AT_bit_offset(0x08)
	.dwattr $C$DW$282, DW_AT_bit_size(0x08)
	.dwattr $C$DW$282, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$282, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$282, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$282, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$282, DW_AT_decl_column(0x0d)

$C$DW$283	.dwtag  DW_TAG_member
	.dwattr $C$DW$283, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$283, DW_AT_name("rsvd24")
	.dwattr $C$DW$283, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$283, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$283, DW_AT_bit_size(0x08)
	.dwattr $C$DW$283, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$283, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$283, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$283, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$283, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$68, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$68, DW_AT_decl_line(0x77)
	.dwattr $C$DW$T$68, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$68

$C$DW$T$121	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$121, DW_AT_type(*$C$DW$T$68)


$C$DW$T$69	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$69, DW_AT_byte_size(0x04)
$C$DW$284	.dwtag  DW_TAG_member
	.dwattr $C$DW$284, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$284, DW_AT_name("C28_BLK_POINTER")
	.dwattr $C$DW$284, DW_AT_TI_symbol_name("C28_BLK_POINTER")
	.dwattr $C$DW$284, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$284, DW_AT_bit_size(0x10)
	.dwattr $C$DW$284, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$284, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$284, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$284, DW_AT_decl_line(0x85)
	.dwattr $C$DW$284, DW_AT_decl_column(0x0d)

$C$DW$285	.dwtag  DW_TAG_member
	.dwattr $C$DW$285, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$285, DW_AT_name("C29_BLK_POINTER")
	.dwattr $C$DW$285, DW_AT_TI_symbol_name("C29_BLK_POINTER")
	.dwattr $C$DW$285, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$285, DW_AT_bit_size(0x10)
	.dwattr $C$DW$285, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$285, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$285, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$285, DW_AT_decl_line(0x86)
	.dwattr $C$DW$285, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$69, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0x84)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$69

$C$DW$T$123	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$123, DW_AT_type(*$C$DW$T$69)


$C$DW$T$70	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$70, DW_AT_byte_size(0x04)
$C$DW$286	.dwtag  DW_TAG_member
	.dwattr $C$DW$286, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$286, DW_AT_name("C30_BLK_POINTER")
	.dwattr $C$DW$286, DW_AT_TI_symbol_name("C30_BLK_POINTER")
	.dwattr $C$DW$286, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$286, DW_AT_bit_size(0x10)
	.dwattr $C$DW$286, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$286, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$286, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$286, DW_AT_decl_line(0x90)
	.dwattr $C$DW$286, DW_AT_decl_column(0x0d)

$C$DW$287	.dwtag  DW_TAG_member
	.dwattr $C$DW$287, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$287, DW_AT_name("C31_BLK_POINTER")
	.dwattr $C$DW$287, DW_AT_TI_symbol_name("C31_BLK_POINTER")
	.dwattr $C$DW$287, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$287, DW_AT_bit_size(0x10)
	.dwattr $C$DW$287, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$287, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$287, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$287, DW_AT_decl_line(0x91)
	.dwattr $C$DW$287, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$70, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x8f)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$70

$C$DW$T$125	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$125, DW_AT_type(*$C$DW$T$70)


$C$DW$T$72	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$72, DW_AT_byte_size(0x30)
$C$DW$288	.dwtag  DW_TAG_member
	.dwattr $C$DW$288, DW_AT_type(*$C$DW$T$110)
	.dwattr $C$DW$288, DW_AT_name("$P$T15")
	.dwattr $C$DW$288, DW_AT_TI_symbol_name("$P$T15")
	.dwattr $C$DW$288, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$288, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$288, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$288, DW_AT_decl_line(0x29)
	.dwattr $C$DW$288, DW_AT_decl_column(0x02)

$C$DW$289	.dwtag  DW_TAG_member
	.dwattr $C$DW$289, DW_AT_type(*$C$DW$T$112)
	.dwattr $C$DW$289, DW_AT_name("$P$T16")
	.dwattr $C$DW$289, DW_AT_TI_symbol_name("$P$T16")
	.dwattr $C$DW$289, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$289, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$289, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$289, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$289, DW_AT_decl_column(0x02)

$C$DW$290	.dwtag  DW_TAG_member
	.dwattr $C$DW$290, DW_AT_type(*$C$DW$T$114)
	.dwattr $C$DW$290, DW_AT_name("$P$T17")
	.dwattr $C$DW$290, DW_AT_TI_symbol_name("$P$T17")
	.dwattr $C$DW$290, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$290, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$290, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$290, DW_AT_decl_line(0x46)
	.dwattr $C$DW$290, DW_AT_decl_column(0x02)

$C$DW$291	.dwtag  DW_TAG_member
	.dwattr $C$DW$291, DW_AT_type(*$C$DW$T$116)
	.dwattr $C$DW$291, DW_AT_name("$P$T18")
	.dwattr $C$DW$291, DW_AT_TI_symbol_name("$P$T18")
	.dwattr $C$DW$291, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$291, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$291, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$291, DW_AT_decl_line(0x50)
	.dwattr $C$DW$291, DW_AT_decl_column(0x02)

$C$DW$292	.dwtag  DW_TAG_member
	.dwattr $C$DW$292, DW_AT_type(*$C$DW$T$118)
	.dwattr $C$DW$292, DW_AT_name("$P$T19")
	.dwattr $C$DW$292, DW_AT_TI_symbol_name("$P$T19")
	.dwattr $C$DW$292, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$292, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$292, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$292, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$292, DW_AT_decl_column(0x02)

$C$DW$293	.dwtag  DW_TAG_member
	.dwattr $C$DW$293, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$293, DW_AT_name("rsvd14")
	.dwattr $C$DW$293, DW_AT_TI_symbol_name("rsvd14")
	.dwattr $C$DW$293, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$293, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$293, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$293, DW_AT_decl_line(0x63)
	.dwattr $C$DW$293, DW_AT_decl_column(0x0b)

$C$DW$294	.dwtag  DW_TAG_member
	.dwattr $C$DW$294, DW_AT_type(*$C$DW$T$120)
	.dwattr $C$DW$294, DW_AT_name("$P$T20")
	.dwattr $C$DW$294, DW_AT_TI_symbol_name("$P$T20")
	.dwattr $C$DW$294, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$294, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$294, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$294, DW_AT_decl_line(0x67)
	.dwattr $C$DW$294, DW_AT_decl_column(0x02)

$C$DW$295	.dwtag  DW_TAG_member
	.dwattr $C$DW$295, DW_AT_type(*$C$DW$T$122)
	.dwattr $C$DW$295, DW_AT_name("$P$T21")
	.dwattr $C$DW$295, DW_AT_TI_symbol_name("$P$T21")
	.dwattr $C$DW$295, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$295, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$295, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$295, DW_AT_decl_line(0x74)
	.dwattr $C$DW$295, DW_AT_decl_column(0x02)

$C$DW$296	.dwtag  DW_TAG_member
	.dwattr $C$DW$296, DW_AT_type(*$C$DW$T$124)
	.dwattr $C$DW$296, DW_AT_name("$P$T22")
	.dwattr $C$DW$296, DW_AT_TI_symbol_name("$P$T22")
	.dwattr $C$DW$296, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$296, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$296, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$296, DW_AT_decl_line(0x81)
	.dwattr $C$DW$296, DW_AT_decl_column(0x02)

$C$DW$297	.dwtag  DW_TAG_member
	.dwattr $C$DW$297, DW_AT_type(*$C$DW$T$126)
	.dwattr $C$DW$297, DW_AT_name("$P$T23")
	.dwattr $C$DW$297, DW_AT_TI_symbol_name("$P$T23")
	.dwattr $C$DW$297, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$297, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$297, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$297, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$297, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$72, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$72

$C$DW$T$143	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$143, DW_AT_name("pruCtrl")
	.dwattr $C$DW$T$143, DW_AT_type(*$C$DW$T$72)
	.dwattr $C$DW$T$143, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$143, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$143, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$143, DW_AT_decl_column(0x03)


$C$DW$T$75	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$75, DW_AT_byte_size(0x40000)
$C$DW$298	.dwtag  DW_TAG_member
	.dwattr $C$DW$298, DW_AT_type(*$C$DW$T$73)
	.dwattr $C$DW$298, DW_AT_name("words")
	.dwattr $C$DW$298, DW_AT_TI_symbol_name("words")
	.dwattr $C$DW$298, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$298, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$298, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$298, DW_AT_decl_line(0x35)
	.dwattr $C$DW$298, DW_AT_decl_column(0x0b)

$C$DW$299	.dwtag  DW_TAG_member
	.dwattr $C$DW$299, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$299, DW_AT_name("bytes")
	.dwattr $C$DW$299, DW_AT_TI_symbol_name("bytes")
	.dwattr $C$DW$299, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$299, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$299, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$299, DW_AT_decl_line(0x36)
	.dwattr $C$DW$299, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$75, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$T$75, DW_AT_decl_line(0x34)
	.dwattr $C$DW$T$75, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$75


$C$DW$T$81	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$81, DW_AT_byte_size(0x40c)
$C$DW$300	.dwtag  DW_TAG_member
	.dwattr $C$DW$300, DW_AT_type(*$C$DW$T$76)
	.dwattr $C$DW$300, DW_AT_name("mailbox_test")
	.dwattr $C$DW$300, DW_AT_TI_symbol_name("mailbox_test")
	.dwattr $C$DW$300, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$300, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$300, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$300, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$300, DW_AT_decl_column(0x12)

$C$DW$301	.dwtag  DW_TAG_member
	.dwattr $C$DW$301, DW_AT_type(*$C$DW$T$77)
	.dwattr $C$DW$301, DW_AT_name("buslatch")
	.dwattr $C$DW$301, DW_AT_TI_symbol_name("buslatch")
	.dwattr $C$DW$301, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$301, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$301, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$301, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$301, DW_AT_decl_column(0x16)

$C$DW$302	.dwtag  DW_TAG_member
	.dwattr $C$DW$302, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$302, DW_AT_name("buslatch_test")
	.dwattr $C$DW$302, DW_AT_TI_symbol_name("buslatch_test")
	.dwattr $C$DW$302, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$302, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$302, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$302, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$302, DW_AT_decl_column(0x1b)

$C$DW$303	.dwtag  DW_TAG_member
	.dwattr $C$DW$303, DW_AT_type(*$C$DW$T$79)
	.dwattr $C$DW$303, DW_AT_name("dma")
	.dwattr $C$DW$303, DW_AT_TI_symbol_name("dma")
	.dwattr $C$DW$303, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$303, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$303, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$303, DW_AT_decl_line(0x9e)
	.dwattr $C$DW$303, DW_AT_decl_column(0x11)

$C$DW$304	.dwtag  DW_TAG_member
	.dwattr $C$DW$304, DW_AT_type(*$C$DW$T$80)
	.dwattr $C$DW$304, DW_AT_name("intr")
	.dwattr $C$DW$304, DW_AT_TI_symbol_name("intr")
	.dwattr $C$DW$304, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$304, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$304, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$304, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$304, DW_AT_decl_column(0x12)

	.dwattr $C$DW$T$81, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$81, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$T$81, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$81


$C$DW$T$84	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$84, DW_AT_byte_size(0x04)
$C$DW$305	.dwtag  DW_TAG_member
	.dwattr $C$DW$305, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$305, DW_AT_name("REVID")
	.dwattr $C$DW$305, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$305, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$305, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$305, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$305, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$305, DW_AT_decl_column(0x15)

$C$DW$306	.dwtag  DW_TAG_member
	.dwattr $C$DW$306, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$306, DW_AT_name("REVID_bit")
	.dwattr $C$DW$306, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$306, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$306, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$306, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$306, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$306, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$84, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$84, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$84, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$84


$C$DW$T$86	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$86, DW_AT_byte_size(0x04)
$C$DW$307	.dwtag  DW_TAG_member
	.dwattr $C$DW$307, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$307, DW_AT_name("SYSCFG")
	.dwattr $C$DW$307, DW_AT_TI_symbol_name("SYSCFG")
	.dwattr $C$DW$307, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$307, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$307, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$307, DW_AT_decl_line(0x34)
	.dwattr $C$DW$307, DW_AT_decl_column(0x15)

$C$DW$308	.dwtag  DW_TAG_member
	.dwattr $C$DW$308, DW_AT_type(*$C$DW$T$85)
	.dwattr $C$DW$308, DW_AT_name("SYSCFG_bit")
	.dwattr $C$DW$308, DW_AT_TI_symbol_name("SYSCFG_bit")
	.dwattr $C$DW$308, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$308, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$308, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$308, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$308, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$86, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$86, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$86, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$86


$C$DW$T$88	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$88, DW_AT_byte_size(0x04)
$C$DW$309	.dwtag  DW_TAG_member
	.dwattr $C$DW$309, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$309, DW_AT_name("GPCFG0")
	.dwattr $C$DW$309, DW_AT_TI_symbol_name("GPCFG0")
	.dwattr $C$DW$309, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$309, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$309, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$309, DW_AT_decl_line(0x42)
	.dwattr $C$DW$309, DW_AT_decl_column(0x15)

$C$DW$310	.dwtag  DW_TAG_member
	.dwattr $C$DW$310, DW_AT_type(*$C$DW$T$87)
	.dwattr $C$DW$310, DW_AT_name("GPCFG0_bit")
	.dwattr $C$DW$310, DW_AT_TI_symbol_name("GPCFG0_bit")
	.dwattr $C$DW$310, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$310, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$310, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$310, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$310, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$88, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$88, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$88, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$88


$C$DW$T$90	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$90, DW_AT_byte_size(0x04)
$C$DW$311	.dwtag  DW_TAG_member
	.dwattr $C$DW$311, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$311, DW_AT_name("GPCFG1")
	.dwattr $C$DW$311, DW_AT_TI_symbol_name("GPCFG1")
	.dwattr $C$DW$311, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$311, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$311, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$311, DW_AT_decl_line(0x55)
	.dwattr $C$DW$311, DW_AT_decl_column(0x15)

$C$DW$312	.dwtag  DW_TAG_member
	.dwattr $C$DW$312, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$312, DW_AT_name("GPCFG1_bit")
	.dwattr $C$DW$312, DW_AT_TI_symbol_name("GPCFG1_bit")
	.dwattr $C$DW$312, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$312, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$312, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$312, DW_AT_decl_line(0x62)
	.dwattr $C$DW$312, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$90, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$90, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$90, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$90


$C$DW$T$92	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$92, DW_AT_byte_size(0x04)
$C$DW$313	.dwtag  DW_TAG_member
	.dwattr $C$DW$313, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$313, DW_AT_name("CGR")
	.dwattr $C$DW$313, DW_AT_TI_symbol_name("CGR")
	.dwattr $C$DW$313, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$313, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$313, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$313, DW_AT_decl_line(0x68)
	.dwattr $C$DW$313, DW_AT_decl_column(0x15)

$C$DW$314	.dwtag  DW_TAG_member
	.dwattr $C$DW$314, DW_AT_type(*$C$DW$T$91)
	.dwattr $C$DW$314, DW_AT_name("CGR_bit")
	.dwattr $C$DW$314, DW_AT_TI_symbol_name("CGR_bit")
	.dwattr $C$DW$314, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$314, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$314, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$314, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$314, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$92, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$92, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$92, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$92


$C$DW$T$94	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$94, DW_AT_byte_size(0x04)
$C$DW$315	.dwtag  DW_TAG_member
	.dwattr $C$DW$315, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$315, DW_AT_name("ISRP")
	.dwattr $C$DW$315, DW_AT_TI_symbol_name("ISRP")
	.dwattr $C$DW$315, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$315, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$315, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$315, DW_AT_decl_line(0x84)
	.dwattr $C$DW$315, DW_AT_decl_column(0x15)

$C$DW$316	.dwtag  DW_TAG_member
	.dwattr $C$DW$316, DW_AT_type(*$C$DW$T$93)
	.dwattr $C$DW$316, DW_AT_name("ISRP_bit")
	.dwattr $C$DW$316, DW_AT_TI_symbol_name("ISRP_bit")
	.dwattr $C$DW$316, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$316, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$316, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$316, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$316, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$94, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$94, DW_AT_decl_line(0x83)
	.dwattr $C$DW$T$94, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$94


$C$DW$T$96	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$96, DW_AT_byte_size(0x04)
$C$DW$317	.dwtag  DW_TAG_member
	.dwattr $C$DW$317, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$317, DW_AT_name("ISP")
	.dwattr $C$DW$317, DW_AT_TI_symbol_name("ISP")
	.dwattr $C$DW$317, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$317, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$317, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$317, DW_AT_decl_line(0x93)
	.dwattr $C$DW$317, DW_AT_decl_column(0x15)

$C$DW$318	.dwtag  DW_TAG_member
	.dwattr $C$DW$318, DW_AT_type(*$C$DW$T$95)
	.dwattr $C$DW$318, DW_AT_name("ISP_bit")
	.dwattr $C$DW$318, DW_AT_TI_symbol_name("ISP_bit")
	.dwattr $C$DW$318, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$318, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$318, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$318, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$318, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$96, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$96, DW_AT_decl_line(0x92)
	.dwattr $C$DW$T$96, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$96


$C$DW$T$98	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$98, DW_AT_byte_size(0x04)
$C$DW$319	.dwtag  DW_TAG_member
	.dwattr $C$DW$319, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$319, DW_AT_name("IESP")
	.dwattr $C$DW$319, DW_AT_TI_symbol_name("IESP")
	.dwattr $C$DW$319, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$319, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$319, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$319, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$319, DW_AT_decl_column(0x15)

$C$DW$320	.dwtag  DW_TAG_member
	.dwattr $C$DW$320, DW_AT_type(*$C$DW$T$97)
	.dwattr $C$DW$320, DW_AT_name("IESP_bit")
	.dwattr $C$DW$320, DW_AT_TI_symbol_name("IESP_bit")
	.dwattr $C$DW$320, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$320, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$320, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$320, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$320, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$98, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$98, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$98, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$98


$C$DW$T$100	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$100, DW_AT_byte_size(0x04)
$C$DW$321	.dwtag  DW_TAG_member
	.dwattr $C$DW$321, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$321, DW_AT_name("IECP")
	.dwattr $C$DW$321, DW_AT_TI_symbol_name("IECP")
	.dwattr $C$DW$321, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$321, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$321, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$321, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$321, DW_AT_decl_column(0x15)

$C$DW$322	.dwtag  DW_TAG_member
	.dwattr $C$DW$322, DW_AT_type(*$C$DW$T$99)
	.dwattr $C$DW$322, DW_AT_name("IECP_bit")
	.dwattr $C$DW$322, DW_AT_TI_symbol_name("IECP_bit")
	.dwattr $C$DW$322, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$322, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$322, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$322, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$322, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$100, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$100, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$100, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$100


$C$DW$T$102	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$102, DW_AT_byte_size(0x04)
$C$DW$323	.dwtag  DW_TAG_member
	.dwattr $C$DW$323, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$323, DW_AT_name("PMAO")
	.dwattr $C$DW$323, DW_AT_TI_symbol_name("PMAO")
	.dwattr $C$DW$323, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$323, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$323, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$323, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$323, DW_AT_decl_column(0x15)

$C$DW$324	.dwtag  DW_TAG_member
	.dwattr $C$DW$324, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$324, DW_AT_name("PMAO_bit")
	.dwattr $C$DW$324, DW_AT_TI_symbol_name("PMAO_bit")
	.dwattr $C$DW$324, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$324, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$324, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$324, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$324, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$102, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$102, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$T$102, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$102


$C$DW$T$104	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$104, DW_AT_byte_size(0x04)
$C$DW$325	.dwtag  DW_TAG_member
	.dwattr $C$DW$325, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$325, DW_AT_name("IEPCLK")
	.dwattr $C$DW$325, DW_AT_TI_symbol_name("IEPCLK")
	.dwattr $C$DW$325, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$325, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$325, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$325, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$325, DW_AT_decl_column(0x15)

$C$DW$326	.dwtag  DW_TAG_member
	.dwattr $C$DW$326, DW_AT_type(*$C$DW$T$103)
	.dwattr $C$DW$326, DW_AT_name("IEPCLK_bit")
	.dwattr $C$DW$326, DW_AT_TI_symbol_name("IEPCLK_bit")
	.dwattr $C$DW$326, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$326, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$326, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$326, DW_AT_decl_line(0xd5)
	.dwattr $C$DW$326, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$104, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$104, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$T$104, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$104


$C$DW$T$106	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$106, DW_AT_byte_size(0x04)
$C$DW$327	.dwtag  DW_TAG_member
	.dwattr $C$DW$327, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$327, DW_AT_name("SPP")
	.dwattr $C$DW$327, DW_AT_TI_symbol_name("SPP")
	.dwattr $C$DW$327, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$327, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$327, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$327, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$327, DW_AT_decl_column(0x15)

$C$DW$328	.dwtag  DW_TAG_member
	.dwattr $C$DW$328, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$328, DW_AT_name("SPP_bit")
	.dwattr $C$DW$328, DW_AT_TI_symbol_name("SPP_bit")
	.dwattr $C$DW$328, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$328, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$328, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$328, DW_AT_decl_line(0xe1)
	.dwattr $C$DW$328, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$106, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$106, DW_AT_decl_line(0xda)
	.dwattr $C$DW$T$106, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$106


$C$DW$T$108	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$108, DW_AT_byte_size(0x04)
$C$DW$329	.dwtag  DW_TAG_member
	.dwattr $C$DW$329, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$329, DW_AT_name("PIN_MX")
	.dwattr $C$DW$329, DW_AT_TI_symbol_name("PIN_MX")
	.dwattr $C$DW$329, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$329, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$329, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$329, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$329, DW_AT_decl_column(0x15)

$C$DW$330	.dwtag  DW_TAG_member
	.dwattr $C$DW$330, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$330, DW_AT_name("PIN_MX_bit")
	.dwattr $C$DW$330, DW_AT_TI_symbol_name("PIN_MX_bit")
	.dwattr $C$DW$330, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$330, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$330, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$330, DW_AT_decl_line(0xee)
	.dwattr $C$DW$330, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$108, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$108, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$T$108, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$108


$C$DW$T$110	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$110, DW_AT_byte_size(0x04)
$C$DW$331	.dwtag  DW_TAG_member
	.dwattr $C$DW$331, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$331, DW_AT_name("CTRL")
	.dwattr $C$DW$331, DW_AT_TI_symbol_name("CTRL")
	.dwattr $C$DW$331, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$331, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$331, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$331, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$331, DW_AT_decl_column(0x15)

$C$DW$332	.dwtag  DW_TAG_member
	.dwattr $C$DW$332, DW_AT_type(*$C$DW$T$109)
	.dwattr $C$DW$332, DW_AT_name("CTRL_bit")
	.dwattr $C$DW$332, DW_AT_TI_symbol_name("CTRL_bit")
	.dwattr $C$DW$332, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$332, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$332, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$332, DW_AT_decl_line(0x36)
	.dwattr $C$DW$332, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$110, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$110, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$110, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$110


$C$DW$T$112	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$112, DW_AT_byte_size(0x04)
$C$DW$333	.dwtag  DW_TAG_member
	.dwattr $C$DW$333, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$333, DW_AT_name("STS")
	.dwattr $C$DW$333, DW_AT_TI_symbol_name("STS")
	.dwattr $C$DW$333, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$333, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$333, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$333, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$333, DW_AT_decl_column(0x15)

$C$DW$334	.dwtag  DW_TAG_member
	.dwattr $C$DW$334, DW_AT_type(*$C$DW$T$111)
	.dwattr $C$DW$334, DW_AT_name("STS_bit")
	.dwattr $C$DW$334, DW_AT_TI_symbol_name("STS_bit")
	.dwattr $C$DW$334, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$334, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$334, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$334, DW_AT_decl_line(0x41)
	.dwattr $C$DW$334, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$112, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$112, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$112, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$112


$C$DW$T$114	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$114, DW_AT_byte_size(0x04)
$C$DW$335	.dwtag  DW_TAG_member
	.dwattr $C$DW$335, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$335, DW_AT_name("WAKEUP_EN")
	.dwattr $C$DW$335, DW_AT_TI_symbol_name("WAKEUP_EN")
	.dwattr $C$DW$335, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$335, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$335, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$335, DW_AT_decl_line(0x47)
	.dwattr $C$DW$335, DW_AT_decl_column(0x15)

$C$DW$336	.dwtag  DW_TAG_member
	.dwattr $C$DW$336, DW_AT_type(*$C$DW$T$113)
	.dwattr $C$DW$336, DW_AT_name("WAKEUP_EN_bit")
	.dwattr $C$DW$336, DW_AT_TI_symbol_name("WAKEUP_EN_bit")
	.dwattr $C$DW$336, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$336, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$336, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$336, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$336, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$114, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$114, DW_AT_decl_line(0x46)
	.dwattr $C$DW$T$114, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$114


$C$DW$T$116	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$116, DW_AT_byte_size(0x04)
$C$DW$337	.dwtag  DW_TAG_member
	.dwattr $C$DW$337, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$337, DW_AT_name("CYCLE")
	.dwattr $C$DW$337, DW_AT_TI_symbol_name("CYCLE")
	.dwattr $C$DW$337, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$337, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$337, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$337, DW_AT_decl_line(0x51)
	.dwattr $C$DW$337, DW_AT_decl_column(0x15)

$C$DW$338	.dwtag  DW_TAG_member
	.dwattr $C$DW$338, DW_AT_type(*$C$DW$T$115)
	.dwattr $C$DW$338, DW_AT_name("CYCLE_bit")
	.dwattr $C$DW$338, DW_AT_TI_symbol_name("CYCLE_bit")
	.dwattr $C$DW$338, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$338, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$338, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$338, DW_AT_decl_line(0x55)
	.dwattr $C$DW$338, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$116, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$116, DW_AT_decl_line(0x50)
	.dwattr $C$DW$T$116, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$116


$C$DW$T$118	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$118, DW_AT_byte_size(0x04)
$C$DW$339	.dwtag  DW_TAG_member
	.dwattr $C$DW$339, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$339, DW_AT_name("STALL")
	.dwattr $C$DW$339, DW_AT_TI_symbol_name("STALL")
	.dwattr $C$DW$339, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$339, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$339, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$339, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$339, DW_AT_decl_column(0x15)

$C$DW$340	.dwtag  DW_TAG_member
	.dwattr $C$DW$340, DW_AT_type(*$C$DW$T$117)
	.dwattr $C$DW$340, DW_AT_name("STALL_bit")
	.dwattr $C$DW$340, DW_AT_TI_symbol_name("STALL_bit")
	.dwattr $C$DW$340, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$340, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$340, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$340, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$340, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$118, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$118, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$T$118, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$118


$C$DW$T$120	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$120, DW_AT_byte_size(0x04)
$C$DW$341	.dwtag  DW_TAG_member
	.dwattr $C$DW$341, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$341, DW_AT_name("CTBIR0")
	.dwattr $C$DW$341, DW_AT_TI_symbol_name("CTBIR0")
	.dwattr $C$DW$341, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$341, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$341, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$341, DW_AT_decl_line(0x68)
	.dwattr $C$DW$341, DW_AT_decl_column(0x15)

$C$DW$342	.dwtag  DW_TAG_member
	.dwattr $C$DW$342, DW_AT_type(*$C$DW$T$119)
	.dwattr $C$DW$342, DW_AT_name("CTBIR0_bit")
	.dwattr $C$DW$342, DW_AT_TI_symbol_name("CTBIR0_bit")
	.dwattr $C$DW$342, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$342, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$342, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$342, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$342, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$120, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$120, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$120, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$120


$C$DW$T$122	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$122, DW_AT_byte_size(0x04)
$C$DW$343	.dwtag  DW_TAG_member
	.dwattr $C$DW$343, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$343, DW_AT_name("CTBIR1")
	.dwattr $C$DW$343, DW_AT_TI_symbol_name("CTBIR1")
	.dwattr $C$DW$343, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$343, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$343, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$343, DW_AT_decl_line(0x75)
	.dwattr $C$DW$343, DW_AT_decl_column(0x15)

$C$DW$344	.dwtag  DW_TAG_member
	.dwattr $C$DW$344, DW_AT_type(*$C$DW$T$121)
	.dwattr $C$DW$344, DW_AT_name("CTBIR1_bit")
	.dwattr $C$DW$344, DW_AT_TI_symbol_name("CTBIR1_bit")
	.dwattr $C$DW$344, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$344, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$344, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$344, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$344, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$122, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$122, DW_AT_decl_line(0x74)
	.dwattr $C$DW$T$122, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$122


$C$DW$T$124	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$124, DW_AT_byte_size(0x04)
$C$DW$345	.dwtag  DW_TAG_member
	.dwattr $C$DW$345, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$345, DW_AT_name("CTPPR0")
	.dwattr $C$DW$345, DW_AT_TI_symbol_name("CTPPR0")
	.dwattr $C$DW$345, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$345, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$345, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$345, DW_AT_decl_line(0x82)
	.dwattr $C$DW$345, DW_AT_decl_column(0x15)

$C$DW$346	.dwtag  DW_TAG_member
	.dwattr $C$DW$346, DW_AT_type(*$C$DW$T$123)
	.dwattr $C$DW$346, DW_AT_name("CTPPR0_bit")
	.dwattr $C$DW$346, DW_AT_TI_symbol_name("CTPPR0_bit")
	.dwattr $C$DW$346, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$346, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$346, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$346, DW_AT_decl_line(0x87)
	.dwattr $C$DW$346, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$124, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$124, DW_AT_decl_line(0x81)
	.dwattr $C$DW$T$124, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$124


$C$DW$T$126	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$126, DW_AT_byte_size(0x04)
$C$DW$347	.dwtag  DW_TAG_member
	.dwattr $C$DW$347, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$347, DW_AT_name("CTPPR1")
	.dwattr $C$DW$347, DW_AT_TI_symbol_name("CTPPR1")
	.dwattr $C$DW$347, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$347, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$347, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$347, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$347, DW_AT_decl_column(0x15)

$C$DW$348	.dwtag  DW_TAG_member
	.dwattr $C$DW$348, DW_AT_type(*$C$DW$T$125)
	.dwattr $C$DW$348, DW_AT_name("CTPPR1_bit")
	.dwattr $C$DW$348, DW_AT_TI_symbol_name("CTPPR1_bit")
	.dwattr $C$DW$348, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$348, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$348, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$348, DW_AT_decl_line(0x92)
	.dwattr $C$DW$348, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$126, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$126, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$T$126, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$126

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

$C$DW$T$159	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$159, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$159, DW_AT_address_class(0x20)

$C$DW$T$22	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$22, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$22, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x1c)


$C$DW$T$37	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$37, DW_AT_byte_size(0x08)
$C$DW$349	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$349, DW_AT_upper_bound(0x07)

	.dwendtag $C$DW$T$37


$C$DW$T$55	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$T$55, DW_AT_language(DW_LANG_C)
	.dwendtag $C$DW$T$55

$C$DW$T$56	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$56, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$T$56, DW_AT_address_class(0x10)

$C$DW$T$57	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$57, DW_AT_name("sm_arb_state_func_ptr")
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$57, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$57, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$T$57, DW_AT_decl_line(0x1f)
	.dwattr $C$DW$T$57, DW_AT_decl_column(0x13)

$C$DW$T$59	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$59, DW_AT_name("sm_dma_state_func_ptr")
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$59, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$59, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0x21)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x13)


$C$DW$T$74	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$74, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$T$74, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$74, DW_AT_byte_size(0x40000)
$C$DW$350	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$350, DW_AT_upper_bound(0x3ffff)

	.dwendtag $C$DW$T$74

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

$C$DW$T$24	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$24, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$24, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x1c)


$C$DW$T$29	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$29, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$T$29, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x400)
$C$DW$351	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$351, DW_AT_upper_bound(0x1ff)

	.dwendtag $C$DW$T$29

$C$DW$T$60	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$T$60, DW_AT_address_class(0x20)


$C$DW$T$73	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$73, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$T$73, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$73, DW_AT_byte_size(0x40000)
$C$DW$352	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$352, DW_AT_upper_bound(0x1ffff)

	.dwendtag $C$DW$T$73

$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)

$C$DW$T$23	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$23, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$23, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$23, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x1c)


$C$DW$T$52	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$52, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$52, DW_AT_byte_size(0x04)
$C$DW$353	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$353, DW_AT_upper_bound(0x00)

	.dwendtag $C$DW$T$52


$C$DW$T$53	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x08)
$C$DW$354	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$354, DW_AT_upper_bound(0x01)

	.dwendtag $C$DW$T$53


$C$DW$T$71	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$71, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$71, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$71, DW_AT_byte_size(0x0c)
$C$DW$355	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$355, DW_AT_upper_bound(0x02)

	.dwendtag $C$DW$T$71

$C$DW$T$82	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$82, DW_AT_type(*$C$DW$T$23)

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

$C$DW$356	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$356, DW_AT_name("R0_b0")
	.dwattr $C$DW$356, DW_AT_location[DW_OP_reg0]

$C$DW$357	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$357, DW_AT_name("R0_b1")
	.dwattr $C$DW$357, DW_AT_location[DW_OP_reg1]

$C$DW$358	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$358, DW_AT_name("R0_b2")
	.dwattr $C$DW$358, DW_AT_location[DW_OP_reg2]

$C$DW$359	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$359, DW_AT_name("R0_b3")
	.dwattr $C$DW$359, DW_AT_location[DW_OP_reg3]

$C$DW$360	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$360, DW_AT_name("R1_b0")
	.dwattr $C$DW$360, DW_AT_location[DW_OP_reg4]

$C$DW$361	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$361, DW_AT_name("R1_b1")
	.dwattr $C$DW$361, DW_AT_location[DW_OP_reg5]

$C$DW$362	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$362, DW_AT_name("R1_b2")
	.dwattr $C$DW$362, DW_AT_location[DW_OP_reg6]

$C$DW$363	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$363, DW_AT_name("R1_b3")
	.dwattr $C$DW$363, DW_AT_location[DW_OP_reg7]

$C$DW$364	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$364, DW_AT_name("R2_b0")
	.dwattr $C$DW$364, DW_AT_location[DW_OP_reg8]

$C$DW$365	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$365, DW_AT_name("R2_b1")
	.dwattr $C$DW$365, DW_AT_location[DW_OP_reg9]

$C$DW$366	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$366, DW_AT_name("R2_b2")
	.dwattr $C$DW$366, DW_AT_location[DW_OP_reg10]

$C$DW$367	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$367, DW_AT_name("R2_b3")
	.dwattr $C$DW$367, DW_AT_location[DW_OP_reg11]

$C$DW$368	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$368, DW_AT_name("R3_b0")
	.dwattr $C$DW$368, DW_AT_location[DW_OP_reg12]

$C$DW$369	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$369, DW_AT_name("R3_b1")
	.dwattr $C$DW$369, DW_AT_location[DW_OP_reg13]

$C$DW$370	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$370, DW_AT_name("R3_b2")
	.dwattr $C$DW$370, DW_AT_location[DW_OP_reg14]

$C$DW$371	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$371, DW_AT_name("R3_b3")
	.dwattr $C$DW$371, DW_AT_location[DW_OP_reg15]

$C$DW$372	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$372, DW_AT_name("R4_b0")
	.dwattr $C$DW$372, DW_AT_location[DW_OP_reg16]

$C$DW$373	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$373, DW_AT_name("R4_b1")
	.dwattr $C$DW$373, DW_AT_location[DW_OP_reg17]

$C$DW$374	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$374, DW_AT_name("R4_b2")
	.dwattr $C$DW$374, DW_AT_location[DW_OP_reg18]

$C$DW$375	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$375, DW_AT_name("R4_b3")
	.dwattr $C$DW$375, DW_AT_location[DW_OP_reg19]

$C$DW$376	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$376, DW_AT_name("R5_b0")
	.dwattr $C$DW$376, DW_AT_location[DW_OP_reg20]

$C$DW$377	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$377, DW_AT_name("R5_b1")
	.dwattr $C$DW$377, DW_AT_location[DW_OP_reg21]

$C$DW$378	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$378, DW_AT_name("R5_b2")
	.dwattr $C$DW$378, DW_AT_location[DW_OP_reg22]

$C$DW$379	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$379, DW_AT_name("R5_b3")
	.dwattr $C$DW$379, DW_AT_location[DW_OP_reg23]

$C$DW$380	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$380, DW_AT_name("R6_b0")
	.dwattr $C$DW$380, DW_AT_location[DW_OP_reg24]

$C$DW$381	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$381, DW_AT_name("R6_b1")
	.dwattr $C$DW$381, DW_AT_location[DW_OP_reg25]

$C$DW$382	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$382, DW_AT_name("R6_b2")
	.dwattr $C$DW$382, DW_AT_location[DW_OP_reg26]

$C$DW$383	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$383, DW_AT_name("R6_b3")
	.dwattr $C$DW$383, DW_AT_location[DW_OP_reg27]

$C$DW$384	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$384, DW_AT_name("R7_b0")
	.dwattr $C$DW$384, DW_AT_location[DW_OP_reg28]

$C$DW$385	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$385, DW_AT_name("R7_b1")
	.dwattr $C$DW$385, DW_AT_location[DW_OP_reg29]

$C$DW$386	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$386, DW_AT_name("R7_b2")
	.dwattr $C$DW$386, DW_AT_location[DW_OP_reg30]

$C$DW$387	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$387, DW_AT_name("R7_b3")
	.dwattr $C$DW$387, DW_AT_location[DW_OP_reg31]

$C$DW$388	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$388, DW_AT_name("R8_b0")
	.dwattr $C$DW$388, DW_AT_location[DW_OP_regx 0x20]

$C$DW$389	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$389, DW_AT_name("R8_b1")
	.dwattr $C$DW$389, DW_AT_location[DW_OP_regx 0x21]

$C$DW$390	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$390, DW_AT_name("R8_b2")
	.dwattr $C$DW$390, DW_AT_location[DW_OP_regx 0x22]

$C$DW$391	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$391, DW_AT_name("R8_b3")
	.dwattr $C$DW$391, DW_AT_location[DW_OP_regx 0x23]

$C$DW$392	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$392, DW_AT_name("R9_b0")
	.dwattr $C$DW$392, DW_AT_location[DW_OP_regx 0x24]

$C$DW$393	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$393, DW_AT_name("R9_b1")
	.dwattr $C$DW$393, DW_AT_location[DW_OP_regx 0x25]

$C$DW$394	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$394, DW_AT_name("R9_b2")
	.dwattr $C$DW$394, DW_AT_location[DW_OP_regx 0x26]

$C$DW$395	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$395, DW_AT_name("R9_b3")
	.dwattr $C$DW$395, DW_AT_location[DW_OP_regx 0x27]

$C$DW$396	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$396, DW_AT_name("R10_b0")
	.dwattr $C$DW$396, DW_AT_location[DW_OP_regx 0x28]

$C$DW$397	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$397, DW_AT_name("R10_b1")
	.dwattr $C$DW$397, DW_AT_location[DW_OP_regx 0x29]

$C$DW$398	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$398, DW_AT_name("R10_b2")
	.dwattr $C$DW$398, DW_AT_location[DW_OP_regx 0x2a]

$C$DW$399	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$399, DW_AT_name("R10_b3")
	.dwattr $C$DW$399, DW_AT_location[DW_OP_regx 0x2b]

$C$DW$400	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$400, DW_AT_name("R11_b0")
	.dwattr $C$DW$400, DW_AT_location[DW_OP_regx 0x2c]

$C$DW$401	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$401, DW_AT_name("R11_b1")
	.dwattr $C$DW$401, DW_AT_location[DW_OP_regx 0x2d]

$C$DW$402	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$402, DW_AT_name("R11_b2")
	.dwattr $C$DW$402, DW_AT_location[DW_OP_regx 0x2e]

$C$DW$403	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$403, DW_AT_name("R11_b3")
	.dwattr $C$DW$403, DW_AT_location[DW_OP_regx 0x2f]

$C$DW$404	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$404, DW_AT_name("R12_b0")
	.dwattr $C$DW$404, DW_AT_location[DW_OP_regx 0x30]

$C$DW$405	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$405, DW_AT_name("R12_b1")
	.dwattr $C$DW$405, DW_AT_location[DW_OP_regx 0x31]

$C$DW$406	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$406, DW_AT_name("R12_b2")
	.dwattr $C$DW$406, DW_AT_location[DW_OP_regx 0x32]

$C$DW$407	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$407, DW_AT_name("R12_b3")
	.dwattr $C$DW$407, DW_AT_location[DW_OP_regx 0x33]

$C$DW$408	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$408, DW_AT_name("R13_b0")
	.dwattr $C$DW$408, DW_AT_location[DW_OP_regx 0x34]

$C$DW$409	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$409, DW_AT_name("R13_b1")
	.dwattr $C$DW$409, DW_AT_location[DW_OP_regx 0x35]

$C$DW$410	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$410, DW_AT_name("R13_b2")
	.dwattr $C$DW$410, DW_AT_location[DW_OP_regx 0x36]

$C$DW$411	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$411, DW_AT_name("R13_b3")
	.dwattr $C$DW$411, DW_AT_location[DW_OP_regx 0x37]

$C$DW$412	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$412, DW_AT_name("R14_b0")
	.dwattr $C$DW$412, DW_AT_location[DW_OP_regx 0x38]

$C$DW$413	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$413, DW_AT_name("R14_b1")
	.dwattr $C$DW$413, DW_AT_location[DW_OP_regx 0x39]

$C$DW$414	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$414, DW_AT_name("R14_b2")
	.dwattr $C$DW$414, DW_AT_location[DW_OP_regx 0x3a]

$C$DW$415	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$415, DW_AT_name("R14_b3")
	.dwattr $C$DW$415, DW_AT_location[DW_OP_regx 0x3b]

$C$DW$416	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$416, DW_AT_name("R15_b0")
	.dwattr $C$DW$416, DW_AT_location[DW_OP_regx 0x3c]

$C$DW$417	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$417, DW_AT_name("R15_b1")
	.dwattr $C$DW$417, DW_AT_location[DW_OP_regx 0x3d]

$C$DW$418	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$418, DW_AT_name("R15_b2")
	.dwattr $C$DW$418, DW_AT_location[DW_OP_regx 0x3e]

$C$DW$419	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$419, DW_AT_name("R15_b3")
	.dwattr $C$DW$419, DW_AT_location[DW_OP_regx 0x3f]

$C$DW$420	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$420, DW_AT_name("R16_b0")
	.dwattr $C$DW$420, DW_AT_location[DW_OP_regx 0x40]

$C$DW$421	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$421, DW_AT_name("R16_b1")
	.dwattr $C$DW$421, DW_AT_location[DW_OP_regx 0x41]

$C$DW$422	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$422, DW_AT_name("R16_b2")
	.dwattr $C$DW$422, DW_AT_location[DW_OP_regx 0x42]

$C$DW$423	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$423, DW_AT_name("R16_b3")
	.dwattr $C$DW$423, DW_AT_location[DW_OP_regx 0x43]

$C$DW$424	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$424, DW_AT_name("R17_b0")
	.dwattr $C$DW$424, DW_AT_location[DW_OP_regx 0x44]

$C$DW$425	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$425, DW_AT_name("R17_b1")
	.dwattr $C$DW$425, DW_AT_location[DW_OP_regx 0x45]

$C$DW$426	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$426, DW_AT_name("R17_b2")
	.dwattr $C$DW$426, DW_AT_location[DW_OP_regx 0x46]

$C$DW$427	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$427, DW_AT_name("R17_b3")
	.dwattr $C$DW$427, DW_AT_location[DW_OP_regx 0x47]

$C$DW$428	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$428, DW_AT_name("R18_b0")
	.dwattr $C$DW$428, DW_AT_location[DW_OP_regx 0x48]

$C$DW$429	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$429, DW_AT_name("R18_b1")
	.dwattr $C$DW$429, DW_AT_location[DW_OP_regx 0x49]

$C$DW$430	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$430, DW_AT_name("R18_b2")
	.dwattr $C$DW$430, DW_AT_location[DW_OP_regx 0x4a]

$C$DW$431	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$431, DW_AT_name("R18_b3")
	.dwattr $C$DW$431, DW_AT_location[DW_OP_regx 0x4b]

$C$DW$432	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$432, DW_AT_name("R19_b0")
	.dwattr $C$DW$432, DW_AT_location[DW_OP_regx 0x4c]

$C$DW$433	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$433, DW_AT_name("R19_b1")
	.dwattr $C$DW$433, DW_AT_location[DW_OP_regx 0x4d]

$C$DW$434	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$434, DW_AT_name("R19_b2")
	.dwattr $C$DW$434, DW_AT_location[DW_OP_regx 0x4e]

$C$DW$435	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$435, DW_AT_name("R19_b3")
	.dwattr $C$DW$435, DW_AT_location[DW_OP_regx 0x4f]

$C$DW$436	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$436, DW_AT_name("R20_b0")
	.dwattr $C$DW$436, DW_AT_location[DW_OP_regx 0x50]

$C$DW$437	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$437, DW_AT_name("R20_b1")
	.dwattr $C$DW$437, DW_AT_location[DW_OP_regx 0x51]

$C$DW$438	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$438, DW_AT_name("R20_b2")
	.dwattr $C$DW$438, DW_AT_location[DW_OP_regx 0x52]

$C$DW$439	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$439, DW_AT_name("R20_b3")
	.dwattr $C$DW$439, DW_AT_location[DW_OP_regx 0x53]

$C$DW$440	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$440, DW_AT_name("R21_b0")
	.dwattr $C$DW$440, DW_AT_location[DW_OP_regx 0x54]

$C$DW$441	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$441, DW_AT_name("R21_b1")
	.dwattr $C$DW$441, DW_AT_location[DW_OP_regx 0x55]

$C$DW$442	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$442, DW_AT_name("R21_b2")
	.dwattr $C$DW$442, DW_AT_location[DW_OP_regx 0x56]

$C$DW$443	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$443, DW_AT_name("R21_b3")
	.dwattr $C$DW$443, DW_AT_location[DW_OP_regx 0x57]

$C$DW$444	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$444, DW_AT_name("R22_b0")
	.dwattr $C$DW$444, DW_AT_location[DW_OP_regx 0x58]

$C$DW$445	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$445, DW_AT_name("R22_b1")
	.dwattr $C$DW$445, DW_AT_location[DW_OP_regx 0x59]

$C$DW$446	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$446, DW_AT_name("R22_b2")
	.dwattr $C$DW$446, DW_AT_location[DW_OP_regx 0x5a]

$C$DW$447	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$447, DW_AT_name("R22_b3")
	.dwattr $C$DW$447, DW_AT_location[DW_OP_regx 0x5b]

$C$DW$448	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$448, DW_AT_name("R23_b0")
	.dwattr $C$DW$448, DW_AT_location[DW_OP_regx 0x5c]

$C$DW$449	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$449, DW_AT_name("R23_b1")
	.dwattr $C$DW$449, DW_AT_location[DW_OP_regx 0x5d]

$C$DW$450	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$450, DW_AT_name("R23_b2")
	.dwattr $C$DW$450, DW_AT_location[DW_OP_regx 0x5e]

$C$DW$451	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$451, DW_AT_name("R23_b3")
	.dwattr $C$DW$451, DW_AT_location[DW_OP_regx 0x5f]

$C$DW$452	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$452, DW_AT_name("R24_b0")
	.dwattr $C$DW$452, DW_AT_location[DW_OP_regx 0x60]

$C$DW$453	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$453, DW_AT_name("R24_b1")
	.dwattr $C$DW$453, DW_AT_location[DW_OP_regx 0x61]

$C$DW$454	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$454, DW_AT_name("R24_b2")
	.dwattr $C$DW$454, DW_AT_location[DW_OP_regx 0x62]

$C$DW$455	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$455, DW_AT_name("R24_b3")
	.dwattr $C$DW$455, DW_AT_location[DW_OP_regx 0x63]

$C$DW$456	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$456, DW_AT_name("R25_b0")
	.dwattr $C$DW$456, DW_AT_location[DW_OP_regx 0x64]

$C$DW$457	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$457, DW_AT_name("R25_b1")
	.dwattr $C$DW$457, DW_AT_location[DW_OP_regx 0x65]

$C$DW$458	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$458, DW_AT_name("R25_b2")
	.dwattr $C$DW$458, DW_AT_location[DW_OP_regx 0x66]

$C$DW$459	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$459, DW_AT_name("R25_b3")
	.dwattr $C$DW$459, DW_AT_location[DW_OP_regx 0x67]

$C$DW$460	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$460, DW_AT_name("R26_b0")
	.dwattr $C$DW$460, DW_AT_location[DW_OP_regx 0x68]

$C$DW$461	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$461, DW_AT_name("R26_b1")
	.dwattr $C$DW$461, DW_AT_location[DW_OP_regx 0x69]

$C$DW$462	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$462, DW_AT_name("R26_b2")
	.dwattr $C$DW$462, DW_AT_location[DW_OP_regx 0x6a]

$C$DW$463	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$463, DW_AT_name("R26_b3")
	.dwattr $C$DW$463, DW_AT_location[DW_OP_regx 0x6b]

$C$DW$464	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$464, DW_AT_name("R27_b0")
	.dwattr $C$DW$464, DW_AT_location[DW_OP_regx 0x6c]

$C$DW$465	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$465, DW_AT_name("R27_b1")
	.dwattr $C$DW$465, DW_AT_location[DW_OP_regx 0x6d]

$C$DW$466	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$466, DW_AT_name("R27_b2")
	.dwattr $C$DW$466, DW_AT_location[DW_OP_regx 0x6e]

$C$DW$467	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$467, DW_AT_name("R27_b3")
	.dwattr $C$DW$467, DW_AT_location[DW_OP_regx 0x6f]

$C$DW$468	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$468, DW_AT_name("R28_b0")
	.dwattr $C$DW$468, DW_AT_location[DW_OP_regx 0x70]

$C$DW$469	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$469, DW_AT_name("R28_b1")
	.dwattr $C$DW$469, DW_AT_location[DW_OP_regx 0x71]

$C$DW$470	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$470, DW_AT_name("R28_b2")
	.dwattr $C$DW$470, DW_AT_location[DW_OP_regx 0x72]

$C$DW$471	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$471, DW_AT_name("R28_b3")
	.dwattr $C$DW$471, DW_AT_location[DW_OP_regx 0x73]

$C$DW$472	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$472, DW_AT_name("R29_b0")
	.dwattr $C$DW$472, DW_AT_location[DW_OP_regx 0x74]

$C$DW$473	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$473, DW_AT_name("R29_b1")
	.dwattr $C$DW$473, DW_AT_location[DW_OP_regx 0x75]

$C$DW$474	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$474, DW_AT_name("R29_b2")
	.dwattr $C$DW$474, DW_AT_location[DW_OP_regx 0x76]

$C$DW$475	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$475, DW_AT_name("R29_b3")
	.dwattr $C$DW$475, DW_AT_location[DW_OP_regx 0x77]

$C$DW$476	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$476, DW_AT_name("R30_b0")
	.dwattr $C$DW$476, DW_AT_location[DW_OP_regx 0x78]

$C$DW$477	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$477, DW_AT_name("R30_b1")
	.dwattr $C$DW$477, DW_AT_location[DW_OP_regx 0x79]

$C$DW$478	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$478, DW_AT_name("R30_b2")
	.dwattr $C$DW$478, DW_AT_location[DW_OP_regx 0x7a]

$C$DW$479	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$479, DW_AT_name("R30_b3")
	.dwattr $C$DW$479, DW_AT_location[DW_OP_regx 0x7b]

$C$DW$480	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$480, DW_AT_name("R31_b0")
	.dwattr $C$DW$480, DW_AT_location[DW_OP_regx 0x7c]

$C$DW$481	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$481, DW_AT_name("R31_b1")
	.dwattr $C$DW$481, DW_AT_location[DW_OP_regx 0x7d]

$C$DW$482	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$482, DW_AT_name("R31_b2")
	.dwattr $C$DW$482, DW_AT_location[DW_OP_regx 0x7e]

$C$DW$483	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$483, DW_AT_name("R31_b3")
	.dwattr $C$DW$483, DW_AT_location[DW_OP_regx 0x7f]

	.dwendtag $C$DW$CU

