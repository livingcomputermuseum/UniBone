;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.3.1 *
;* Date/Time created: Sun Mar 31 20:55:33 2019                                *
;******************************************************************************
	.compiler_opts --abi=eabi --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("pru1_main.c")
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
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$110)
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$1, DW_AT_decl_column(0x17)

	.global	||pru_remoteproc_ResourceTable||
	.sect	".resource_table:retain", RW
	.retain
	.align	1
	.elfsym	||pru_remoteproc_ResourceTable||,SYM_SIZE(20)
||pru_remoteproc_ResourceTable||:
	.bits		0x1,32
			; pru_remoteproc_ResourceTable.base.ver @ 0
	.bits		0,32
			; pru_remoteproc_ResourceTable.base.num @ 32
	.bits		0,32
			; pru_remoteproc_ResourceTable.base.reserved[0] @ 64
	.bits		0,32
			; pru_remoteproc_ResourceTable.base.reserved[1] @ 96
	.bits		0,32
			; pru_remoteproc_ResourceTable.offset[0] @ 128

$C$DW$2	.dwtag  DW_TAG_variable
	.dwattr $C$DW$2, DW_AT_name("pru_remoteproc_ResourceTable")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("pru_remoteproc_ResourceTable")
	.dwattr $C$DW$2, DW_AT_location[DW_OP_addr ||pru_remoteproc_ResourceTable||]
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$104)
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$2, DW_AT_decl_line(0x40)
	.dwattr $C$DW$2, DW_AT_decl_column(0x1a)

$C$DW$3	.dwtag  DW_TAG_variable
	.dwattr $C$DW$3, DW_AT_name("mailbox")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("mailbox")
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$118)
	.dwattr $C$DW$3, DW_AT_declaration
	.dwattr $C$DW$3, DW_AT_external
	.dwattr $C$DW$3, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$3, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$3, DW_AT_decl_column(0x1f)

$C$DW$4	.dwtag  DW_TAG_variable
	.dwattr $C$DW$4, DW_AT_name("buslatches")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("buslatches")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$120)
	.dwattr $C$DW$4, DW_AT_declaration
	.dwattr $C$DW$4, DW_AT_external
	.dwattr $C$DW$4, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$4, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$4, DW_AT_decl_column(0x15)

$C$DW$5	.dwtag  DW_TAG_variable
	.dwattr $C$DW$5, DW_AT_name("sm_arb")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("sm_arb")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$122)
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
	.dwattr $C$DW$5, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$5, DW_AT_decl_line(0x29)
	.dwattr $C$DW$5, DW_AT_decl_column(0x23)

$C$DW$6	.dwtag  DW_TAG_variable
	.dwattr $C$DW$6, DW_AT_name("sm_dma")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("sm_dma")
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$124)
	.dwattr $C$DW$6, DW_AT_declaration
	.dwattr $C$DW$6, DW_AT_external
	.dwattr $C$DW$6, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$6, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$6, DW_AT_decl_column(0x1b)

$C$DW$7	.dwtag  DW_TAG_variable
	.dwattr $C$DW$7, DW_AT_name("sm_intr")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("sm_intr")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$124)
	.dwattr $C$DW$7, DW_AT_declaration
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_decl_file("pru1_statemachine_intr.h")
	.dwattr $C$DW$7, DW_AT_decl_line(0x26)
	.dwattr $C$DW$7, DW_AT_decl_column(0x1b)

$C$DW$8	.dwtag  DW_TAG_variable
	.dwattr $C$DW$8, DW_AT_name("sm_slave")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("sm_slave")
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$126)
	.dwattr $C$DW$8, DW_AT_declaration
	.dwattr $C$DW$8, DW_AT_external
	.dwattr $C$DW$8, DW_AT_decl_file("pru1_statemachine_slave.h")
	.dwattr $C$DW$8, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$8, DW_AT_decl_column(0x1d)

$C$DW$9	.dwtag  DW_TAG_variable
	.dwattr $C$DW$9, DW_AT_name("sm_init")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("sm_init")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$128)
	.dwattr $C$DW$9, DW_AT_declaration
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_decl_file("pru1_statemachine_init.h")
	.dwattr $C$DW$9, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$9, DW_AT_decl_column(0x1c)

$C$DW$10	.dwtag  DW_TAG_variable
	.dwattr $C$DW$10, DW_AT_name("sm_powercycle")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("sm_powercycle")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$10, DW_AT_declaration
	.dwattr $C$DW$10, DW_AT_external
	.dwattr $C$DW$10, DW_AT_decl_file("pru1_statemachine_powercycle.h")
	.dwattr $C$DW$10, DW_AT_decl_line(0x29)
	.dwattr $C$DW$10, DW_AT_decl_column(0x22)


$C$DW$11	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$11, DW_AT_name("buslatches_reset")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("buslatches_reset")
	.dwattr $C$DW$11, DW_AT_declaration
	.dwattr $C$DW$11, DW_AT_external
	.dwattr $C$DW$11, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$11, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$11, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$11


$C$DW$12	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$12, DW_AT_name("buslatches_powercycle")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("buslatches_powercycle")
	.dwattr $C$DW$12, DW_AT_declaration
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$12, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$12, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$12


$C$DW$13	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$13, DW_AT_name("sm_slave_start")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("sm_slave_start")
	.dwattr $C$DW$13, DW_AT_declaration
	.dwattr $C$DW$13, DW_AT_external
	.dwattr $C$DW$13, DW_AT_decl_file("pru1_statemachine_slave.h")
	.dwattr $C$DW$13, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$13, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$13


$C$DW$14	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$14, DW_AT_name("do_event_initializationsignals")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("do_event_initializationsignals")
	.dwattr $C$DW$14, DW_AT_declaration
	.dwattr $C$DW$14, DW_AT_external
	.dwattr $C$DW$14, DW_AT_decl_file("pru1_statemachine_init.h")
	.dwattr $C$DW$14, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$14, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$14


$C$DW$15	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$15, DW_AT_name("sm_arb_state_idle")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("sm_arb_state_idle")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$15, DW_AT_declaration
	.dwattr $C$DW$15, DW_AT_external
	.dwattr $C$DW$15, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$15, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$15, DW_AT_decl_column(0x09)
	.dwendtag $C$DW$15


$C$DW$16	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$16, DW_AT_name("sm_arb_start")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("sm_arb_start")
	.dwattr $C$DW$16, DW_AT_declaration
	.dwattr $C$DW$16, DW_AT_external
	.dwattr $C$DW$16, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$16, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$16, DW_AT_decl_column(0x06)
$C$DW$17	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$39)

	.dwendtag $C$DW$16


$C$DW$18	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$18, DW_AT_name("sm_dma_start")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("sm_dma_start")
	.dwattr $C$DW$18, DW_AT_declaration
	.dwattr $C$DW$18, DW_AT_external
	.dwattr $C$DW$18, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$18, DW_AT_decl_line(0x33)
	.dwattr $C$DW$18, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$18


$C$DW$19	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$19, DW_AT_name("sm_intr_start")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("sm_intr_start")
	.dwattr $C$DW$19, DW_AT_declaration
	.dwattr $C$DW$19, DW_AT_external
	.dwattr $C$DW$19, DW_AT_decl_file("pru1_statemachine_intr.h")
	.dwattr $C$DW$19, DW_AT_decl_line(0x29)
	.dwattr $C$DW$19, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$19


$C$DW$20	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$20, DW_AT_name("sm_init_start")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("sm_init_start")
	.dwattr $C$DW$20, DW_AT_declaration
	.dwattr $C$DW$20, DW_AT_external
	.dwattr $C$DW$20, DW_AT_decl_file("pru1_statemachine_init.h")
	.dwattr $C$DW$20, DW_AT_decl_line(0x31)
	.dwattr $C$DW$20, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$20


$C$DW$21	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$21, DW_AT_name("sm_powercycle_start")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("sm_powercycle_start")
	.dwattr $C$DW$21, DW_AT_declaration
	.dwattr $C$DW$21, DW_AT_external
	.dwattr $C$DW$21, DW_AT_decl_file("pru1_statemachine_powercycle.h")
	.dwattr $C$DW$21, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$21, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$21


$C$DW$22	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$22, DW_AT_name("iopageregisters_init")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("iopageregisters_init")
	.dwattr $C$DW$22, DW_AT_declaration
	.dwattr $C$DW$22, DW_AT_external
	.dwattr $C$DW$22, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$22, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$22, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$22


$C$DW$23	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$23, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("buslatches_pru0_dataout")
	.dwattr $C$DW$23, DW_AT_declaration
	.dwattr $C$DW$23, DW_AT_external
	.dwattr $C$DW$23, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$23, DW_AT_decl_line(0xba)
	.dwattr $C$DW$23, DW_AT_decl_column(0x06)
$C$DW$24	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$32)

	.dwendtag $C$DW$23


$C$DW$25	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$25, DW_AT_name("buslatches_test")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("buslatches_test")
	.dwattr $C$DW$25, DW_AT_declaration
	.dwattr $C$DW$25, DW_AT_external
	.dwattr $C$DW$25, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$25, DW_AT_decl_line(0xbd)
	.dwattr $C$DW$25, DW_AT_decl_column(0x06)
$C$DW$26	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$39)

$C$DW$27	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$39)

$C$DW$28	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$39)

$C$DW$29	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$39)

	.dwendtag $C$DW$25


$C$DW$30	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$30, DW_AT_name("ddrmem_fill_pattern")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("ddrmem_fill_pattern")
	.dwattr $C$DW$30, DW_AT_declaration
	.dwattr $C$DW$30, DW_AT_external
	.dwattr $C$DW$30, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$30, DW_AT_decl_line(0x52)
	.dwattr $C$DW$30, DW_AT_decl_column(0x06)
	.dwendtag $C$DW$30


$C$DW$31	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$31, DW_AT_name("__delay_cycles")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("__delay_cycles")
	.dwattr $C$DW$31, DW_AT_declaration
	.dwattr $C$DW$31, DW_AT_external
$C$DW$32	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$11)

	.dwendtag $C$DW$31


$C$DW$33	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$33, DW_AT_name("__halt")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("__halt")
	.dwattr $C$DW$33, DW_AT_declaration
	.dwattr $C$DW$33, DW_AT_external
	.dwendtag $C$DW$33

;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/optpru --gen_opt_info=2 /tmp/TI1k8HIV8Pt /tmp/TI1k87pWfdL --opt_info_filename=/home/joerg/retrocmp/dec/UniBone/10.01_base/4_deploy/pru1_main.nfo 
;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/acpiapru -@/tmp/TI1k8Wx6v1J 
	.sect	".text:main"
	.clink
	.global	||main||

$C$DW$34	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$34, DW_AT_name("main")
	.dwattr $C$DW$34, DW_AT_low_pc(||main||)
	.dwattr $C$DW$34, DW_AT_high_pc(0x00)
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("main")
	.dwattr $C$DW$34, DW_AT_external
	.dwattr $C$DW$34, DW_AT_TI_begin_file("pru1_main.c")
	.dwattr $C$DW$34, DW_AT_TI_begin_line(0xb0)
	.dwattr $C$DW$34, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$34, DW_AT_decl_file("pru1_main.c")
	.dwattr $C$DW$34, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$34, DW_AT_decl_column(0x06)
	.dwattr $C$DW$34, DW_AT_TI_max_frame_size(0x37)
	.dwpsn	file "pru1_main.c",line 176,column 17,is_stmt,address ||main||,isa 0

	.dwfde $C$DW$CIE, ||main||
;----------------------------------------------------------------------
; 176 | void main(void) {                                                      
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: main                          FR SIZE:  55           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           13 Auto, 42 SOE     *
;***************************************************************

||main||:
;* --------------------------------------------------------------------------*
;* r12_0 assigned to $O$C1
$C$DW$35	.dwtag  DW_TAG_variable
	.dwattr $C$DW$35, DW_AT_name("$O$C1")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$35, DW_AT_location[DW_OP_regx 0x30]

;* r0_0  assigned to $O$C2
$C$DW$36	.dwtag  DW_TAG_variable
	.dwattr $C$DW$36, DW_AT_name("$O$C2")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$36, DW_AT_location[DW_OP_reg0]

;* r0_0  assigned to $O$C3
$C$DW$37	.dwtag  DW_TAG_variable
	.dwattr $C$DW$37, DW_AT_name("$O$C3")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$37, DW_AT_location[DW_OP_reg0]

;* r0_0  assigned to $O$C4
$C$DW$38	.dwtag  DW_TAG_variable
	.dwattr $C$DW$38, DW_AT_name("$O$C4")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("$O$C4")
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$38, DW_AT_location[DW_OP_reg0]

;* r12_0 assigned to $O$C5
$C$DW$39	.dwtag  DW_TAG_variable
	.dwattr $C$DW$39, DW_AT_name("$O$C5")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("$O$C5")
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$146)
	.dwattr $C$DW$39, DW_AT_location[DW_OP_regx 0x30]

;* r6_0  assigned to $O$C6
$C$DW$40	.dwtag  DW_TAG_variable
	.dwattr $C$DW$40, DW_AT_name("$O$C6")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("$O$C6")
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$40, DW_AT_location[DW_OP_reg24]

;* r4_0  assigned to $O$C7
$C$DW$41	.dwtag  DW_TAG_variable
	.dwattr $C$DW$41, DW_AT_name("$O$C7")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("$O$C7")
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$116)
	.dwattr $C$DW$41, DW_AT_location[DW_OP_reg16]

;* r5_0  assigned to $O$C8
$C$DW$42	.dwtag  DW_TAG_variable
	.dwattr $C$DW$42, DW_AT_name("$O$C8")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("$O$C8")
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$42, DW_AT_location[DW_OP_reg20]

;* r4_0  assigned to $O$K7
$C$DW$43	.dwtag  DW_TAG_variable
	.dwattr $C$DW$43, DW_AT_name("$O$K7")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("$O$K7")
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$116)
	.dwattr $C$DW$43, DW_AT_location[DW_OP_reg16]

;* r7_0  assigned to $O$K17
$C$DW$44	.dwtag  DW_TAG_variable
	.dwattr $C$DW$44, DW_AT_name("$O$K17")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("$O$K17")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$125)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_reg28]

;* r5_0  assigned to $O$K5
$C$DW$45	.dwtag  DW_TAG_variable
	.dwattr $C$DW$45, DW_AT_name("$O$K5")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("$O$K5")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg20]

;* r10_0 assigned to $O$K23
$C$DW$46	.dwtag  DW_TAG_variable
	.dwattr $C$DW$46, DW_AT_name("$O$K23")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("$O$K23")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$123)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_regx 0x28]

;* r8_0  assigned to $O$K48
$C$DW$47	.dwtag  DW_TAG_variable
	.dwattr $C$DW$47, DW_AT_name("$O$K48")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("$O$K48")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$146)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_regx 0x20]

;* r9_0  assigned to $O$K68
$C$DW$48	.dwtag  DW_TAG_variable
	.dwattr $C$DW$48, DW_AT_name("$O$K68")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("$O$K68")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$121)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_regx 0x24]

$C$DW$49	.dwtag  DW_TAG_variable
	.dwattr $C$DW$49, DW_AT_name("$O$K72")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("$O$K72")
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$123)
	.dwattr $C$DW$49, DW_AT_location[DW_OP_breg8 1]

$C$DW$50	.dwtag  DW_TAG_variable
	.dwattr $C$DW$50, DW_AT_name("$O$K76")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("$O$K76")
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$50, DW_AT_location[DW_OP_breg8 5]

$C$DW$51	.dwtag  DW_TAG_variable
	.dwattr $C$DW$51, DW_AT_name("$O$K82")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("$O$K82")
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$129)
	.dwattr $C$DW$51, DW_AT_location[DW_OP_breg8 9]

;* r11_0 assigned to $O$K87
$C$DW$52	.dwtag  DW_TAG_variable
	.dwattr $C$DW$52, DW_AT_name("$O$K87")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("$O$K87")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$127)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_regx 0x2c]

;* r6_1  assigned to reg_sel
$C$DW$53	.dwtag  DW_TAG_variable
	.dwattr $C$DW$53, DW_AT_name("reg_sel")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("reg_sel")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg25]

;* r1_0  assigned to bitmask
$C$DW$54	.dwtag  DW_TAG_variable
	.dwattr $C$DW$54, DW_AT_name("bitmask")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("bitmask")
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$54, DW_AT_location[DW_OP_reg4]

;* r0_0  assigned to val
$C$DW$55	.dwtag  DW_TAG_variable
	.dwattr $C$DW$55, DW_AT_name("val")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$55, DW_AT_location[DW_OP_reg0]

;* r6_0  assigned to _tmpval
$C$DW$56	.dwtag  DW_TAG_variable
	.dwattr $C$DW$56, DW_AT_name("_tmpval")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$56, DW_AT_location[DW_OP_reg24]

;* r1_0  assigned to reg_sel
$C$DW$57	.dwtag  DW_TAG_variable
	.dwattr $C$DW$57, DW_AT_name("reg_sel")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("reg_sel")
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$57, DW_AT_location[DW_OP_reg4]

$C$DW$58	.dwtag  DW_TAG_variable
	.dwattr $C$DW$58, DW_AT_name("_tmpval")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$58, DW_AT_location[DW_OP_breg8 0]

;* r12_0 assigned to _tmpval
$C$DW$59	.dwtag  DW_TAG_variable
	.dwattr $C$DW$59, DW_AT_name("_tmpval")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("_tmpval")
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$59, DW_AT_location[DW_OP_regx 0x30]

	.dwcfi	cfa_offset, 0
;*** 179	-----------------------    *(&CT_CFG+4) &= 0xffffffefu;
;*** 182	-----------------------    iopageregisters_init();
;*** 184	-----------------------    buslatches_reset();
;*** 187	-----------------------    (*(C$7 = &mailbox)).arm2pru_req = K$5 = 0u;
;*** 188	-----------------------    (*C$7).events.eventmask = C$8 = (unsigned char)K$5;
;*** 189	-----------------------    (*C$7).events.initialization_signals_prev = C$8;
;*** 190	-----------------------    (*C$7).events.initialization_signals_cur = C$8;
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
;***  	-----------------------    K$76 = 12u;
;***  	-----------------------    K$87 = &sm_init;
;***  	-----------------------    K$82 = &sm_powercycle;
;***  	-----------------------    K$72 = &sm_intr;
;***  	-----------------------    K$68 = &sm_arb;
;***  	-----------------------    K$48 = &buslatches;
;***  	-----------------------    K$23 = &sm_dma;
;***  	-----------------------    K$17 = &sm_slave;
;*** 187	-----------------------    K$7 = C$7;
;***  	-----------------------    goto g45;
        SUB       r2, r2, 0x37          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 55
	.dwpsn	file "pru1_main.c",line 179,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 179 | CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;                                    
; 181 | // clear all tables, as backup if ARM fails todo                       
;----------------------------------------------------------------------
        LBCO      &r0, __PRU_CREG_PRU_CFG, $CSBREL(||CT_CFG||+4), 4 ; [ALU_PRU] |179| CT_CFG
        SBBO      &r3.b2, r2, 13, 42    ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -42
	.dwcfi	save_reg_to_mem, 15, -41
	.dwcfi	save_reg_to_mem, 16, -40
	.dwcfi	save_reg_to_mem, 17, -39
	.dwcfi	save_reg_to_mem, 18, -38
	.dwcfi	save_reg_to_mem, 19, -37
	.dwcfi	save_reg_to_mem, 20, -36
	.dwcfi	save_reg_to_mem, 21, -35
	.dwcfi	save_reg_to_mem, 22, -34
	.dwcfi	save_reg_to_mem, 23, -33
	.dwcfi	save_reg_to_mem, 24, -32
	.dwcfi	save_reg_to_mem, 25, -31
	.dwcfi	save_reg_to_mem, 26, -30
	.dwcfi	save_reg_to_mem, 27, -29
	.dwcfi	save_reg_to_mem, 28, -28
	.dwcfi	save_reg_to_mem, 29, -27
	.dwcfi	save_reg_to_mem, 30, -26
	.dwcfi	save_reg_to_mem, 31, -25
	.dwcfi	save_reg_to_mem, 32, -24
	.dwcfi	save_reg_to_mem, 33, -23
	.dwcfi	save_reg_to_mem, 34, -22
	.dwcfi	save_reg_to_mem, 35, -21
	.dwcfi	save_reg_to_mem, 36, -20
	.dwcfi	save_reg_to_mem, 37, -19
	.dwcfi	save_reg_to_mem, 38, -18
	.dwcfi	save_reg_to_mem, 39, -17
	.dwcfi	save_reg_to_mem, 40, -16
	.dwcfi	save_reg_to_mem, 41, -15
	.dwcfi	save_reg_to_mem, 42, -14
	.dwcfi	save_reg_to_mem, 43, -13
	.dwcfi	save_reg_to_mem, 44, -12
	.dwcfi	save_reg_to_mem, 45, -11
	.dwcfi	save_reg_to_mem, 46, -10
	.dwcfi	save_reg_to_mem, 47, -9
	.dwcfi	save_reg_to_mem, 48, -8
	.dwcfi	save_reg_to_mem, 49, -7
	.dwcfi	save_reg_to_mem, 50, -6
	.dwcfi	save_reg_to_mem, 51, -5
	.dwcfi	save_reg_to_mem, 52, -4
	.dwcfi	save_reg_to_mem, 53, -3
	.dwcfi	save_reg_to_mem, 54, -2
	.dwcfi	save_reg_to_mem, 55, -1
        CLR       r0, r0, 0x00000004    ; [ALU_PRU] |179| 
        SBCO      &r0, __PRU_CREG_PRU_CFG, $CSBREL(||CT_CFG||+4), 4 ; [ALU_PRU] |179| CT_CFG
	.dwpsn	file "pru1_main.c",line 182,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 182 | iopageregisters_init();                                                
;----------------------------------------------------------------------
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_name("iopageregisters_init")
	.dwattr $C$DW$60, DW_AT_TI_call

        JAL       r3.w2, ||iopageregisters_init|| ; [ALU_PRU] |182| iopageregisters_init
	.dwpsn	file "pru1_main.c",line 184,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 184 | buslatches_reset(); // all deasserted                                  
; 186 | // init mailbox                                                        
;----------------------------------------------------------------------
$C$DW$61	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$61, DW_AT_low_pc(0x00)
	.dwattr $C$DW$61, DW_AT_name("buslatches_reset")
	.dwattr $C$DW$61, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_reset|| ; [ALU_PRU] |184| buslatches_reset
	.dwpsn	file "pru1_main.c",line 187,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 187 | mailbox.arm2pru_req = ARM2PRU_NONE;                                    
;----------------------------------------------------------------------
        ZERO      &r5, 4                ; [ALU_PRU] |187| $O$K5
        LDI32     r4, ||mailbox||       ; [ALU_PRU] |187| $O$C7,mailbox
        LDI       r11, ||sm_init||      ; [ALU_PRU] $O$K87,sm_init
        LDI       r9, ||sm_arb||        ; [ALU_PRU] $O$K68,sm_arb
        LDI       r8, ||buslatches||    ; [ALU_PRU] $O$K48,buslatches
        LDI       r10, ||sm_dma||       ; [ALU_PRU] $O$K23,sm_dma
        LDI       r7, ||sm_slave||      ; [ALU_PRU] $O$K17,sm_slave
        LDI       r0, 0x000c            ; [ALU_PRU] $O$K76
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |187| $O$C7,$O$K5
	.dwpsn	file "pru1_main.c",line 188,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 188 | mailbox.events.eventmask = 0;                                          
;----------------------------------------------------------------------
        SBBO      &r5.b0, r4, 12, 1     ; [ALU_PRU] |188| $O$C7,$O$C8
	.dwpsn	file "pru1_main.c",line 189,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 189 | mailbox.events.initialization_signals_prev = 0;                        
;----------------------------------------------------------------------
        SBBO      &r5.b0, r4, 22, 1     ; [ALU_PRU] |189| $O$C7,$O$C8
	.dwpsn	file "pru1_main.c",line 190,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 190 | mailbox.events.initialization_signals_cur = 0;                         
; 192 | while (1) {                                                            
; 193 |         // display opcode (active for one cycle                        
; 194 | //              __R30 = (mailbox.arm2pru_req & 0xf) << 8;              
; 207 |         switch (mailbox.arm2pru_req) {                                 
; 208 |         case ARM2PRU_NONE: // == 0                                     
; 209 |                 // reloop                                              
; 210 |                 break;                                                 
; 211 |         case ARM2PRU_HALT:                                             
; 212 |                 __halt(); // that's it                                 
; 213 |                 break;                                                 
; 214 | #ifdef USED                                                            
; 215 |         case ARM2PRU_MAILBOXTEST1:                                     
; 216 |                 // simulate a register read access.                    
; 217 | #ifdef TEST_TIMEOUT                                                    
; 218 |                 while (1) {                                            
; 219 |                         // toggle with REGSEL_0    = PRU1_8            
; 220 |                         __R30 |= (1 << 8);                             
; 221 |                         // buslatches_setbits(1, BIT(6), BIT(6)) ;     
; 222 |                         TIMEOUT_SET(NANOSECS(1000));// 1 usec / level  
; 223 |                         while (!TIMEOUT_REACHED);                      
; 224 |                         __R30 &= ~(1 << 8);                            
; 225 |                         //buslatches_setbits(1, BIT(6), 0) ;           
; 226 |                         TIMEOUT_SET(NANOSECS(1000));                   
; 227 |                         while (!TIMEOUT_REACHED);                      
; 229 | #endif                                                                 
; 231 |                 // show on REG_DATAOUT                                 
; 232 |                 buslatches_pru0_dataout(mailbox.mailbox_test.addr);    
; 233 |                 // pru_pru_mailbox.pru0_r30 = mailbox.mailbox_test.addr
;     |  & 0xff;                                                               
; 234 |                 // __R30 = (mailbox.mailbox_test.addr & 0xf) << 8;     
; 235 |                 mailbox.mailbox_test.val = mailbox.mailbox_test.addr;  
; 236 |                 __R30 = (mailbox.arm2pru_req & 0xf) << 8; // optical AC
;     | K                                                                      
; 237 |                 mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done       
; 238 |                 break;                                                 
; 239 | #endif                                                                 
; 240 |         case ARM2PRU_BUSLATCH_INIT: // set all mux registers to "neutra
;     | l"                                                                     
; 241 |                 buslatches_reset();                                    
; 242 |                 mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done       
; 243 |                 break;                                                 
; 245 |         case ARM2PRU_BUSLATCH_SET: { // set a mux register             
; 247 |                 // don't feed "volatile" vars into buslatch_macros !!! 
;----------------------------------------------------------------------
        SBBO      &r5.b0, r4, 23, 1     ; [ALU_PRU] |190| $O$C7,$O$C8
        SBBO      &r0, r2, 5, 4         ; [ALU_PRU] $C$SP2,$O$K76
        LDI       r0, ||sm_powercycle|| ; [ALU_PRU] $O$K82,sm_powercycle
        SBBO      &r0, r2, 9, 4         ; [ALU_PRU] $C$SP3,$O$K82
        LDI       r0, ||sm_intr||       ; [ALU_PRU] $O$K72,sm_intr
        SBBO      &r0, r2, 1, 4         ; [ALU_PRU] $C$SP1,$O$K72
        JMP       ||$C$L33||            ; [ALU_PRU] 
;* --------------------------------------------------------------------------*
||$C$L1||:    
;***	-----------------------g2:
;*** 248	-----------------------    reg_sel = (*K$7).$P$T14.buslatch.addr&7u;
;*** 249	-----------------------    bitmask = (*K$7).$P$T14.buslatch.bitmask;
;*** 250	-----------------------    val = (*K$7).$P$T14.buslatch.val;
;*** 252	-----------------------    if ( reg_sel == 2 || reg_sel == 3 || (reg_sel == 6 || reg_sel == 7) ) goto g4;
	.dwpsn	file "pru1_main.c",line 248,column 20,is_stmt,isa 0
;----------------------------------------------------------------------
; 248 | uint8_t reg_sel = mailbox.buslatch.addr & 7;                           
;----------------------------------------------------------------------
        LBBO      &r0, r4, 24, 4        ; [ALU_PRU] |248| $O$K7
        AND       r6.b1, r0.b0, 0x07    ; [ALU_PRU] |248| reg_sel
	.dwpsn	file "pru1_main.c",line 249,column 20,is_stmt,isa 0
;----------------------------------------------------------------------
; 249 | uint8_t bitmask = mailbox.buslatch.bitmask;                            
;----------------------------------------------------------------------
        LBBO      &r1, r4, 28, 4        ; [ALU_PRU] |249| $O$K7
	.dwpsn	file "pru1_main.c",line 250,column 16,is_stmt,isa 0
;----------------------------------------------------------------------
; 250 | uint8_t val = mailbox.buslatch.val;                                    
; 251 | //buslatches.cur_reg_sel = 0xff; // force new setting of reg_sel       
;----------------------------------------------------------------------
        LBBO      &r0, r4, 32, 4        ; [ALU_PRU] |250| $O$K7
	.dwpsn	file "pru1_main.c",line 252,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 252 | if (BUSLATCH_REG_IS_BYTE(reg_sel))                                     
; 253 |         buslatches_setbyte(reg_sel, val);                              
; 254 | else                                                                   
;----------------------------------------------------------------------
        QBEQ      ||$C$L2||, r6.b1, 0x02 ; [ALU_PRU] |252| reg_sel
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L2||, r6.b1, 0x03 ; [ALU_PRU] |252| reg_sel
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L2||, r6.b1, 0x06 ; [ALU_PRU] |252| reg_sel
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L2||, r6.b1, 0x07 ; [ALU_PRU] |252| reg_sel
;* --------------------------------------------------------------------------*
;*** 255	-----------------------    C$5 = &K$48[reg_sel];
;*** 255	-----------------------    _tmpval = C$6 = (unsigned char)(*C$5&(bitmask^0xff)|val&bitmask);
;*** 255	-----------------------    buslatches_pru0_dataout((unsigned)C$6);
;*** 255	-----------------------    __R30 = C$4 = (int)reg_sel<<8;
;*** 255	-----------------------    *C$5 = _tmpval;
;*** 255	-----------------------    __delay_cycles(4u);
;*** 255	-----------------------    __R30 = (unsigned)C$4|0x800u;
;*** 255	-----------------------    goto g39;
	.dwpsn	file "pru1_main.c",line 255,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 255 | buslatches_setbits(reg_sel, bitmask, val);                             
; 256 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 257 | break;                                                                 
; 259 | case ARM2PRU_BUSLATCH_GET: {                                           
; 260 | // don't feed "volatile" vars into buslatch_macros !!!                 
; 261 | uint8_t reg_sel = mailbox.buslatch.addr & 7;                           
; 262 | // buslatches.cur_reg_sel = 0xff; // force new setting of reg_sel      
; 263 | mailbox.buslatch.val = buslatches_get(reg_sel);                        
; 264 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 265 | break;                                                                 
; 267 | case ARM2PRU_BUSLATCH_TEST: {                                          
; 268 | buslatches_test(mailbox.buslatch_test.addr_0_7, mailbox.buslatch_test.a
;     | ddr_8_15,                                                              
; 269 |         mailbox.buslatch_test.data_0_7, mailbox.buslatch_test.data_8_15
;     | );                                                                     
; 270 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 271 | break;                                                                 
; 273 | case ARM2PRU_INITPULSE: // generate a pulse on UNIBUS INIT             
; 274 | // INIT: latch[7], bit 3                                               
; 275 | buslatches_setbits(7, BIT(3), BIT(3)); // assert INIT                  
; 276 | __delay_cycles(MILLISECS(250)); // INIT is 250ms                       
; 277 | buslatches_setbits(7, BIT(3), 0); // deassert INIT                     
; 278 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 279 | break;                                                                 
; 281 | case ARM2PRU_POWERCYCLE: // do ACLO/DCLO power cycle                   
; 282 | buslatches_powercycle();                                               
; 283 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 284 | break;                                                                 
; 285 | case ARM2PRU_DMA:                                                      
; 286 | sm_dma_start(); // without NPR/NPG arbitration                         
; 287 | // simply call current state function, until stopped                   
; 288 | // parallel the BUS-slave statemachine is triggered                    
; 289 | // by master logic.                                                    
; 290 | while (!sm_dma.state())                                                
; 291 | ;                                                                      
; 292 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 293 | break;                                                                 
; 294 | case ARM2PRU_DDR_FILL_PATTERN:                                         
; 295 | ddrmem_fill_pattern();                                                 
; 296 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 297 | break;                                                                 
; 298 | case ARM2PRU_DDR_SLAVE_MEMORY:                                         
; 299 | // respond to UNIBUS cycles as slave and                               
; 300 | // access DDR as UNIBUS memory.                                        
; 302 | // only debugging: all signals deasserted                              
;----------------------------------------------------------------------
        ADD       r12, r8, r6.b1        ; [ALU_PRU] |255| $O$C5,$O$K48,reg_sel
        XOR       r0.b1, r1.b0, 0xff    ; [ALU_PRU] |255| bitmask
        AND       r0.b0, r0.b0, r1.b0   ; [ALU_PRU] |255| val,bitmask
        LBBO      &r0.b2, r12, 0, 1     ; [ALU_PRU] |255| $O$C5
        AND       r0.b1, r0.b2, r0.b1   ; [ALU_PRU] |255| 
        OR        r6.b0, r0.b1, r0.b0   ; [ALU_PRU] |255| $O$C6
        MOV       r14, r6.b0            ; [ALU_PRU] |255| $O$C6
$C$DW$62	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$62, DW_AT_low_pc(0x00)
	.dwattr $C$DW$62, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$62, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |255| buslatches_pru0_dataout
        LSL       r0, r6.b1, 0x08       ; [ALU_PRU] |255| $O$C4,reg_sel
        SBBO      &r6.b0, r12, 0, 1     ; [ALU_PRU] |255| $O$C5,_tmpval
        MOV       r30, r0               ; [ALU_PRU] |255| $O$C4
        .newblock
        LDI32    r13, 1
$1:     SUB      r13, r13, 1
        QBNE     $1, r13, 0            ; [ALU_PRU] |255| 
        SET       r30, r0, 0x0000000b   ; [ALU_PRU] |255| $O$C4
        JMP       ||$C$L27||            ; [ALU_PRU] |255| 
;* --------------------------------------------------------------------------*
||$C$L2||:    
;***	-----------------------g4:
;*** 253	-----------------------    buslatches_pru0_dataout((unsigned)val);
;*** 253	-----------------------    __R30 = C$3 = (int)reg_sel<<8;
;*** 253	-----------------------    __delay_cycles(6u);
;*** 253	-----------------------    __R30 = (unsigned)C$3|0x800u;
;*** 253	-----------------------    goto g39;
	.dwpsn	file "pru1_main.c",line 253,column 5,is_stmt,isa 0
        MOV       r14, r0.b0            ; [ALU_PRU] |253| val
$C$DW$63	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$63, DW_AT_low_pc(0x00)
	.dwattr $C$DW$63, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$63, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |253| buslatches_pru0_dataout
        LSL       r0, r6.b1, 0x08       ; [ALU_PRU] |253| $O$C3,reg_sel
        MOV       r30, r0               ; [ALU_PRU] |253| $O$C3
        .newblock
        LDI32    r6, 2
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |253| 
        SET       r30, r0, 0x0000000b   ; [ALU_PRU] |253| $O$C3
        JMP       ||$C$L27||            ; [ALU_PRU] |253| 
;* --------------------------------------------------------------------------*
||$C$L3||:    
;***	-----------------------g5:
;*** 64	-----------------------    buslatches_reset();  // [0]
;*** 69	-----------------------    buslatches_powercycle();  // [0]
;*** 70	-----------------------    __delay_cycles(0x1312d00u);  // [0]
;*** 79	-----------------------    sm_slave_start();  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5376u)
;*** 81	-----------------------    goto g29;  // [0]
	.dwpsn	file "pru1_main.c",line 64,column 2,is_stmt,isa 0
$C$DW$64	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$64, DW_AT_low_pc(0x00)
	.dwattr $C$DW$64, DW_AT_name("buslatches_reset")
	.dwattr $C$DW$64, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_reset|| ; [ALU_PRU] |64| buslatches_reset
	.dwpsn	file "pru1_main.c",line 69,column 2,is_stmt,isa 0
$C$DW$65	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$65, DW_AT_low_pc(0x00)
	.dwattr $C$DW$65, DW_AT_name("buslatches_powercycle")
	.dwattr $C$DW$65, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_powercycle|| ; [ALU_PRU] |69| buslatches_powercycle
	.dwpsn	file "pru1_main.c",line 70,column 2,is_stmt,isa 0
        .newblock
        LDI32    r6, 9999999
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |70| 
	.dwpsn	file "pru1_main.c",line 79,column 2,is_stmt,isa 0
$C$DW$66	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$66, DW_AT_low_pc(0x00)
	.dwattr $C$DW$66, DW_AT_name("sm_slave_start")
	.dwattr $C$DW$66, DW_AT_TI_call

        JAL       r3.w2, ||sm_slave_start|| ; [ALU_PRU] |79| sm_slave_start
	.dwpsn	file "pru1_main.c",line 81,column 9,is_stmt,isa 0
        JMP       ||$C$L20||            ; [ALU_PRU] |81| 
;* --------------------------------------------------------------------------*
||$C$L4||:    
;***	-----------------------g6:
;*** 136	-----------------------    sm_arb_start((*K$7).$P$T14.intr.priority_bit);  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 136,column 4,is_stmt,isa 0
        LBBO      &r14.b0, r4, 26, 1    ; [ALU_PRU] |136| $O$K7
$C$DW$67	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$67, DW_AT_low_pc(0x00)
	.dwattr $C$DW$67, DW_AT_name("sm_arb_start")
	.dwattr $C$DW$67, DW_AT_TI_call

        JAL       r3.w2, ||sm_arb_start|| ; [ALU_PRU] |136| sm_arb_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L5||
;*
;*   Loop source line                : 139
;*   Loop closing brace source line  : 144
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L5||:    
;***	-----------------------g7:
;*** 139	-----------------------    if ( (*(*K$68).state)() ) goto g10;  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 139,column 11,is_stmt,isa 0
        LBBO      &r0.w0, r9, 0, 2      ; [ALU_PRU] |139| $O$K68
$C$DW$68	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$68, DW_AT_low_pc(0x00)
	.dwattr $C$DW$68, DW_AT_TI_call
	.dwattr $C$DW$68, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |139| 
        QBNE      ||$C$L7||, r14.b0, 0x00 ; [ALU_PRU] |139| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L6||
;*
;*   Loop source line                : 142
;*   Loop closing brace source line  : 143
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L6||:    
;***	-----------------------g9:
;*** 142	-----------------------    if ( (*(*K$17).state)() ) goto g7;  // [0]
	.dwpsn	file "pru1_main.c",line 142,column 12,is_stmt,isa 0
        LBBO      &r0.w0, r7, 0, 2      ; [ALU_PRU] |142| $O$K17
$C$DW$69	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$69, DW_AT_low_pc(0x00)
	.dwattr $C$DW$69, DW_AT_TI_call
	.dwattr $C$DW$69, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |142| 
        QBNE      ||$C$L5||, r14.b0, 0x00 ; [ALU_PRU] |142| 
;* --------------------------------------------------------------------------*
;*** 142	-----------------------    goto g9;  // [0]
        JMP       ||$C$L6||             ; [ALU_PRU] |142| 
;* --------------------------------------------------------------------------*
||$C$L7||:    
;***	-----------------------g10:
;*** 146	-----------------------    sm_intr_start();  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 146,column 4,is_stmt,isa 0
$C$DW$70	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$70, DW_AT_low_pc(0x00)
	.dwattr $C$DW$70, DW_AT_name("sm_intr_start")
	.dwattr $C$DW$70, DW_AT_TI_call

        JAL       r3.w2, ||sm_intr_start|| ; [ALU_PRU] |146| sm_intr_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L8||
;*
;*   Loop source line                : 147
;*   Loop closing brace source line  : 148
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L8||:    
;***	-----------------------g11:
;*** 147	-----------------------    if ( !(*(*K$72).state)() ) goto g11;  // [0]
        LBBO      &r0, r2, 1, 4         ; [ALU_PRU] $O$K72,$C$SP1
	.dwpsn	file "pru1_main.c",line 147,column 11,is_stmt,isa 0
        LBBO      &r0.w0, r0, 0, 2      ; [ALU_PRU] |147| $O$K72
$C$DW$71	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$71, DW_AT_low_pc(0x00)
	.dwattr $C$DW$71, DW_AT_TI_call
	.dwattr $C$DW$71, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |147| 
        QBEQ      ||$C$L8||, r14.b0, 0x00 ; [ALU_PRU] |147| 
;* --------------------------------------------------------------------------*
;*** 147	-----------------------    goto g28;  // [0]
        JMP       ||$C$L19||            ; [ALU_PRU] |147| 
;* --------------------------------------------------------------------------*
||$C$L9||:    
;***	-----------------------g12:
;*** 101	-----------------------    sm_arb_state_idle();  // [0]
;*** 104	-----------------------    goto g29;  // [0]
	.dwpsn	file "pru1_main.c",line 101,column 4,is_stmt,isa 0
$C$DW$72	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$72, DW_AT_low_pc(0x00)
	.dwattr $C$DW$72, DW_AT_name("sm_arb_state_idle")
	.dwattr $C$DW$72, DW_AT_TI_call

        JAL       r3.w2, ||sm_arb_state_idle|| ; [ALU_PRU] |101| sm_arb_state_idle
	.dwpsn	file "pru1_main.c",line 104,column 4,is_stmt,isa 0
        JMP       ||$C$L20||            ; [ALU_PRU] |104| 
;* --------------------------------------------------------------------------*
||$C$L10||:    
;***	-----------------------g13:
;*** 111	-----------------------    sm_arb_start(16u);  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 111,column 4,is_stmt,isa 0
        LDI       r14.b0, 0x10          ; [ALU_PRU] |111| 
$C$DW$73	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$73, DW_AT_low_pc(0x00)
	.dwattr $C$DW$73, DW_AT_name("sm_arb_start")
	.dwattr $C$DW$73, DW_AT_TI_call

        JAL       r3.w2, ||sm_arb_start|| ; [ALU_PRU] |111| sm_arb_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L11||
;*
;*   Loop source line                : 112
;*   Loop closing brace source line  : 117
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L11||:    
;***	-----------------------g14:
;*** 112	-----------------------    if ( (*(*K$68).state)() ) goto g17;  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 112,column 11,is_stmt,isa 0
        LBBO      &r0.w0, r9, 0, 2      ; [ALU_PRU] |112| $O$K68
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_TI_call
	.dwattr $C$DW$74, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |112| 
        QBNE      ||$C$L13||, r14.b0, 0x00 ; [ALU_PRU] |112| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L12||
;*
;*   Loop source line                : 115
;*   Loop closing brace source line  : 116
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L12||:    
;***	-----------------------g16:
;*** 115	-----------------------    if ( (*(*K$17).state)() ) goto g14;  // [0]
	.dwpsn	file "pru1_main.c",line 115,column 12,is_stmt,isa 0
        LBBO      &r0.w0, r7, 0, 2      ; [ALU_PRU] |115| $O$K17
$C$DW$75	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$75, DW_AT_low_pc(0x00)
	.dwattr $C$DW$75, DW_AT_TI_call
	.dwattr $C$DW$75, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |115| 
        QBNE      ||$C$L11||, r14.b0, 0x00 ; [ALU_PRU] |115| 
;* --------------------------------------------------------------------------*
;*** 115	-----------------------    goto g16;  // [0]
        JMP       ||$C$L12||            ; [ALU_PRU] |115| 
;* --------------------------------------------------------------------------*
||$C$L13||:    
;***	-----------------------g17:
;*** 122	-----------------------    sm_dma_start();  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 122,column 4,is_stmt,isa 0
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_name("sm_dma_start")
	.dwattr $C$DW$76, DW_AT_TI_call

        JAL       r3.w2, ||sm_dma_start|| ; [ALU_PRU] |122| sm_dma_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L14||
;*
;*   Loop source line                : 124
;*   Loop closing brace source line  : 126
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L14||:    
;***	-----------------------g18:
;*** 124	-----------------------    if ( !(*(*K$23).state)() ) goto g18;  // [0]
	.dwpsn	file "pru1_main.c",line 124,column 11,is_stmt,isa 0
        LBBO      &r0.w0, r10, 0, 2     ; [ALU_PRU] |124| $O$K23
$C$DW$77	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$77, DW_AT_low_pc(0x00)
	.dwattr $C$DW$77, DW_AT_TI_call
	.dwattr $C$DW$77, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |124| 
        QBEQ      ||$C$L14||, r14.b0, 0x00 ; [ALU_PRU] |124| 
;* --------------------------------------------------------------------------*
;*** 129	-----------------------    if ( (*K$7).arm2pru_req == 9u ) goto g28;  // [0]
	.dwpsn	file "pru1_main.c",line 129,column 4,is_stmt,isa 0
        LBBO      &r0, r4, 0, 4         ; [ALU_PRU] |129| $O$K7
        QBEQ      ||$C$L19||, r0, 0x09  ; [ALU_PRU] |129| 
;* --------------------------------------------------------------------------*
;*** 129	-----------------------    goto g29;  // [0]
        JMP       ||$C$L20||            ; [ALU_PRU] |129| 
;* --------------------------------------------------------------------------*
||$C$L15||:    
;***	-----------------------g20:
;*** 163	-----------------------    sm_slave_start();  // [0]
;*** 164	-----------------------    sm_powercycle_start();  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
;***	-----------------------g21:
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 163,column 4,is_stmt,isa 0
$C$DW$78	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$78, DW_AT_low_pc(0x00)
	.dwattr $C$DW$78, DW_AT_name("sm_slave_start")
	.dwattr $C$DW$78, DW_AT_TI_call

        JAL       r3.w2, ||sm_slave_start|| ; [ALU_PRU] |163| sm_slave_start
	.dwpsn	file "pru1_main.c",line 164,column 4,is_stmt,isa 0
$C$DW$79	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$79, DW_AT_low_pc(0x00)
	.dwattr $C$DW$79, DW_AT_name("sm_powercycle_start")
	.dwattr $C$DW$79, DW_AT_TI_call

        JAL       r3.w2, ||sm_powercycle_start|| ; [ALU_PRU] |164| sm_powercycle_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L16||
;*
;*   Loop source line                : 165
;*   Loop closing brace source line  : 166
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L16||:    
;***	-----------------------g22:
;*** 165	-----------------------    if ( !(*(*K$17).state)() ) goto g22;  // [0]
	.dwpsn	file "pru1_main.c",line 165,column 11,is_stmt,isa 0
        LBBO      &r0.w0, r7, 0, 2      ; [ALU_PRU] |165| $O$K17
$C$DW$80	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$80, DW_AT_low_pc(0x00)
	.dwattr $C$DW$80, DW_AT_TI_call
	.dwattr $C$DW$80, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |165| 
        QBEQ      ||$C$L16||, r14.b0, 0x00 ; [ALU_PRU] |165| 
;* --------------------------------------------------------------------------*
;*** 165	-----------------------    if ( !(*(*K$82).state)() ) goto g21;  // [0]
        LBBO      &r0, r2, 9, 4         ; [ALU_PRU] $O$K82,$C$SP3
        LBBO      &r0.w0, r0, 0, 2      ; [ALU_PRU] |165| $O$K82
$C$DW$81	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$81, DW_AT_low_pc(0x00)
	.dwattr $C$DW$81, DW_AT_TI_call
	.dwattr $C$DW$81, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |165| 
        QBEQ      ||$C$L16||, r14.b0, 0x00 ; [ALU_PRU] |165| 
;* --------------------------------------------------------------------------*
;*** 165	-----------------------    goto g28;  // [0]
        JMP       ||$C$L19||            ; [ALU_PRU] |165| 
;* --------------------------------------------------------------------------*
||$C$L17||:    
;***	-----------------------g24:
;*** 153	-----------------------    sm_slave_start();  // [0]
;*** 154	-----------------------    sm_init_start();  // [0]
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
;***	-----------------------g25:
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 153,column 4,is_stmt,isa 0
$C$DW$82	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$82, DW_AT_low_pc(0x00)
	.dwattr $C$DW$82, DW_AT_name("sm_slave_start")
	.dwattr $C$DW$82, DW_AT_TI_call

        JAL       r3.w2, ||sm_slave_start|| ; [ALU_PRU] |153| sm_slave_start
	.dwpsn	file "pru1_main.c",line 154,column 4,is_stmt,isa 0
$C$DW$83	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$83, DW_AT_low_pc(0x00)
	.dwattr $C$DW$83, DW_AT_name("sm_init_start")
	.dwattr $C$DW$83, DW_AT_TI_call

        JAL       r3.w2, ||sm_init_start|| ; [ALU_PRU] |154| sm_init_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L18||
;*
;*   Loop source line                : 155
;*   Loop closing brace source line  : 156
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L18||:    
;***	-----------------------g26:
;*** 155	-----------------------    if ( !(*(*K$17).state)() ) goto g26;  // [0]
	.dwpsn	file "pru1_main.c",line 155,column 11,is_stmt,isa 0
        LBBO      &r0.w0, r7, 0, 2      ; [ALU_PRU] |155| $O$K17
$C$DW$84	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$84, DW_AT_low_pc(0x00)
	.dwattr $C$DW$84, DW_AT_TI_call
	.dwattr $C$DW$84, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |155| 
        QBEQ      ||$C$L18||, r14.b0, 0x00 ; [ALU_PRU] |155| 
;* --------------------------------------------------------------------------*
;*** 155	-----------------------    if ( !(*(*K$87).state)() ) goto g25;  // [0]
        LBBO      &r0.w0, r11, 0, 2     ; [ALU_PRU] |155| $O$K87
$C$DW$85	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$85, DW_AT_low_pc(0x00)
	.dwattr $C$DW$85, DW_AT_TI_call
	.dwattr $C$DW$85, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |155| 
        QBEQ      ||$C$L18||, r14.b0, 0x00 ; [ALU_PRU] |155| 
;* --------------------------------------------------------------------------*
||$C$L19||:    
;***	-----------------------g28:
;*** 157	-----------------------    (*K$7).arm2pru_req = K$76;  // [0]
;***	-----------------------g29:
;***	-----------------------g29:
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
        LBBO      &r0, r2, 5, 4         ; [ALU_PRU] $O$K76,$C$SP2
	.dwpsn	file "pru1_main.c",line 157,column 4,is_stmt,isa 0
        SBBO      &r0, r4, 0, 4         ; [ALU_PRU] |157| $O$K7,$O$K76
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L20||
;*
;*   Loop source line                : 86
;*   Loop closing brace source line  : 87
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L20||:    
;***	-----------------------g30:
;*** 86	-----------------------    if ( !(*(*K$17).state)() ) goto g30;  // [0]
	.dwpsn	file "pru1_main.c",line 86,column 10,is_stmt,isa 0
        LBBO      &r0.w0, r7, 0, 2      ; [ALU_PRU] |86| $O$K17
$C$DW$86	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$86, DW_AT_low_pc(0x00)
	.dwattr $C$DW$86, DW_AT_TI_call
	.dwattr $C$DW$86, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |86| 
        QBEQ      ||$C$L20||, r14.b0, 0x00 ; [ALU_PRU] |86| 
;* --------------------------------------------------------------------------*
;*** 91	-----------------------    do_event_initializationsignals();  // [0]
;*** 94	-----------------------    switch ( (*K$7).arm2pru_req ) {case 7u: goto g24;, case 8u: goto g20;, case 9u: goto g13;, case 12u: goto g12;, case 13u: goto g39;, case 14u: goto g6;, DEFAULT goto g29};  // [0]
	.dwpsn	file "pru1_main.c",line 91,column 3,is_stmt,isa 0
$C$DW$87	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$87, DW_AT_low_pc(0x00)
	.dwattr $C$DW$87, DW_AT_name("do_event_initializationsignals")
	.dwattr $C$DW$87, DW_AT_TI_call

        JAL       r3.w2, ||do_event_initializationsignals|| ; [ALU_PRU] |91| do_event_initializationsignals
	.dwpsn	file "pru1_main.c",line 94,column 3,is_stmt,isa 0
        LBBO      &r0, r4, 0, 4         ; [ALU_PRU] |94| $O$K7
        QBEQ      ||$C$L17||, r0, 0x07  ; [ALU_PRU] |94| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L15||, r0, 0x08  ; [ALU_PRU] |94| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L10||, r0, 0x09  ; [ALU_PRU] |94| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L9||, r0, 0x0c   ; [ALU_PRU] |94| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L27||, r0, 0x0d  ; [ALU_PRU] |94| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L4||, r0, 0x0e   ; [ALU_PRU] |94| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L20||            ; [ALU_PRU] |94| 
;* --------------------------------------------------------------------------*
||$C$L21||:    
;***	-----------------------g32:
;*** 303	-----------------------    buslatches_reset();
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 303,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 303 | buslatches_reset();                                                    
; 305 | // do UNIBUS slave cycles, until ARM abort this by                     
; 306 | // writing into mailbox.arm2pru_req                                    
;----------------------------------------------------------------------
$C$DW$88	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$88, DW_AT_low_pc(0x00)
	.dwattr $C$DW$88, DW_AT_name("buslatches_reset")
	.dwattr $C$DW$88, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_reset|| ; [ALU_PRU] |303| buslatches_reset
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L22||
;*
;*   Loop source line                : 307
;*   Loop closing brace source line  : 312
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L22||:    
;***	-----------------------g33:
;*** 307	-----------------------    if ( (*K$7).arm2pru_req != 11u ) goto g39;
	.dwpsn	file "pru1_main.c",line 307,column 11,is_stmt,isa 0
;----------------------------------------------------------------------
; 307 | while (mailbox.arm2pru_req == ARM2PRU_DDR_SLAVE_MEMORY) {              
;----------------------------------------------------------------------
        LBBO      &r0, r4, 0, 4         ; [ALU_PRU] |307| $O$K7
        QBNE      ||$C$L27||, r0, 0x0b  ; [ALU_PRU] |307| 
;* --------------------------------------------------------------------------*
;*** 308	-----------------------    sm_slave_start();
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 308,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 308 | sm_slave_start();                                                      
; 309 | // do all states of an access, start when MSYN found.                  
;----------------------------------------------------------------------
$C$DW$89	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$89, DW_AT_low_pc(0x00)
	.dwattr $C$DW$89, DW_AT_name("sm_slave_start")
	.dwattr $C$DW$89, DW_AT_TI_call

        JAL       r3.w2, ||sm_slave_start|| ; [ALU_PRU] |308| sm_slave_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L23||
;*
;*   Loop source line                : 310
;*   Loop closing brace source line  : 311
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L23||:    
;***	-----------------------g35:
;*** 310	-----------------------    if ( (*(*K$17).state)() ) goto g33;
	.dwpsn	file "pru1_main.c",line 310,column 12,is_stmt,isa 0
;----------------------------------------------------------------------
; 310 | while (!sm_slave.state())                                              
; 311 |         ;                                                              
; 313 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
; 314 | break;                                                                 
; 315 | case ARM2PRU_EMULATION:                                                
; 317 | state_emulation();                                                     
;----------------------------------------------------------------------
        LBBO      &r0.w0, r7, 0, 2      ; [ALU_PRU] |310| $O$K17
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_TI_call
	.dwattr $C$DW$90, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |310| 
        QBNE      ||$C$L22||, r14.b0, 0x00 ; [ALU_PRU] |310| 
;* --------------------------------------------------------------------------*
;*** 310	-----------------------    goto g35;
        JMP       ||$C$L23||            ; [ALU_PRU] |310| 
;* --------------------------------------------------------------------------*
||$C$L24||:    
;***	-----------------------g36:
;*** 295	-----------------------    ddrmem_fill_pattern();
;*** 296	-----------------------    (*K$7).arm2pru_req = K$5;
;*** 297	-----------------------    goto g45;
	.dwpsn	file "pru1_main.c",line 295,column 4,is_stmt,isa 0
$C$DW$91	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$91, DW_AT_low_pc(0x00)
	.dwattr $C$DW$91, DW_AT_name("ddrmem_fill_pattern")
	.dwattr $C$DW$91, DW_AT_TI_call

        JAL       r3.w2, ||ddrmem_fill_pattern|| ; [ALU_PRU] |295| ddrmem_fill_pattern
	.dwpsn	file "pru1_main.c",line 296,column 4,is_stmt,isa 0
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |296| $O$K7,$O$K5
	.dwpsn	file "pru1_main.c",line 297,column 4,is_stmt,isa 0
        JMP       ||$C$L33||            ; [ALU_PRU] |297| 
;* --------------------------------------------------------------------------*
||$C$L25||:    
;***	-----------------------g37:
;*** 286	-----------------------    sm_dma_start();
;***  	-----------------------    #pragma LOOP_FLAGS(5120u)
	.dwpsn	file "pru1_main.c",line 286,column 4,is_stmt,isa 0
$C$DW$92	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$92, DW_AT_low_pc(0x00)
	.dwattr $C$DW$92, DW_AT_name("sm_dma_start")
	.dwattr $C$DW$92, DW_AT_TI_call

        JAL       r3.w2, ||sm_dma_start|| ; [ALU_PRU] |286| sm_dma_start
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L26||
;*
;*   Loop source line                : 290
;*   Loop closing brace source line  : 291
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L26||:    
;***	-----------------------g38:
;*** 290	-----------------------    if ( !(*(*K$23).state)() ) goto g38;
	.dwpsn	file "pru1_main.c",line 290,column 11,is_stmt,isa 0
        LBBO      &r0.w0, r10, 0, 2     ; [ALU_PRU] |290| $O$K23
$C$DW$93	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$93, DW_AT_low_pc(0x00)
	.dwattr $C$DW$93, DW_AT_TI_call
	.dwattr $C$DW$93, DW_AT_TI_indirect

        JAL       r3.w2, r0.w0          ; [ALU_PRU] |290| 
        QBEQ      ||$C$L26||, r14.b0, 0x00 ; [ALU_PRU] |290| 
;* --------------------------------------------------------------------------*
||$C$L27||:    
;***	-----------------------g39:
;*** 318	-----------------------    (*K$7).arm2pru_req = K$5;
;*** 319	-----------------------    goto g45;
	.dwpsn	file "pru1_main.c",line 318,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 318 | mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done                       
;----------------------------------------------------------------------
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |318| $O$K7,$O$K5
	.dwpsn	file "pru1_main.c",line 319,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 319 | break;                                                                 
; 320 | } // switch                                                            
; 321 | } // while                                                             
;----------------------------------------------------------------------
        JMP       ||$C$L33||            ; [ALU_PRU] |319| 
;* --------------------------------------------------------------------------*
||$C$L28||:    
;***	-----------------------g40:
;*** 282	-----------------------    buslatches_powercycle();
;*** 283	-----------------------    (*K$7).arm2pru_req = K$5;
;*** 284	-----------------------    goto g45;
	.dwpsn	file "pru1_main.c",line 282,column 4,is_stmt,isa 0
$C$DW$94	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$94, DW_AT_low_pc(0x00)
	.dwattr $C$DW$94, DW_AT_name("buslatches_powercycle")
	.dwattr $C$DW$94, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_powercycle|| ; [ALU_PRU] |282| buslatches_powercycle
	.dwpsn	file "pru1_main.c",line 283,column 4,is_stmt,isa 0
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |283| $O$K7,$O$K5
	.dwpsn	file "pru1_main.c",line 284,column 4,is_stmt,isa 0
        JMP       ||$C$L33||            ; [ALU_PRU] |284| 
;* --------------------------------------------------------------------------*
||$C$L29||:    
;***	-----------------------g41:
;*** 275	-----------------------    _tmpval = C$2 = (unsigned char)(K$48[7]|0x8);
;*** 275	-----------------------    buslatches_pru0_dataout((unsigned)C$2);
;*** 275	-----------------------    __R30 = 1792u;
;*** 275	-----------------------    K$48[7] = _tmpval;
;*** 275	-----------------------    __delay_cycles(4u);
;*** 275	-----------------------    __R30 = 3840u;
;*** 276	-----------------------    __delay_cycles(0x2faf080u);
;*** 277	-----------------------    _tmpval = C$1 = (unsigned char)(K$48[7]&0xf7);
;*** 277	-----------------------    buslatches_pru0_dataout((unsigned)C$1);
;*** 277	-----------------------    __R30 = 1792u;
;*** 277	-----------------------    K$48[7] = _tmpval;
;*** 277	-----------------------    __delay_cycles(4u);
;*** 277	-----------------------    __R30 = 3840u;
;*** 278	-----------------------    (*K$7).arm2pru_req = K$5;
;*** 279	-----------------------    goto g45;
	.dwpsn	file "pru1_main.c",line 275,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r8, 7, 1      ; [ALU_PRU] |275| $O$K48
        SET       r0.b0, r0.b0, 0x00000003 ; [ALU_PRU] |275| $O$C2
        MOV       r14, r0.b0            ; [ALU_PRU] |275| $O$C2
        SBBO      &r0.b0, r2, 0, 1      ; [ALU_PRU] |275| $C$SP0,_tmpval
$C$DW$95	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$95, DW_AT_low_pc(0x00)
	.dwattr $C$DW$95, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$95, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |275| buslatches_pru0_dataout
        LDI       r30, 0x0700           ; [ALU_PRU] |275| 
        LBBO      &r0.b0, r2, 0, 1      ; [ALU_PRU] _tmpval,$C$SP0
        SBBO      &r0.b0, r8, 7, 1      ; [ALU_PRU] |275| $O$K48,_tmpval
        .newblock
        LDI32    r13, 1
$1:     SUB      r13, r13, 1
        QBNE     $1, r13, 0            ; [ALU_PRU] |275| 
        LDI       r30, 0x0f00           ; [ALU_PRU] |275| 
	.dwpsn	file "pru1_main.c",line 276,column 4,is_stmt,isa 0
        .newblock
        LDI32    r12, 24999999
$1:     SUB      r12, r12, 1
        QBNE     $1, r12, 0            ; [ALU_PRU] |276| 
	.dwpsn	file "pru1_main.c",line 277,column 4,is_stmt,isa 0
        LBBO      &r0.b0, r8, 7, 1      ; [ALU_PRU] |277| $O$K48
        AND       r12.b0, r0.b0, 0xf7   ; [ALU_PRU] |277| $O$C1
        MOV       r14, r12.b0           ; [ALU_PRU] |277| $O$C1
$C$DW$96	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$96, DW_AT_low_pc(0x00)
	.dwattr $C$DW$96, DW_AT_name("buslatches_pru0_dataout")
	.dwattr $C$DW$96, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_pru0_dataout|| ; [ALU_PRU] |277| buslatches_pru0_dataout
        SBBO      &r12.b0, r8, 7, 1     ; [ALU_PRU] |277| $O$K48,_tmpval
        LDI       r30, 0x0700           ; [ALU_PRU] |277| 
        .newblock
        LDI32    r6, 1
$1:     SUB      r6, r6, 1
        QBNE     $1, r6, 0             ; [ALU_PRU] |277| 
        LDI       r30, 0x0f00           ; [ALU_PRU] |277| 
	.dwpsn	file "pru1_main.c",line 278,column 5,is_stmt,isa 0
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |278| $O$K7,$O$K5
	.dwpsn	file "pru1_main.c",line 279,column 4,is_stmt,isa 0
        JMP       ||$C$L33||            ; [ALU_PRU] |279| 
;* --------------------------------------------------------------------------*
||$C$L30||:    
;***	-----------------------g42:
;*** 268	-----------------------    buslatches_test((*K$7).$P$T14.buslatch_test.addr_0_7, (*K$7).$P$T14.buslatch_test.addr_8_15, (*K$7).$P$T14.buslatch_test.data_0_7, (*K$7).$P$T14.buslatch_test.data_8_15);
;*** 270	-----------------------    (*K$7).arm2pru_req = K$5;
;*** 271	-----------------------    goto g45;
	.dwpsn	file "pru1_main.c",line 268,column 4,is_stmt,isa 0
        LBBO      &r14.b0, r4, 24, 1    ; [ALU_PRU] |268| $O$K7
        LBBO      &r14.b1, r4, 25, 1    ; [ALU_PRU] |268| $O$K7
        LBBO      &r14.b2, r4, 26, 1    ; [ALU_PRU] |268| $O$K7
        LBBO      &r14.b3, r4, 27, 1    ; [ALU_PRU] |268| $O$K7
$C$DW$97	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$97, DW_AT_low_pc(0x00)
	.dwattr $C$DW$97, DW_AT_name("buslatches_test")
	.dwattr $C$DW$97, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_test|| ; [ALU_PRU] |268| buslatches_test
	.dwpsn	file "pru1_main.c",line 270,column 4,is_stmt,isa 0
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |270| $O$K7,$O$K5
	.dwpsn	file "pru1_main.c",line 271,column 4,is_stmt,isa 0
        JMP       ||$C$L33||            ; [ALU_PRU] |271| 
;* --------------------------------------------------------------------------*
||$C$L31||:    
;***	-----------------------g43:
;*** 261	-----------------------    reg_sel = (*K$7).$P$T14.buslatch.addr&7u;
;*** 263	-----------------------    __R30 = (unsigned)((int)reg_sel<<8)|0x800u;
;*** 263	-----------------------    __delay_cycles(10u);
;*** 263	-----------------------    (*K$7).$P$T14.buslatch.val = __R31&0xffu;
;*** 264	-----------------------    (*K$7).arm2pru_req = K$5;
;*** 265	-----------------------    goto g45;
	.dwpsn	file "pru1_main.c",line 261,column 20,is_stmt,isa 0
        LBBO      &r1, r4, 24, 4        ; [ALU_PRU] |261| $O$K7
        AND       r1.b0, r1.b0, 0x07    ; [ALU_PRU] |261| reg_sel
	.dwpsn	file "pru1_main.c",line 263,column 4,is_stmt,isa 0
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |263| reg_sel
        SET       r30, r1, 0x0000000b   ; [ALU_PRU] |263| 
        .newblock
        LDI32    r0, 4
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |263| 
        AND       r0, r31, 0xff         ; [ALU_PRU] |263| 
        SBBO      &r0, r4, 32, 4        ; [ALU_PRU] |263| $O$K7
	.dwpsn	file "pru1_main.c",line 264,column 4,is_stmt,isa 0
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |264| $O$K7,$O$K5
	.dwpsn	file "pru1_main.c",line 265,column 4,is_stmt,isa 0
        JMP       ||$C$L33||            ; [ALU_PRU] |265| 
;* --------------------------------------------------------------------------*
||$C$L32||:    
;***	-----------------------g44:
;*** 241	-----------------------    buslatches_reset();
;*** 242	-----------------------    (*K$7).arm2pru_req = K$5;
	.dwpsn	file "pru1_main.c",line 241,column 4,is_stmt,isa 0
$C$DW$98	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$98, DW_AT_low_pc(0x00)
	.dwattr $C$DW$98, DW_AT_name("buslatches_reset")
	.dwattr $C$DW$98, DW_AT_TI_call

        JAL       r3.w2, ||buslatches_reset|| ; [ALU_PRU] |241| buslatches_reset
	.dwpsn	file "pru1_main.c",line 242,column 4,is_stmt,isa 0
        SBBO      &r5, r4, 0, 4         ; [ALU_PRU] |242| $O$K7,$O$K5
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L33||
;* --------------------------------------------------------------------------*
||$C$L33||:    
;***	-----------------------g45:
;***	-----------------------g45:
;*** 207	-----------------------    switch ( (*K$7).arm2pru_req ) {case 1u: goto g46;, case 3u: goto g44;, case 4u: goto g2;, case 5u: goto g43;, case 6u: goto g42;, case 7u: goto g41;, case 8u: goto g40;, case 9u: goto g37;, case 10u: goto g36;, case 11u: goto g32;, case 12u: goto g5;, DEFAULT goto g45};
	.dwpsn	file "pru1_main.c",line 207,column 3,is_stmt,isa 0
        LBBO      &r0, r4, 0, 4         ; [ALU_PRU] |207| $O$K7
        QBEQ      ||$C$L34||, r0, 0x01  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L32||, r0, 0x03  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L1||, r0, 0x04   ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L31||, r0, 0x05  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L30||, r0, 0x06  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L29||, r0, 0x07  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L28||, r0, 0x08  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L25||, r0, 0x09  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L24||, r0, 0x0a  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L21||, r0, 0x0b  ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        QBEQ      ||$C$L3||, r0, 0x0c   ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L33||            ; [ALU_PRU] |207| 
;* --------------------------------------------------------------------------*
||$C$L34||:    
;***	-----------------------g46:
;*** 212	-----------------------    __halt();
;*** 213	-----------------------    goto g45;
	.dwpsn	file "pru1_main.c",line 212,column 4,is_stmt,isa 0
        HALT      ; [ALU_PRU] |212| 
	.dwpsn	file "pru1_main.c",line 213,column 4,is_stmt,isa 0
        JMP       ||$C$L33||            ; [ALU_PRU] |213| 
;* --------------------------------------------------------------------------*
	.dwattr $C$DW$34, DW_AT_TI_end_file("pru1_main.c")
	.dwattr $C$DW$34, DW_AT_TI_end_line(0x142)
	.dwattr $C$DW$34, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$34

;* Inlined function references:
;* [0] state_emulation
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||mailbox||
	.global	||buslatches||
	.global	||sm_arb||
	.global	||sm_dma||
	.global	||sm_intr||
	.global	||sm_slave||
	.global	||sm_init||
	.global	||sm_powercycle||
	.global	||buslatches_reset||
	.global	||buslatches_powercycle||
	.global	||sm_slave_start||
	.global	||do_event_initializationsignals||
	.global	||sm_arb_state_idle||
	.global	||sm_arb_start||
	.global	||sm_dma_start||
	.global	||sm_intr_start||
	.global	||sm_init_start||
	.global	||sm_powercycle_start||
	.global	||iopageregisters_init||
	.global	||buslatches_pru0_dataout||
	.global	||buslatches_test||
	.global	||ddrmem_fill_pattern||

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x04)
$C$DW$99	.dwtag  DW_TAG_member
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$99, DW_AT_name("REVID")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$99, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$99, DW_AT_bit_size(0x20)
	.dwattr $C$DW$99, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$99, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$99, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$99, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$99, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$19, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$19

$C$DW$T$69	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$69, DW_AT_type(*$C$DW$T$19)


$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x04)
$C$DW$100	.dwtag  DW_TAG_member
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$100, DW_AT_name("IDLE_MODE")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("IDLE_MODE")
	.dwattr $C$DW$100, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$100, DW_AT_bit_size(0x02)
	.dwattr $C$DW$100, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$100, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$100, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$100, DW_AT_decl_line(0x37)
	.dwattr $C$DW$100, DW_AT_decl_column(0x0d)

$C$DW$101	.dwtag  DW_TAG_member
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$101, DW_AT_name("STANDBY_MODE")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("STANDBY_MODE")
	.dwattr $C$DW$101, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$101, DW_AT_bit_size(0x02)
	.dwattr $C$DW$101, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$101, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$101, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$101, DW_AT_decl_line(0x38)
	.dwattr $C$DW$101, DW_AT_decl_column(0x0d)

$C$DW$102	.dwtag  DW_TAG_member
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$102, DW_AT_name("STANDBY_INIT")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("STANDBY_INIT")
	.dwattr $C$DW$102, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$102, DW_AT_bit_size(0x01)
	.dwattr $C$DW$102, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$102, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$102, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$102, DW_AT_decl_line(0x39)
	.dwattr $C$DW$102, DW_AT_decl_column(0x0d)

$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$103, DW_AT_name("SUB_MWAIT")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("SUB_MWAIT")
	.dwattr $C$DW$103, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$103, DW_AT_bit_size(0x01)
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$103, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$103, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$103, DW_AT_decl_column(0x0d)

$C$DW$104	.dwtag  DW_TAG_member
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$104, DW_AT_name("rsvd6")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("rsvd6")
	.dwattr $C$DW$104, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$104, DW_AT_bit_size(0x1a)
	.dwattr $C$DW$104, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$104, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$104, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$104, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$20, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$20

$C$DW$T$71	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$71, DW_AT_type(*$C$DW$T$20)


$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x04)
$C$DW$105	.dwtag  DW_TAG_member
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$105, DW_AT_name("PRU0_GPI_MODE")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("PRU0_GPI_MODE")
	.dwattr $C$DW$105, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$105, DW_AT_bit_size(0x02)
	.dwattr $C$DW$105, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$105, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$105, DW_AT_decl_line(0x45)
	.dwattr $C$DW$105, DW_AT_decl_column(0x0d)

$C$DW$106	.dwtag  DW_TAG_member
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$106, DW_AT_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$106, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$106, DW_AT_bit_size(0x01)
	.dwattr $C$DW$106, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$106, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$106, DW_AT_decl_line(0x46)
	.dwattr $C$DW$106, DW_AT_decl_column(0x0d)

$C$DW$107	.dwtag  DW_TAG_member
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$107, DW_AT_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$107, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$107, DW_AT_bit_size(0x05)
	.dwattr $C$DW$107, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$107, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$107, DW_AT_decl_line(0x47)
	.dwattr $C$DW$107, DW_AT_decl_column(0x0d)

$C$DW$108	.dwtag  DW_TAG_member
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$108, DW_AT_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$108, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$108, DW_AT_bit_size(0x05)
	.dwattr $C$DW$108, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$108, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$108, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$108, DW_AT_decl_line(0x48)
	.dwattr $C$DW$108, DW_AT_decl_column(0x0d)

$C$DW$109	.dwtag  DW_TAG_member
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$109, DW_AT_name("PRU0_GPI_SB")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("PRU0_GPI_SB")
	.dwattr $C$DW$109, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$109, DW_AT_bit_size(0x01)
	.dwattr $C$DW$109, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$109, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$109, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$109, DW_AT_decl_line(0x49)
	.dwattr $C$DW$109, DW_AT_decl_column(0x0d)

$C$DW$110	.dwtag  DW_TAG_member
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$110, DW_AT_name("PRU0_GPO_MODE")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("PRU0_GPO_MODE")
	.dwattr $C$DW$110, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$110, DW_AT_bit_size(0x01)
	.dwattr $C$DW$110, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$110, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$110, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$110, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$110, DW_AT_decl_column(0x0d)

$C$DW$111	.dwtag  DW_TAG_member
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$111, DW_AT_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$111, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$111, DW_AT_bit_size(0x05)
	.dwattr $C$DW$111, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$111, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$111, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$111, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$111, DW_AT_decl_column(0x0d)

$C$DW$112	.dwtag  DW_TAG_member
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$112, DW_AT_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$112, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$112, DW_AT_bit_size(0x05)
	.dwattr $C$DW$112, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$112, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$112, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$112, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$112, DW_AT_decl_column(0x0d)

$C$DW$113	.dwtag  DW_TAG_member
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$113, DW_AT_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$113, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$113, DW_AT_bit_size(0x01)
	.dwattr $C$DW$113, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$113, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$113, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$113, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$113, DW_AT_decl_column(0x0d)

$C$DW$114	.dwtag  DW_TAG_member
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$114, DW_AT_name("rsvd26")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$114, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$114, DW_AT_bit_size(0x06)
	.dwattr $C$DW$114, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$114, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$114, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$114, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$114, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$21, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$21

$C$DW$T$73	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$73, DW_AT_type(*$C$DW$T$21)


$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x04)
$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$115, DW_AT_name("PRU1_GPI_MODE")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("PRU1_GPI_MODE")
	.dwattr $C$DW$115, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$115, DW_AT_bit_size(0x02)
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$115, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$115, DW_AT_decl_line(0x58)
	.dwattr $C$DW$115, DW_AT_decl_column(0x0d)

$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$116, DW_AT_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$116, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$116, DW_AT_bit_size(0x01)
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$116, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$116, DW_AT_decl_line(0x59)
	.dwattr $C$DW$116, DW_AT_decl_column(0x0d)

$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$117, DW_AT_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$117, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$117, DW_AT_bit_size(0x05)
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$117, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$117, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$117, DW_AT_decl_column(0x0d)

$C$DW$118	.dwtag  DW_TAG_member
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$118, DW_AT_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$118, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$118, DW_AT_bit_size(0x05)
	.dwattr $C$DW$118, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$118, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$118, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$118, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$118, DW_AT_decl_column(0x0d)

$C$DW$119	.dwtag  DW_TAG_member
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$119, DW_AT_name("PRU1_GPI_SB")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("PRU1_GPI_SB")
	.dwattr $C$DW$119, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$119, DW_AT_bit_size(0x01)
	.dwattr $C$DW$119, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$119, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$119, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$119, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$119, DW_AT_decl_column(0x0d)

$C$DW$120	.dwtag  DW_TAG_member
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$120, DW_AT_name("PRU1_GPO_MODE")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("PRU1_GPO_MODE")
	.dwattr $C$DW$120, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$120, DW_AT_bit_size(0x01)
	.dwattr $C$DW$120, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$120, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$120, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$120, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$120, DW_AT_decl_column(0x0d)

$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$121, DW_AT_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$121, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$121, DW_AT_bit_size(0x05)
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$121, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$121, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$121, DW_AT_decl_column(0x0d)

$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$122, DW_AT_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$122, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$122, DW_AT_bit_size(0x05)
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$122, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$122, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$122, DW_AT_decl_column(0x0d)

$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$123, DW_AT_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$123, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$123, DW_AT_bit_size(0x01)
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$123, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$123, DW_AT_decl_line(0x60)
	.dwattr $C$DW$123, DW_AT_decl_column(0x0d)

$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$124, DW_AT_name("rsvd26")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$124, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$124, DW_AT_bit_size(0x06)
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$124, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$124, DW_AT_decl_line(0x61)
	.dwattr $C$DW$124, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$22, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$22

$C$DW$T$75	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$75, DW_AT_type(*$C$DW$T$22)


$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x04)
$C$DW$125	.dwtag  DW_TAG_member
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$125, DW_AT_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$125, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$125, DW_AT_bit_size(0x01)
	.dwattr $C$DW$125, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$125, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$125, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$125, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$125, DW_AT_decl_column(0x0d)

$C$DW$126	.dwtag  DW_TAG_member
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$126, DW_AT_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$126, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$126, DW_AT_bit_size(0x01)
	.dwattr $C$DW$126, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$126, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$126, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$126, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$126, DW_AT_decl_column(0x0d)

$C$DW$127	.dwtag  DW_TAG_member
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$127, DW_AT_name("PRU0_CLK_EN")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("PRU0_CLK_EN")
	.dwattr $C$DW$127, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$127, DW_AT_bit_size(0x01)
	.dwattr $C$DW$127, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$127, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$127, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$127, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$127, DW_AT_decl_column(0x0d)

$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$128, DW_AT_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$128, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$128, DW_AT_bit_size(0x01)
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$128, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$128, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$128, DW_AT_decl_column(0x0d)

$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$129, DW_AT_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$129, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$129, DW_AT_bit_size(0x01)
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$129, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$129, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$129, DW_AT_decl_column(0x0d)

$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$130, DW_AT_name("PRU1_CLK_EN")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("PRU1_CLK_EN")
	.dwattr $C$DW$130, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$130, DW_AT_bit_size(0x01)
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$130, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$130, DW_AT_decl_line(0x70)
	.dwattr $C$DW$130, DW_AT_decl_column(0x0d)

$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$131, DW_AT_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$131, DW_AT_bit_offset(0x19)
	.dwattr $C$DW$131, DW_AT_bit_size(0x01)
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$131, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$131, DW_AT_decl_line(0x71)
	.dwattr $C$DW$131, DW_AT_decl_column(0x0d)

$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$132, DW_AT_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$132, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$132, DW_AT_bit_size(0x01)
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$132, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$132, DW_AT_decl_line(0x72)
	.dwattr $C$DW$132, DW_AT_decl_column(0x0d)

$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$133, DW_AT_name("INTC_CLK_EN")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("INTC_CLK_EN")
	.dwattr $C$DW$133, DW_AT_bit_offset(0x17)
	.dwattr $C$DW$133, DW_AT_bit_size(0x01)
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$133, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$133, DW_AT_decl_line(0x73)
	.dwattr $C$DW$133, DW_AT_decl_column(0x0d)

$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$134, DW_AT_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$134, DW_AT_bit_offset(0x16)
	.dwattr $C$DW$134, DW_AT_bit_size(0x01)
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$134, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$134, DW_AT_decl_line(0x74)
	.dwattr $C$DW$134, DW_AT_decl_column(0x0d)

$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$135, DW_AT_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$135, DW_AT_bit_offset(0x15)
	.dwattr $C$DW$135, DW_AT_bit_size(0x01)
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$135, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$135, DW_AT_decl_line(0x75)
	.dwattr $C$DW$135, DW_AT_decl_column(0x0d)

$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$136, DW_AT_name("UART_CLK_EN")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("UART_CLK_EN")
	.dwattr $C$DW$136, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$136, DW_AT_bit_size(0x01)
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$136, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$136, DW_AT_decl_line(0x76)
	.dwattr $C$DW$136, DW_AT_decl_column(0x0d)

$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$137, DW_AT_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$137, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$137, DW_AT_bit_size(0x01)
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$137, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$137, DW_AT_decl_line(0x77)
	.dwattr $C$DW$137, DW_AT_decl_column(0x0d)

$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$138, DW_AT_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$138, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$138, DW_AT_bit_size(0x01)
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$138, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$138, DW_AT_decl_line(0x78)
	.dwattr $C$DW$138, DW_AT_decl_column(0x0d)

$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$139, DW_AT_name("ECAP_CLK_EN")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("ECAP_CLK_EN")
	.dwattr $C$DW$139, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$139, DW_AT_bit_size(0x01)
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$139, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$139, DW_AT_decl_line(0x79)
	.dwattr $C$DW$139, DW_AT_decl_column(0x0d)

$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$140, DW_AT_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$140, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$140, DW_AT_bit_size(0x01)
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$140, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$140, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$140, DW_AT_decl_column(0x0d)

$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$141, DW_AT_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$141, DW_AT_bit_offset(0x0f)
	.dwattr $C$DW$141, DW_AT_bit_size(0x01)
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$141, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$141, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$141, DW_AT_decl_column(0x0d)

$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$142, DW_AT_name("IEP_CLK_EN")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("IEP_CLK_EN")
	.dwattr $C$DW$142, DW_AT_bit_offset(0x0e)
	.dwattr $C$DW$142, DW_AT_bit_size(0x01)
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$142, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$142, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$142, DW_AT_decl_column(0x0d)

$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$143, DW_AT_name("rsvd18")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("rsvd18")
	.dwattr $C$DW$143, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$143, DW_AT_bit_size(0x0e)
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$143, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$143, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$143, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$23, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$23

$C$DW$T$77	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$77, DW_AT_type(*$C$DW$T$23)


$C$DW$T$24	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x04)
$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$144, DW_AT_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$144, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$144, DW_AT_bit_size(0x04)
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$144, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$144, DW_AT_decl_line(0x87)
	.dwattr $C$DW$144, DW_AT_decl_column(0x0d)

$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$145, DW_AT_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$145, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$145, DW_AT_bit_size(0x04)
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$145, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$145, DW_AT_decl_line(0x88)
	.dwattr $C$DW$145, DW_AT_decl_column(0x0d)

$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$146, DW_AT_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$146, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$146, DW_AT_bit_size(0x04)
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$146, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$146, DW_AT_decl_line(0x89)
	.dwattr $C$DW$146, DW_AT_decl_column(0x0d)

$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$147, DW_AT_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$147, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$147, DW_AT_bit_size(0x04)
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$147, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$147, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$147, DW_AT_decl_column(0x0d)

$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$148, DW_AT_name("RAM_PE_RAW")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("RAM_PE_RAW")
	.dwattr $C$DW$148, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$148, DW_AT_bit_size(0x04)
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$148, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$148, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$148, DW_AT_decl_column(0x0d)

$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$149, DW_AT_name("rsvd20")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$149, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$149, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$149, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$149, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$149, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$24, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x86)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$24

$C$DW$T$79	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$79, DW_AT_type(*$C$DW$T$24)


$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x04)
$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$150, DW_AT_name("PRU0_IMEM_PE")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("PRU0_IMEM_PE")
	.dwattr $C$DW$150, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$150, DW_AT_bit_size(0x04)
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$150, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$150, DW_AT_decl_line(0x96)
	.dwattr $C$DW$150, DW_AT_decl_column(0x0d)

$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$151, DW_AT_name("PRU0_DMEM_PE")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("PRU0_DMEM_PE")
	.dwattr $C$DW$151, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$151, DW_AT_bit_size(0x04)
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$151, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$151, DW_AT_decl_line(0x97)
	.dwattr $C$DW$151, DW_AT_decl_column(0x0d)

$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$152, DW_AT_name("PRU1_IMEM_PE")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("PRU1_IMEM_PE")
	.dwattr $C$DW$152, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$152, DW_AT_bit_size(0x04)
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$152, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$152, DW_AT_decl_line(0x98)
	.dwattr $C$DW$152, DW_AT_decl_column(0x0d)

$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$153, DW_AT_name("PRU1_DMEM_PE")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("PRU1_DMEM_PE")
	.dwattr $C$DW$153, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$153, DW_AT_bit_size(0x04)
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$153, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$153, DW_AT_decl_line(0x99)
	.dwattr $C$DW$153, DW_AT_decl_column(0x0d)

$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$154, DW_AT_name("RAM_PE")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("RAM_PE")
	.dwattr $C$DW$154, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$154, DW_AT_bit_size(0x04)
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$154, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$154, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$154, DW_AT_decl_column(0x0d)

$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$155, DW_AT_name("rsvd20")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$155, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$155, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$155, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$155, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$155, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$25, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$25

$C$DW$T$81	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$81, DW_AT_type(*$C$DW$T$25)


$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x04)
$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$156, DW_AT_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$156, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$156, DW_AT_bit_size(0x04)
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$156, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$156, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$156, DW_AT_decl_column(0x0d)

$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$157, DW_AT_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$157, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$157, DW_AT_bit_size(0x04)
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$157, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$157, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$157, DW_AT_decl_column(0x0d)

$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$158, DW_AT_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$158, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$158, DW_AT_bit_size(0x04)
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$158, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$158, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$158, DW_AT_decl_column(0x0d)

$C$DW$159	.dwtag  DW_TAG_member
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$159, DW_AT_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$159, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$159, DW_AT_bit_size(0x04)
	.dwattr $C$DW$159, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$159, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$159, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$159, DW_AT_decl_column(0x0d)

$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$160, DW_AT_name("RAM_PE_SET")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("RAM_PE_SET")
	.dwattr $C$DW$160, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$160, DW_AT_bit_size(0x04)
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$160, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$160, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$160, DW_AT_decl_column(0x0d)

$C$DW$161	.dwtag  DW_TAG_member
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$161, DW_AT_name("rsvd20")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$161, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$161, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$161, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$161, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$161, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$161, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$161, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$26, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$26

$C$DW$T$83	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$83, DW_AT_type(*$C$DW$T$26)


$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x04)
$C$DW$162	.dwtag  DW_TAG_member
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$162, DW_AT_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$162, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$162, DW_AT_bit_size(0x04)
	.dwattr $C$DW$162, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$162, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$162, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$162, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$162, DW_AT_decl_column(0x0d)

$C$DW$163	.dwtag  DW_TAG_member
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$163, DW_AT_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$163, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$163, DW_AT_bit_size(0x04)
	.dwattr $C$DW$163, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$163, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$163, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$163, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$163, DW_AT_decl_column(0x0d)

$C$DW$164	.dwtag  DW_TAG_member
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$164, DW_AT_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$164, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$164, DW_AT_bit_size(0x04)
	.dwattr $C$DW$164, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$164, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$164, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$164, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$164, DW_AT_decl_column(0x0d)

$C$DW$165	.dwtag  DW_TAG_member
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$165, DW_AT_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$165, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$165, DW_AT_bit_size(0x04)
	.dwattr $C$DW$165, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$165, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$165, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$165, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$165, DW_AT_decl_column(0x0d)

$C$DW$166	.dwtag  DW_TAG_member
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$166, DW_AT_name("rsvd16")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$166, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$166, DW_AT_bit_size(0x10)
	.dwattr $C$DW$166, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$166, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$166, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$166, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$166, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$27, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$27

$C$DW$T$85	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$85, DW_AT_type(*$C$DW$T$27)


$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x04)
$C$DW$167	.dwtag  DW_TAG_member
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$167, DW_AT_name("PMAO_PRU0")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("PMAO_PRU0")
	.dwattr $C$DW$167, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$167, DW_AT_bit_size(0x01)
	.dwattr $C$DW$167, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$167, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$167, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$167, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$167, DW_AT_decl_column(0x0d)

$C$DW$168	.dwtag  DW_TAG_member
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$168, DW_AT_name("PMAO_PRU1")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("PMAO_PRU1")
	.dwattr $C$DW$168, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$168, DW_AT_bit_size(0x01)
	.dwattr $C$DW$168, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$168, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$168, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$168, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$168, DW_AT_decl_column(0x0d)

$C$DW$169	.dwtag  DW_TAG_member
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$169, DW_AT_name("rsvd2")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$169, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$169, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$169, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$169, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$169, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$169, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$169, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$28, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$28

$C$DW$T$87	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$87, DW_AT_type(*$C$DW$T$28)


$C$DW$T$29	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x04)
$C$DW$170	.dwtag  DW_TAG_member
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$170, DW_AT_name("OCP_EN")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("OCP_EN")
	.dwattr $C$DW$170, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$170, DW_AT_bit_size(0x01)
	.dwattr $C$DW$170, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$170, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$170, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$170, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$170, DW_AT_decl_column(0x0d)

$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$171, DW_AT_name("rsvd1")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$171, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$171, DW_AT_bit_size(0x1f)
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$171, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$171, DW_AT_decl_line(0xd4)
	.dwattr $C$DW$171, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$29, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$29, DW_AT_decl_line(0xd2)
	.dwattr $C$DW$T$29, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$29

$C$DW$T$89	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$89, DW_AT_type(*$C$DW$T$29)


$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x04)
$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$172, DW_AT_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$172, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$172, DW_AT_bit_size(0x01)
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$172, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$172, DW_AT_decl_line(0xde)
	.dwattr $C$DW$172, DW_AT_decl_column(0x0d)

$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$173, DW_AT_name("XFR_SHIFT_EN")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("XFR_SHIFT_EN")
	.dwattr $C$DW$173, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$173, DW_AT_bit_size(0x01)
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$173, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$173, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$173, DW_AT_decl_column(0x0d)

$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$174, DW_AT_name("rsvd2")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$174, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$174, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$174, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$174, DW_AT_decl_line(0xe0)
	.dwattr $C$DW$174, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$30, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$30

$C$DW$T$91	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$91, DW_AT_type(*$C$DW$T$30)


$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x04)
$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$175, DW_AT_name("PIN_MUX_SEL")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("PIN_MUX_SEL")
	.dwattr $C$DW$175, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$175, DW_AT_bit_size(0x08)
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$175, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$175, DW_AT_decl_line(0xec)
	.dwattr $C$DW$175, DW_AT_decl_column(0x0d)

$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$176, DW_AT_name("rsvd2")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$176, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$176, DW_AT_bit_size(0x18)
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$176, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$176, DW_AT_decl_line(0xed)
	.dwattr $C$DW$176, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$31, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$31

$C$DW$T$93	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$93, DW_AT_type(*$C$DW$T$31)


$C$DW$T$35	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x44)
$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$70)
	.dwattr $C$DW$177, DW_AT_name("$P$T0")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$177, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$177, DW_AT_decl_line(0x29)
	.dwattr $C$DW$177, DW_AT_decl_column(0x02)

$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$72)
	.dwattr $C$DW$178, DW_AT_name("$P$T1")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$178, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$178, DW_AT_decl_line(0x33)
	.dwattr $C$DW$178, DW_AT_decl_column(0x02)

$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$179, DW_AT_name("$P$T2")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$179, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$179, DW_AT_decl_line(0x41)
	.dwattr $C$DW$179, DW_AT_decl_column(0x02)

$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$76)
	.dwattr $C$DW$180, DW_AT_name("$P$T3")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$180, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$180, DW_AT_decl_line(0x54)
	.dwattr $C$DW$180, DW_AT_decl_column(0x02)

$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$181, DW_AT_name("$P$T4")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$181, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$181, DW_AT_decl_line(0x67)
	.dwattr $C$DW$181, DW_AT_decl_column(0x02)

$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$80)
	.dwattr $C$DW$182, DW_AT_name("$P$T5")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$182, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$182, DW_AT_decl_line(0x83)
	.dwattr $C$DW$182, DW_AT_decl_column(0x02)

$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$183, DW_AT_name("$P$T6")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$183, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$183, DW_AT_decl_line(0x92)
	.dwattr $C$DW$183, DW_AT_decl_column(0x02)

$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$184, DW_AT_name("$P$T7")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$184, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$184, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$184, DW_AT_decl_column(0x02)

$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$185, DW_AT_name("$P$T8")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$185, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$185, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$185, DW_AT_decl_column(0x02)

$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$186, DW_AT_name("rsvd24")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$186, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$186, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$186, DW_AT_decl_column(0x0b)

$C$DW$187	.dwtag  DW_TAG_member
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$187, DW_AT_name("$P$T9")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("$P$T9")
	.dwattr $C$DW$187, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$187, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$187, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$187, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$187, DW_AT_decl_column(0x02)

$C$DW$188	.dwtag  DW_TAG_member
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$188, DW_AT_name("rsvd2c")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("rsvd2c")
	.dwattr $C$DW$188, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$188, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$188, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$188, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$188, DW_AT_decl_column(0x0b)

$C$DW$189	.dwtag  DW_TAG_member
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$90)
	.dwattr $C$DW$189, DW_AT_name("$P$T10")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("$P$T10")
	.dwattr $C$DW$189, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$189, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$189, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$189, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$189, DW_AT_decl_column(0x02)

$C$DW$190	.dwtag  DW_TAG_member
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$92)
	.dwattr $C$DW$190, DW_AT_name("$P$T11")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("$P$T11")
	.dwattr $C$DW$190, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$190, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$190, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$190, DW_AT_decl_line(0xda)
	.dwattr $C$DW$190, DW_AT_decl_column(0x02)

$C$DW$191	.dwtag  DW_TAG_member
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$191, DW_AT_name("rsvd38")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("rsvd38")
	.dwattr $C$DW$191, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$191, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$191, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$191, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$191, DW_AT_decl_column(0x0b)

$C$DW$192	.dwtag  DW_TAG_member
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$94)
	.dwattr $C$DW$192, DW_AT_name("$P$T12")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("$P$T12")
	.dwattr $C$DW$192, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$192, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$192, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$192, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$192, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$35, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$35

$C$DW$T$109	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$109, DW_AT_name("pruCfg")
	.dwattr $C$DW$T$109, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$109, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$109, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$109, DW_AT_decl_line(0xf0)
	.dwattr $C$DW$T$109, DW_AT_decl_column(0x03)

$C$DW$T$110	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$110, DW_AT_type(*$C$DW$T$109)


$C$DW$T$36	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$36, DW_AT_byte_size(0x40000)
$C$DW$193	.dwtag  DW_TAG_member
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$97)
	.dwattr $C$DW$193, DW_AT_name("$P$T13")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("$P$T13")
	.dwattr $C$DW$193, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$193, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$193, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$193, DW_AT_decl_line(0x34)
	.dwattr $C$DW$193, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$36, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$T$36, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$36, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$36

$C$DW$T$37	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$37, DW_AT_name("unibus_memory_t")
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$37, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$T$37, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$37, DW_AT_decl_column(0x03)


$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x40000)
$C$DW$194	.dwtag  DW_TAG_member
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$194, DW_AT_name("memory")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("memory")
	.dwattr $C$DW$194, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$194, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$194, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$194, DW_AT_decl_line(0x17)
	.dwattr $C$DW$194, DW_AT_decl_column(0x12)

	.dwattr $C$DW$T$38, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$T$38, DW_AT_decl_line(0x14)
	.dwattr $C$DW$T$38, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$38

$C$DW$T$48	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$48, DW_AT_name("ddrmem_t")
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$48, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$48, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$T$48, DW_AT_decl_line(0x18)
	.dwattr $C$DW$T$48, DW_AT_decl_column(0x03)

$C$DW$T$49	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$49, DW_AT_type(*$C$DW$T$48)

$C$DW$T$50	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$T$50, DW_AT_address_class(0x20)


$C$DW$T$41	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x0c)
$C$DW$195	.dwtag  DW_TAG_member
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$195, DW_AT_name("eventmask")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("eventmask")
	.dwattr $C$DW$195, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$195, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$195, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$195, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$195, DW_AT_decl_column(0x0a)

$C$DW$196	.dwtag  DW_TAG_member
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$196, DW_AT_name("unibus_control")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("unibus_control")
	.dwattr $C$DW$196, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$196, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$196, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$196, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$196, DW_AT_decl_column(0x0a)

$C$DW$197	.dwtag  DW_TAG_member
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$197, DW_AT_name("device_handle")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("device_handle")
	.dwattr $C$DW$197, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$197, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$197, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$197, DW_AT_decl_line(0x7f)
	.dwattr $C$DW$197, DW_AT_decl_column(0x0a)

$C$DW$198	.dwtag  DW_TAG_member
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$198, DW_AT_name("device_register_idx")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("device_register_idx")
	.dwattr $C$DW$198, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$198, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$198, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$198, DW_AT_decl_line(0x81)
	.dwattr $C$DW$198, DW_AT_decl_column(0x0a)

$C$DW$199	.dwtag  DW_TAG_member
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$199, DW_AT_name("addr")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$199, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$199, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$199, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$199, DW_AT_decl_line(0x83)
	.dwattr $C$DW$199, DW_AT_decl_column(0x0b)

$C$DW$200	.dwtag  DW_TAG_member
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$200, DW_AT_name("data")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("data")
	.dwattr $C$DW$200, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$200, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$200, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$200, DW_AT_decl_line(0x84)
	.dwattr $C$DW$200, DW_AT_decl_column(0x0b)

$C$DW$201	.dwtag  DW_TAG_member
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$201, DW_AT_name("initialization_signals_prev")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("initialization_signals_prev")
	.dwattr $C$DW$201, DW_AT_data_member_location[DW_OP_plus_uconst 0xa]
	.dwattr $C$DW$201, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$201, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$201, DW_AT_decl_line(0x87)
	.dwattr $C$DW$201, DW_AT_decl_column(0x0a)

$C$DW$202	.dwtag  DW_TAG_member
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$202, DW_AT_name("initialization_signals_cur")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("initialization_signals_cur")
	.dwattr $C$DW$202, DW_AT_data_member_location[DW_OP_plus_uconst 0xb]
	.dwattr $C$DW$202, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$202, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$202, DW_AT_decl_line(0x88)
	.dwattr $C$DW$202, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$41, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x79)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$41

$C$DW$T$51	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$51, DW_AT_name("mailbox_events_t")
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$T$51, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$51, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$51, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$T$51, DW_AT_decl_column(0x03)


$C$DW$T$42	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$42, DW_AT_byte_size(0x08)
$C$DW$203	.dwtag  DW_TAG_member
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$203, DW_AT_name("addr")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$203, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$203, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$203, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$203, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$203, DW_AT_decl_column(0x0b)

$C$DW$204	.dwtag  DW_TAG_member
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$204, DW_AT_name("val")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$204, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$204, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$204, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$204, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$204, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$42, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$42

$C$DW$T$98	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$98, DW_AT_name("mailbox_test_t")
	.dwattr $C$DW$T$98, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$T$98, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$98, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$98, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$98, DW_AT_decl_column(0x03)


$C$DW$T$43	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$43, DW_AT_byte_size(0x0c)
$C$DW$205	.dwtag  DW_TAG_member
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$205, DW_AT_name("addr")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$205, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$205, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$205, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$205, DW_AT_decl_line(0x51)
	.dwattr $C$DW$205, DW_AT_decl_column(0x0b)

$C$DW$206	.dwtag  DW_TAG_member
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$206, DW_AT_name("bitmask")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("bitmask")
	.dwattr $C$DW$206, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$206, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$206, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$206, DW_AT_decl_line(0x52)
	.dwattr $C$DW$206, DW_AT_decl_column(0x0b)

$C$DW$207	.dwtag  DW_TAG_member
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$207, DW_AT_name("val")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$207, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$207, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$207, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$207, DW_AT_decl_line(0x53)
	.dwattr $C$DW$207, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$43, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x50)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$43

$C$DW$T$99	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$99, DW_AT_name("mailbox_buslatch_t")
	.dwattr $C$DW$T$99, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$T$99, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$99, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$99, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$99, DW_AT_decl_column(0x03)


$C$DW$T$44	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x04)
$C$DW$208	.dwtag  DW_TAG_member
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$208, DW_AT_name("addr_0_7")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("addr_0_7")
	.dwattr $C$DW$208, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$208, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$208, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$208, DW_AT_decl_line(0x57)
	.dwattr $C$DW$208, DW_AT_decl_column(0x0a)

$C$DW$209	.dwtag  DW_TAG_member
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$209, DW_AT_name("addr_8_15")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("addr_8_15")
	.dwattr $C$DW$209, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$209, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$209, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$209, DW_AT_decl_line(0x58)
	.dwattr $C$DW$209, DW_AT_decl_column(0x0a)

$C$DW$210	.dwtag  DW_TAG_member
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$210, DW_AT_name("data_0_7")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("data_0_7")
	.dwattr $C$DW$210, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$210, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$210, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$210, DW_AT_decl_line(0x59)
	.dwattr $C$DW$210, DW_AT_decl_column(0x0a)

$C$DW$211	.dwtag  DW_TAG_member
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$211, DW_AT_name("data_8_15")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("data_8_15")
	.dwattr $C$DW$211, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$211, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$211, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$211, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$211, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$44, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$44

$C$DW$T$100	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$100, DW_AT_name("mailbox_buslatch_test_t")
	.dwattr $C$DW$T$100, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$T$100, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$100, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$100, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$T$100, DW_AT_decl_column(0x03)


$C$DW$T$46	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x40c)
$C$DW$212	.dwtag  DW_TAG_member
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$212, DW_AT_name("cur_status")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("cur_status")
	.dwattr $C$DW$212, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$212, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$212, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$212, DW_AT_decl_line(0x61)
	.dwattr $C$DW$212, DW_AT_decl_column(0x0a)

$C$DW$213	.dwtag  DW_TAG_member
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$213, DW_AT_name("control")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("control")
	.dwattr $C$DW$213, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$213, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$213, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$213, DW_AT_decl_line(0x62)
	.dwattr $C$DW$213, DW_AT_decl_column(0x0a)

$C$DW$214	.dwtag  DW_TAG_member
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$214, DW_AT_name("wordcount")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("wordcount")
	.dwattr $C$DW$214, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$214, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$214, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$214, DW_AT_decl_line(0x63)
	.dwattr $C$DW$214, DW_AT_decl_column(0x0b)

$C$DW$215	.dwtag  DW_TAG_member
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$215, DW_AT_name("cur_addr")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("cur_addr")
	.dwattr $C$DW$215, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$215, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$215, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$215, DW_AT_decl_line(0x64)
	.dwattr $C$DW$215, DW_AT_decl_column(0x0b)

$C$DW$216	.dwtag  DW_TAG_member
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$216, DW_AT_name("startaddr")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("startaddr")
	.dwattr $C$DW$216, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$216, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$216, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$216, DW_AT_decl_line(0x65)
	.dwattr $C$DW$216, DW_AT_decl_column(0x0b)

$C$DW$217	.dwtag  DW_TAG_member
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$217, DW_AT_name("words")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("words")
	.dwattr $C$DW$217, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$217, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$217, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$217, DW_AT_decl_line(0x66)
	.dwattr $C$DW$217, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$46, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$46, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$T$46, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$46

$C$DW$T$101	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$101, DW_AT_name("mailbox_dma_t")
	.dwattr $C$DW$T$101, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$T$101, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$101, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$101, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$101, DW_AT_decl_column(0x03)


$C$DW$T$47	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x03)
$C$DW$218	.dwtag  DW_TAG_member
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$218, DW_AT_name("vector")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("vector")
	.dwattr $C$DW$218, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$218, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$218, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$218, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$218, DW_AT_decl_column(0x0b)

$C$DW$219	.dwtag  DW_TAG_member
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$219, DW_AT_name("priority_bit")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("priority_bit")
	.dwattr $C$DW$219, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$219, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$219, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$219, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$219, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$47, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$47

$C$DW$T$102	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$102, DW_AT_name("mailbox_intr_t")
	.dwattr $C$DW$T$102, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$T$102, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$102, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$102, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$T$102, DW_AT_decl_column(0x03)


$C$DW$T$52	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$52, DW_AT_byte_size(0x424)
$C$DW$220	.dwtag  DW_TAG_member
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$220, DW_AT_name("arm2pru_req")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("arm2pru_req")
	.dwattr $C$DW$220, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$220, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$220, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$220, DW_AT_decl_line(0x90)
	.dwattr $C$DW$220, DW_AT_decl_column(0x0b)

$C$DW$221	.dwtag  DW_TAG_member
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$221, DW_AT_name("arm2pru_resp")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("arm2pru_resp")
	.dwattr $C$DW$221, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$221, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$221, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$221, DW_AT_decl_line(0x91)
	.dwattr $C$DW$221, DW_AT_decl_column(0x0b)

$C$DW$222	.dwtag  DW_TAG_member
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$222, DW_AT_name("ddrmem_base_physical")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("ddrmem_base_physical")
	.dwattr $C$DW$222, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$222, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$222, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$222, DW_AT_decl_line(0x94)
	.dwattr $C$DW$222, DW_AT_decl_column(0x15)

$C$DW$223	.dwtag  DW_TAG_member
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$223, DW_AT_name("events")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("events")
	.dwattr $C$DW$223, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$223, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$223, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$223, DW_AT_decl_line(0x97)
	.dwattr $C$DW$223, DW_AT_decl_column(0x13)

$C$DW$224	.dwtag  DW_TAG_member
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$103)
	.dwattr $C$DW$224, DW_AT_name("$P$T14")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("$P$T14")
	.dwattr $C$DW$224, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$224, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$224, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$224, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$224, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$52, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$52, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$T$52, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$52

$C$DW$T$115	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$115, DW_AT_type(*$C$DW$T$52)

$C$DW$T$116	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$116, DW_AT_type(*$C$DW$T$115)
	.dwattr $C$DW$T$116, DW_AT_address_class(0x20)

$C$DW$T$117	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$117, DW_AT_name("mailbox_t")
	.dwattr $C$DW$T$117, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$T$117, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$117, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$117, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$T$117, DW_AT_decl_column(0x03)

$C$DW$T$118	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$118, DW_AT_type(*$C$DW$T$117)


$C$DW$T$54	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x10)
$C$DW$225	.dwtag  DW_TAG_member
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$225, DW_AT_name("cur_reg_val")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("cur_reg_val")
	.dwattr $C$DW$225, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$225, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$225, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$225, DW_AT_decl_line(0x22)
	.dwattr $C$DW$225, DW_AT_decl_column(0x0a)

$C$DW$226	.dwtag  DW_TAG_member
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$226, DW_AT_name("bidi_bitwidth")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("bidi_bitwidth")
	.dwattr $C$DW$226, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$226, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$226, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$226, DW_AT_decl_line(0x26)
	.dwattr $C$DW$226, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$54, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$T$54, DW_AT_decl_line(0x21)
	.dwattr $C$DW$T$54, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$54

$C$DW$T$120	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$120, DW_AT_name("buslatches_t")
	.dwattr $C$DW$T$120, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$T$120, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$120, DW_AT_decl_file("pru1_buslatches.h")
	.dwattr $C$DW$T$120, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$120, DW_AT_decl_column(0x03)


$C$DW$T$58	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x03)
$C$DW$227	.dwtag  DW_TAG_member
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$227, DW_AT_name("state")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("state")
	.dwattr $C$DW$227, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$227, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$227, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$227, DW_AT_decl_line(0x22)
	.dwattr $C$DW$227, DW_AT_decl_column(0x18)

$C$DW$228	.dwtag  DW_TAG_member
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$228, DW_AT_name("priority_bit")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("priority_bit")
	.dwattr $C$DW$228, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$228, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$228, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$228, DW_AT_decl_line(0x23)
	.dwattr $C$DW$228, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$58, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x21)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$58

$C$DW$T$121	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$121, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$121, DW_AT_address_class(0x20)

$C$DW$T$122	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$122, DW_AT_name("statemachine_arbitration_t")
	.dwattr $C$DW$T$122, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$122, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$122, DW_AT_decl_file("pru1_statemachine_arbitration.h")
	.dwattr $C$DW$T$122, DW_AT_decl_line(0x25)
	.dwattr $C$DW$T$122, DW_AT_decl_column(0x03)


$C$DW$T$61	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$61, DW_AT_byte_size(0x09)
$C$DW$229	.dwtag  DW_TAG_member
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$229, DW_AT_name("state")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("state")
	.dwattr $C$DW$229, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$229, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$229, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$229, DW_AT_decl_line(0x26)
	.dwattr $C$DW$229, DW_AT_decl_column(0x18)

$C$DW$230	.dwtag  DW_TAG_member
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$230, DW_AT_name("state_timeout")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("state_timeout")
	.dwattr $C$DW$230, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$230, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$230, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$230, DW_AT_decl_line(0x27)
	.dwattr $C$DW$230, DW_AT_decl_column(0x0a)

$C$DW$231	.dwtag  DW_TAG_member
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$231, DW_AT_name("dataptr")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("dataptr")
	.dwattr $C$DW$231, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$231, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$231, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$231, DW_AT_decl_line(0x28)
	.dwattr $C$DW$231, DW_AT_decl_column(0x0c)

$C$DW$232	.dwtag  DW_TAG_member
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$232, DW_AT_name("cur_wordsleft")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("cur_wordsleft")
	.dwattr $C$DW$232, DW_AT_data_member_location[DW_OP_plus_uconst 0x7]
	.dwattr $C$DW$232, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$232, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$232, DW_AT_decl_line(0x29)
	.dwattr $C$DW$232, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$61, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x25)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$61

$C$DW$T$123	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$123, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$T$123, DW_AT_address_class(0x20)

$C$DW$T$124	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$124, DW_AT_name("statemachine_dma_t")
	.dwattr $C$DW$T$124, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$T$124, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$124, DW_AT_decl_file("pru1_statemachine_dma.h")
	.dwattr $C$DW$T$124, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$T$124, DW_AT_decl_column(0x03)


$C$DW$T$63	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x02)
$C$DW$233	.dwtag  DW_TAG_member
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$233, DW_AT_name("state")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("state")
	.dwattr $C$DW$233, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$233, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$233, DW_AT_decl_file("pru1_statemachine_slave.h")
	.dwattr $C$DW$233, DW_AT_decl_line(0x23)
	.dwattr $C$DW$233, DW_AT_decl_column(0x1a)

	.dwattr $C$DW$T$63, DW_AT_decl_file("pru1_statemachine_slave.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0x22)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$63

$C$DW$T$125	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$125, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$T$125, DW_AT_address_class(0x20)

$C$DW$T$126	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$126, DW_AT_name("statemachine_slave_t")
	.dwattr $C$DW$T$126, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$T$126, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$126, DW_AT_decl_file("pru1_statemachine_slave.h")
	.dwattr $C$DW$T$126, DW_AT_decl_line(0x27)
	.dwattr $C$DW$T$126, DW_AT_decl_column(0x03)


$C$DW$T$65	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$65, DW_AT_byte_size(0x02)
$C$DW$234	.dwtag  DW_TAG_member
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$64)
	.dwattr $C$DW$234, DW_AT_name("state")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("state")
	.dwattr $C$DW$234, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$234, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$234, DW_AT_decl_file("pru1_statemachine_init.h")
	.dwattr $C$DW$234, DW_AT_decl_line(0x27)
	.dwattr $C$DW$234, DW_AT_decl_column(0x1e)

	.dwattr $C$DW$T$65, DW_AT_decl_file("pru1_statemachine_init.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$65

$C$DW$T$127	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$127, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$T$127, DW_AT_address_class(0x20)

$C$DW$T$128	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$128, DW_AT_name("statemachine_init_t")
	.dwattr $C$DW$T$128, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$T$128, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$128, DW_AT_decl_file("pru1_statemachine_init.h")
	.dwattr $C$DW$T$128, DW_AT_decl_line(0x28)
	.dwattr $C$DW$T$128, DW_AT_decl_column(0x03)


$C$DW$T$67	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$67, DW_AT_byte_size(0x02)
$C$DW$235	.dwtag  DW_TAG_member
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$235, DW_AT_name("state")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("state")
	.dwattr $C$DW$235, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$235, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$235, DW_AT_decl_file("pru1_statemachine_powercycle.h")
	.dwattr $C$DW$235, DW_AT_decl_line(0x25)
	.dwattr $C$DW$235, DW_AT_decl_column(0x1f)

	.dwattr $C$DW$T$67, DW_AT_decl_file("pru1_statemachine_powercycle.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0x24)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$67

$C$DW$T$129	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$129, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$T$129, DW_AT_address_class(0x20)

$C$DW$T$130	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$130, DW_AT_name("statemachine_powercycle_t")
	.dwattr $C$DW$T$130, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$T$130, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$130, DW_AT_decl_file("pru1_statemachine_powercycle.h")
	.dwattr $C$DW$T$130, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$130, DW_AT_decl_column(0x03)


$C$DW$T$70	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$70, DW_AT_byte_size(0x04)
$C$DW$236	.dwtag  DW_TAG_member
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$236, DW_AT_name("REVID")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$236, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$236, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$236, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$236, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$236, DW_AT_decl_column(0x15)

$C$DW$237	.dwtag  DW_TAG_member
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$69)
	.dwattr $C$DW$237, DW_AT_name("REVID_bit")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$237, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$237, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$237, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$237, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$237, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$70, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$70


$C$DW$T$72	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$72, DW_AT_byte_size(0x04)
$C$DW$238	.dwtag  DW_TAG_member
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$238, DW_AT_name("SYSCFG")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("SYSCFG")
	.dwattr $C$DW$238, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$238, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$238, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$238, DW_AT_decl_line(0x34)
	.dwattr $C$DW$238, DW_AT_decl_column(0x15)

$C$DW$239	.dwtag  DW_TAG_member
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$239, DW_AT_name("SYSCFG_bit")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("SYSCFG_bit")
	.dwattr $C$DW$239, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$239, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$239, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$239, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$239, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$72, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$72


$C$DW$T$74	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$74, DW_AT_byte_size(0x04)
$C$DW$240	.dwtag  DW_TAG_member
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$240, DW_AT_name("GPCFG0")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("GPCFG0")
	.dwattr $C$DW$240, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$240, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$240, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$240, DW_AT_decl_line(0x42)
	.dwattr $C$DW$240, DW_AT_decl_column(0x15)

$C$DW$241	.dwtag  DW_TAG_member
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$73)
	.dwattr $C$DW$241, DW_AT_name("GPCFG0_bit")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("GPCFG0_bit")
	.dwattr $C$DW$241, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$241, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$241, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$241, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$241, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$74, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$74, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$74, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$74


$C$DW$T$76	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$76, DW_AT_byte_size(0x04)
$C$DW$242	.dwtag  DW_TAG_member
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$242, DW_AT_name("GPCFG1")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("GPCFG1")
	.dwattr $C$DW$242, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$242, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$242, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$242, DW_AT_decl_line(0x55)
	.dwattr $C$DW$242, DW_AT_decl_column(0x15)

$C$DW$243	.dwtag  DW_TAG_member
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$75)
	.dwattr $C$DW$243, DW_AT_name("GPCFG1_bit")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("GPCFG1_bit")
	.dwattr $C$DW$243, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$243, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$243, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$243, DW_AT_decl_line(0x62)
	.dwattr $C$DW$243, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$76, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$76, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$76, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$76


$C$DW$T$78	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$78, DW_AT_byte_size(0x04)
$C$DW$244	.dwtag  DW_TAG_member
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$244, DW_AT_name("CGR")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("CGR")
	.dwattr $C$DW$244, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$244, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$244, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$244, DW_AT_decl_line(0x68)
	.dwattr $C$DW$244, DW_AT_decl_column(0x15)

$C$DW$245	.dwtag  DW_TAG_member
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$77)
	.dwattr $C$DW$245, DW_AT_name("CGR_bit")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("CGR_bit")
	.dwattr $C$DW$245, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$245, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$245, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$245, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$245, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$78, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$78, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$78, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$78


$C$DW$T$80	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$80, DW_AT_byte_size(0x04)
$C$DW$246	.dwtag  DW_TAG_member
	.dwattr $C$DW$246, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$246, DW_AT_name("ISRP")
	.dwattr $C$DW$246, DW_AT_TI_symbol_name("ISRP")
	.dwattr $C$DW$246, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$246, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$246, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$246, DW_AT_decl_line(0x84)
	.dwattr $C$DW$246, DW_AT_decl_column(0x15)

$C$DW$247	.dwtag  DW_TAG_member
	.dwattr $C$DW$247, DW_AT_type(*$C$DW$T$79)
	.dwattr $C$DW$247, DW_AT_name("ISRP_bit")
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("ISRP_bit")
	.dwattr $C$DW$247, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$247, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$247, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$247, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$247, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$80, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$80, DW_AT_decl_line(0x83)
	.dwattr $C$DW$T$80, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$80


$C$DW$T$82	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$82, DW_AT_byte_size(0x04)
$C$DW$248	.dwtag  DW_TAG_member
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$248, DW_AT_name("ISP")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("ISP")
	.dwattr $C$DW$248, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$248, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$248, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$248, DW_AT_decl_line(0x93)
	.dwattr $C$DW$248, DW_AT_decl_column(0x15)

$C$DW$249	.dwtag  DW_TAG_member
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$81)
	.dwattr $C$DW$249, DW_AT_name("ISP_bit")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("ISP_bit")
	.dwattr $C$DW$249, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$249, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$249, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$249, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$249, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$82, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$82, DW_AT_decl_line(0x92)
	.dwattr $C$DW$T$82, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$82


$C$DW$T$84	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$84, DW_AT_byte_size(0x04)
$C$DW$250	.dwtag  DW_TAG_member
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$250, DW_AT_name("IESP")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("IESP")
	.dwattr $C$DW$250, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$250, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$250, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$250, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$250, DW_AT_decl_column(0x15)

$C$DW$251	.dwtag  DW_TAG_member
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$251, DW_AT_name("IESP_bit")
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("IESP_bit")
	.dwattr $C$DW$251, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$251, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$251, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$251, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$251, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$84, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$84, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$84, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$84


$C$DW$T$86	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$86, DW_AT_byte_size(0x04)
$C$DW$252	.dwtag  DW_TAG_member
	.dwattr $C$DW$252, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$252, DW_AT_name("IECP")
	.dwattr $C$DW$252, DW_AT_TI_symbol_name("IECP")
	.dwattr $C$DW$252, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$252, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$252, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$252, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$252, DW_AT_decl_column(0x15)

$C$DW$253	.dwtag  DW_TAG_member
	.dwattr $C$DW$253, DW_AT_type(*$C$DW$T$85)
	.dwattr $C$DW$253, DW_AT_name("IECP_bit")
	.dwattr $C$DW$253, DW_AT_TI_symbol_name("IECP_bit")
	.dwattr $C$DW$253, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$253, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$253, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$253, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$253, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$86, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$86, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$86, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$86


$C$DW$T$88	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$88, DW_AT_byte_size(0x04)
$C$DW$254	.dwtag  DW_TAG_member
	.dwattr $C$DW$254, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$254, DW_AT_name("PMAO")
	.dwattr $C$DW$254, DW_AT_TI_symbol_name("PMAO")
	.dwattr $C$DW$254, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$254, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$254, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$254, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$254, DW_AT_decl_column(0x15)

$C$DW$255	.dwtag  DW_TAG_member
	.dwattr $C$DW$255, DW_AT_type(*$C$DW$T$87)
	.dwattr $C$DW$255, DW_AT_name("PMAO_bit")
	.dwattr $C$DW$255, DW_AT_TI_symbol_name("PMAO_bit")
	.dwattr $C$DW$255, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$255, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$255, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$255, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$255, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$88, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$88, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$T$88, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$88


$C$DW$T$90	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$90, DW_AT_byte_size(0x04)
$C$DW$256	.dwtag  DW_TAG_member
	.dwattr $C$DW$256, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$256, DW_AT_name("IEPCLK")
	.dwattr $C$DW$256, DW_AT_TI_symbol_name("IEPCLK")
	.dwattr $C$DW$256, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$256, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$256, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$256, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$256, DW_AT_decl_column(0x15)

$C$DW$257	.dwtag  DW_TAG_member
	.dwattr $C$DW$257, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$257, DW_AT_name("IEPCLK_bit")
	.dwattr $C$DW$257, DW_AT_TI_symbol_name("IEPCLK_bit")
	.dwattr $C$DW$257, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$257, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$257, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$257, DW_AT_decl_line(0xd5)
	.dwattr $C$DW$257, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$90, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$90, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$T$90, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$90


$C$DW$T$92	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$92, DW_AT_byte_size(0x04)
$C$DW$258	.dwtag  DW_TAG_member
	.dwattr $C$DW$258, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$258, DW_AT_name("SPP")
	.dwattr $C$DW$258, DW_AT_TI_symbol_name("SPP")
	.dwattr $C$DW$258, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$258, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$258, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$258, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$258, DW_AT_decl_column(0x15)

$C$DW$259	.dwtag  DW_TAG_member
	.dwattr $C$DW$259, DW_AT_type(*$C$DW$T$91)
	.dwattr $C$DW$259, DW_AT_name("SPP_bit")
	.dwattr $C$DW$259, DW_AT_TI_symbol_name("SPP_bit")
	.dwattr $C$DW$259, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$259, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$259, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$259, DW_AT_decl_line(0xe1)
	.dwattr $C$DW$259, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$92, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$92, DW_AT_decl_line(0xda)
	.dwattr $C$DW$T$92, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$92


$C$DW$T$94	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$94, DW_AT_byte_size(0x04)
$C$DW$260	.dwtag  DW_TAG_member
	.dwattr $C$DW$260, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$260, DW_AT_name("PIN_MX")
	.dwattr $C$DW$260, DW_AT_TI_symbol_name("PIN_MX")
	.dwattr $C$DW$260, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$260, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$260, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$260, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$260, DW_AT_decl_column(0x15)

$C$DW$261	.dwtag  DW_TAG_member
	.dwattr $C$DW$261, DW_AT_type(*$C$DW$T$93)
	.dwattr $C$DW$261, DW_AT_name("PIN_MX_bit")
	.dwattr $C$DW$261, DW_AT_TI_symbol_name("PIN_MX_bit")
	.dwattr $C$DW$261, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$261, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$261, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$261, DW_AT_decl_line(0xee)
	.dwattr $C$DW$261, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$94, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$94, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$T$94, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$94


$C$DW$T$97	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$97, DW_AT_byte_size(0x40000)
$C$DW$262	.dwtag  DW_TAG_member
	.dwattr $C$DW$262, DW_AT_type(*$C$DW$T$95)
	.dwattr $C$DW$262, DW_AT_name("words")
	.dwattr $C$DW$262, DW_AT_TI_symbol_name("words")
	.dwattr $C$DW$262, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$262, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$262, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$262, DW_AT_decl_line(0x35)
	.dwattr $C$DW$262, DW_AT_decl_column(0x0b)

$C$DW$263	.dwtag  DW_TAG_member
	.dwattr $C$DW$263, DW_AT_type(*$C$DW$T$96)
	.dwattr $C$DW$263, DW_AT_name("bytes")
	.dwattr $C$DW$263, DW_AT_TI_symbol_name("bytes")
	.dwattr $C$DW$263, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$263, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$263, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$263, DW_AT_decl_line(0x36)
	.dwattr $C$DW$263, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$97, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$T$97, DW_AT_decl_line(0x34)
	.dwattr $C$DW$T$97, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$97


$C$DW$T$103	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$103, DW_AT_byte_size(0x40c)
$C$DW$264	.dwtag  DW_TAG_member
	.dwattr $C$DW$264, DW_AT_type(*$C$DW$T$98)
	.dwattr $C$DW$264, DW_AT_name("mailbox_test")
	.dwattr $C$DW$264, DW_AT_TI_symbol_name("mailbox_test")
	.dwattr $C$DW$264, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$264, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$264, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$264, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$264, DW_AT_decl_column(0x12)

$C$DW$265	.dwtag  DW_TAG_member
	.dwattr $C$DW$265, DW_AT_type(*$C$DW$T$99)
	.dwattr $C$DW$265, DW_AT_name("buslatch")
	.dwattr $C$DW$265, DW_AT_TI_symbol_name("buslatch")
	.dwattr $C$DW$265, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$265, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$265, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$265, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$265, DW_AT_decl_column(0x16)

$C$DW$266	.dwtag  DW_TAG_member
	.dwattr $C$DW$266, DW_AT_type(*$C$DW$T$100)
	.dwattr $C$DW$266, DW_AT_name("buslatch_test")
	.dwattr $C$DW$266, DW_AT_TI_symbol_name("buslatch_test")
	.dwattr $C$DW$266, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$266, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$266, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$266, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$266, DW_AT_decl_column(0x1b)

$C$DW$267	.dwtag  DW_TAG_member
	.dwattr $C$DW$267, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$267, DW_AT_name("dma")
	.dwattr $C$DW$267, DW_AT_TI_symbol_name("dma")
	.dwattr $C$DW$267, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$267, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$267, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$267, DW_AT_decl_line(0x9e)
	.dwattr $C$DW$267, DW_AT_decl_column(0x11)

$C$DW$268	.dwtag  DW_TAG_member
	.dwattr $C$DW$268, DW_AT_type(*$C$DW$T$102)
	.dwattr $C$DW$268, DW_AT_name("intr")
	.dwattr $C$DW$268, DW_AT_TI_symbol_name("intr")
	.dwattr $C$DW$268, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$268, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$268, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$268, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$268, DW_AT_decl_column(0x12)

	.dwattr $C$DW$T$103, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$103, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$T$103, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$103

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

$C$DW$T$146	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$146, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$146, DW_AT_address_class(0x20)

$C$DW$T$39	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$39, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$39, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$39, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x1c)


$C$DW$T$53	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x08)
$C$DW$269	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$269, DW_AT_upper_bound(0x07)

	.dwendtag $C$DW$T$53


$C$DW$T$55	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$39)
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

$C$DW$T$64	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$64, DW_AT_name("sm_powercycle_init_func_ptr")
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$64, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$64, DW_AT_decl_file("pru1_statemachine_init.h")
	.dwattr $C$DW$T$64, DW_AT_decl_line(0x24)
	.dwattr $C$DW$T$64, DW_AT_decl_column(0x13)

$C$DW$T$66	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$66, DW_AT_name("sm_powercycle_state_func_ptr")
	.dwattr $C$DW$T$66, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$66, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$66, DW_AT_decl_file("pru1_statemachine_powercycle.h")
	.dwattr $C$DW$T$66, DW_AT_decl_line(0x22)
	.dwattr $C$DW$T$66, DW_AT_decl_column(0x13)

$C$DW$T$62	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$62, DW_AT_name("sm_slave_state_func_ptr")
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$62, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$62, DW_AT_decl_file("pru1_statemachine_slave.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0x20)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x13)


$C$DW$T$96	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$96, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$T$96, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$96, DW_AT_byte_size(0x40000)
$C$DW$270	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$270, DW_AT_upper_bound(0x3ffff)

	.dwendtag $C$DW$T$96

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

$C$DW$T$40	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$40, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$40, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$40, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$40, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$40, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$T$40, DW_AT_decl_column(0x1c)


$C$DW$T$45	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$T$45, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$45, DW_AT_byte_size(0x400)
$C$DW$271	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$271, DW_AT_upper_bound(0x1ff)

	.dwendtag $C$DW$T$45

$C$DW$T$60	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$T$60, DW_AT_address_class(0x20)


$C$DW$T$95	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$95, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$T$95, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$95, DW_AT_byte_size(0x40000)
$C$DW$272	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$272, DW_AT_upper_bound(0x1ffff)

	.dwendtag $C$DW$T$95

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
$C$DW$273	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$273, DW_AT_upper_bound(0x00)

	.dwendtag $C$DW$T$33


$C$DW$T$34	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_byte_size(0x08)
$C$DW$274	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$274, DW_AT_upper_bound(0x01)

	.dwendtag $C$DW$T$34

$C$DW$T$68	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$68, DW_AT_type(*$C$DW$T$32)

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


$C$DW$T$104	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$104, DW_AT_name("my_resource_table")
	.dwattr $C$DW$T$104, DW_AT_byte_size(0x14)
$C$DW$275	.dwtag  DW_TAG_member
	.dwattr $C$DW$275, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$275, DW_AT_name("base")
	.dwattr $C$DW$275, DW_AT_TI_symbol_name("base")
	.dwattr $C$DW$275, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$275, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$275, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$275, DW_AT_decl_line(0x39)
	.dwattr $C$DW$275, DW_AT_decl_column(0x18)

$C$DW$276	.dwtag  DW_TAG_member
	.dwattr $C$DW$276, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$276, DW_AT_name("offset")
	.dwattr $C$DW$276, DW_AT_TI_symbol_name("offset")
	.dwattr $C$DW$276, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$276, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$276, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$276, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$276, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$104, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$T$104, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$104, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$104


$C$DW$T$105	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$105, DW_AT_name("resource_table")
	.dwattr $C$DW$T$105, DW_AT_byte_size(0x10)
$C$DW$277	.dwtag  DW_TAG_member
	.dwattr $C$DW$277, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$277, DW_AT_name("ver")
	.dwattr $C$DW$277, DW_AT_TI_symbol_name("ver")
	.dwattr $C$DW$277, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$277, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$277, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/rsc_types.h")
	.dwattr $C$DW$277, DW_AT_decl_line(0x57)
	.dwattr $C$DW$277, DW_AT_decl_column(0x0b)

$C$DW$278	.dwtag  DW_TAG_member
	.dwattr $C$DW$278, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$278, DW_AT_name("num")
	.dwattr $C$DW$278, DW_AT_TI_symbol_name("num")
	.dwattr $C$DW$278, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$278, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$278, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/rsc_types.h")
	.dwattr $C$DW$278, DW_AT_decl_line(0x58)
	.dwattr $C$DW$278, DW_AT_decl_column(0x0b)

$C$DW$279	.dwtag  DW_TAG_member
	.dwattr $C$DW$279, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$279, DW_AT_name("reserved")
	.dwattr $C$DW$279, DW_AT_TI_symbol_name("reserved")
	.dwattr $C$DW$279, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$279, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$279, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/rsc_types.h")
	.dwattr $C$DW$279, DW_AT_decl_line(0x59)
	.dwattr $C$DW$279, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$105, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/rsc_types.h")
	.dwattr $C$DW$T$105, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$105, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$105

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

$C$DW$280	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$280, DW_AT_name("R0_b0")
	.dwattr $C$DW$280, DW_AT_location[DW_OP_reg0]

$C$DW$281	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$281, DW_AT_name("R0_b1")
	.dwattr $C$DW$281, DW_AT_location[DW_OP_reg1]

$C$DW$282	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$282, DW_AT_name("R0_b2")
	.dwattr $C$DW$282, DW_AT_location[DW_OP_reg2]

$C$DW$283	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$283, DW_AT_name("R0_b3")
	.dwattr $C$DW$283, DW_AT_location[DW_OP_reg3]

$C$DW$284	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$284, DW_AT_name("R1_b0")
	.dwattr $C$DW$284, DW_AT_location[DW_OP_reg4]

$C$DW$285	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$285, DW_AT_name("R1_b1")
	.dwattr $C$DW$285, DW_AT_location[DW_OP_reg5]

$C$DW$286	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$286, DW_AT_name("R1_b2")
	.dwattr $C$DW$286, DW_AT_location[DW_OP_reg6]

$C$DW$287	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$287, DW_AT_name("R1_b3")
	.dwattr $C$DW$287, DW_AT_location[DW_OP_reg7]

$C$DW$288	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$288, DW_AT_name("R2_b0")
	.dwattr $C$DW$288, DW_AT_location[DW_OP_reg8]

$C$DW$289	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$289, DW_AT_name("R2_b1")
	.dwattr $C$DW$289, DW_AT_location[DW_OP_reg9]

$C$DW$290	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$290, DW_AT_name("R2_b2")
	.dwattr $C$DW$290, DW_AT_location[DW_OP_reg10]

$C$DW$291	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$291, DW_AT_name("R2_b3")
	.dwattr $C$DW$291, DW_AT_location[DW_OP_reg11]

$C$DW$292	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$292, DW_AT_name("R3_b0")
	.dwattr $C$DW$292, DW_AT_location[DW_OP_reg12]

$C$DW$293	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$293, DW_AT_name("R3_b1")
	.dwattr $C$DW$293, DW_AT_location[DW_OP_reg13]

$C$DW$294	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$294, DW_AT_name("R3_b2")
	.dwattr $C$DW$294, DW_AT_location[DW_OP_reg14]

$C$DW$295	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$295, DW_AT_name("R3_b3")
	.dwattr $C$DW$295, DW_AT_location[DW_OP_reg15]

$C$DW$296	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$296, DW_AT_name("R4_b0")
	.dwattr $C$DW$296, DW_AT_location[DW_OP_reg16]

$C$DW$297	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$297, DW_AT_name("R4_b1")
	.dwattr $C$DW$297, DW_AT_location[DW_OP_reg17]

$C$DW$298	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$298, DW_AT_name("R4_b2")
	.dwattr $C$DW$298, DW_AT_location[DW_OP_reg18]

$C$DW$299	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$299, DW_AT_name("R4_b3")
	.dwattr $C$DW$299, DW_AT_location[DW_OP_reg19]

$C$DW$300	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$300, DW_AT_name("R5_b0")
	.dwattr $C$DW$300, DW_AT_location[DW_OP_reg20]

$C$DW$301	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$301, DW_AT_name("R5_b1")
	.dwattr $C$DW$301, DW_AT_location[DW_OP_reg21]

$C$DW$302	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$302, DW_AT_name("R5_b2")
	.dwattr $C$DW$302, DW_AT_location[DW_OP_reg22]

$C$DW$303	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$303, DW_AT_name("R5_b3")
	.dwattr $C$DW$303, DW_AT_location[DW_OP_reg23]

$C$DW$304	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$304, DW_AT_name("R6_b0")
	.dwattr $C$DW$304, DW_AT_location[DW_OP_reg24]

$C$DW$305	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$305, DW_AT_name("R6_b1")
	.dwattr $C$DW$305, DW_AT_location[DW_OP_reg25]

$C$DW$306	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$306, DW_AT_name("R6_b2")
	.dwattr $C$DW$306, DW_AT_location[DW_OP_reg26]

$C$DW$307	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$307, DW_AT_name("R6_b3")
	.dwattr $C$DW$307, DW_AT_location[DW_OP_reg27]

$C$DW$308	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$308, DW_AT_name("R7_b0")
	.dwattr $C$DW$308, DW_AT_location[DW_OP_reg28]

$C$DW$309	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$309, DW_AT_name("R7_b1")
	.dwattr $C$DW$309, DW_AT_location[DW_OP_reg29]

$C$DW$310	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$310, DW_AT_name("R7_b2")
	.dwattr $C$DW$310, DW_AT_location[DW_OP_reg30]

$C$DW$311	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$311, DW_AT_name("R7_b3")
	.dwattr $C$DW$311, DW_AT_location[DW_OP_reg31]

$C$DW$312	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$312, DW_AT_name("R8_b0")
	.dwattr $C$DW$312, DW_AT_location[DW_OP_regx 0x20]

$C$DW$313	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$313, DW_AT_name("R8_b1")
	.dwattr $C$DW$313, DW_AT_location[DW_OP_regx 0x21]

$C$DW$314	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$314, DW_AT_name("R8_b2")
	.dwattr $C$DW$314, DW_AT_location[DW_OP_regx 0x22]

$C$DW$315	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$315, DW_AT_name("R8_b3")
	.dwattr $C$DW$315, DW_AT_location[DW_OP_regx 0x23]

$C$DW$316	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$316, DW_AT_name("R9_b0")
	.dwattr $C$DW$316, DW_AT_location[DW_OP_regx 0x24]

$C$DW$317	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$317, DW_AT_name("R9_b1")
	.dwattr $C$DW$317, DW_AT_location[DW_OP_regx 0x25]

$C$DW$318	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$318, DW_AT_name("R9_b2")
	.dwattr $C$DW$318, DW_AT_location[DW_OP_regx 0x26]

$C$DW$319	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$319, DW_AT_name("R9_b3")
	.dwattr $C$DW$319, DW_AT_location[DW_OP_regx 0x27]

$C$DW$320	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$320, DW_AT_name("R10_b0")
	.dwattr $C$DW$320, DW_AT_location[DW_OP_regx 0x28]

$C$DW$321	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$321, DW_AT_name("R10_b1")
	.dwattr $C$DW$321, DW_AT_location[DW_OP_regx 0x29]

$C$DW$322	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$322, DW_AT_name("R10_b2")
	.dwattr $C$DW$322, DW_AT_location[DW_OP_regx 0x2a]

$C$DW$323	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$323, DW_AT_name("R10_b3")
	.dwattr $C$DW$323, DW_AT_location[DW_OP_regx 0x2b]

$C$DW$324	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$324, DW_AT_name("R11_b0")
	.dwattr $C$DW$324, DW_AT_location[DW_OP_regx 0x2c]

$C$DW$325	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$325, DW_AT_name("R11_b1")
	.dwattr $C$DW$325, DW_AT_location[DW_OP_regx 0x2d]

$C$DW$326	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$326, DW_AT_name("R11_b2")
	.dwattr $C$DW$326, DW_AT_location[DW_OP_regx 0x2e]

$C$DW$327	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$327, DW_AT_name("R11_b3")
	.dwattr $C$DW$327, DW_AT_location[DW_OP_regx 0x2f]

$C$DW$328	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$328, DW_AT_name("R12_b0")
	.dwattr $C$DW$328, DW_AT_location[DW_OP_regx 0x30]

$C$DW$329	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$329, DW_AT_name("R12_b1")
	.dwattr $C$DW$329, DW_AT_location[DW_OP_regx 0x31]

$C$DW$330	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$330, DW_AT_name("R12_b2")
	.dwattr $C$DW$330, DW_AT_location[DW_OP_regx 0x32]

$C$DW$331	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$331, DW_AT_name("R12_b3")
	.dwattr $C$DW$331, DW_AT_location[DW_OP_regx 0x33]

$C$DW$332	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$332, DW_AT_name("R13_b0")
	.dwattr $C$DW$332, DW_AT_location[DW_OP_regx 0x34]

$C$DW$333	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$333, DW_AT_name("R13_b1")
	.dwattr $C$DW$333, DW_AT_location[DW_OP_regx 0x35]

$C$DW$334	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$334, DW_AT_name("R13_b2")
	.dwattr $C$DW$334, DW_AT_location[DW_OP_regx 0x36]

$C$DW$335	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$335, DW_AT_name("R13_b3")
	.dwattr $C$DW$335, DW_AT_location[DW_OP_regx 0x37]

$C$DW$336	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$336, DW_AT_name("R14_b0")
	.dwattr $C$DW$336, DW_AT_location[DW_OP_regx 0x38]

$C$DW$337	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$337, DW_AT_name("R14_b1")
	.dwattr $C$DW$337, DW_AT_location[DW_OP_regx 0x39]

$C$DW$338	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$338, DW_AT_name("R14_b2")
	.dwattr $C$DW$338, DW_AT_location[DW_OP_regx 0x3a]

$C$DW$339	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$339, DW_AT_name("R14_b3")
	.dwattr $C$DW$339, DW_AT_location[DW_OP_regx 0x3b]

$C$DW$340	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$340, DW_AT_name("R15_b0")
	.dwattr $C$DW$340, DW_AT_location[DW_OP_regx 0x3c]

$C$DW$341	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$341, DW_AT_name("R15_b1")
	.dwattr $C$DW$341, DW_AT_location[DW_OP_regx 0x3d]

$C$DW$342	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$342, DW_AT_name("R15_b2")
	.dwattr $C$DW$342, DW_AT_location[DW_OP_regx 0x3e]

$C$DW$343	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$343, DW_AT_name("R15_b3")
	.dwattr $C$DW$343, DW_AT_location[DW_OP_regx 0x3f]

$C$DW$344	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$344, DW_AT_name("R16_b0")
	.dwattr $C$DW$344, DW_AT_location[DW_OP_regx 0x40]

$C$DW$345	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$345, DW_AT_name("R16_b1")
	.dwattr $C$DW$345, DW_AT_location[DW_OP_regx 0x41]

$C$DW$346	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$346, DW_AT_name("R16_b2")
	.dwattr $C$DW$346, DW_AT_location[DW_OP_regx 0x42]

$C$DW$347	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$347, DW_AT_name("R16_b3")
	.dwattr $C$DW$347, DW_AT_location[DW_OP_regx 0x43]

$C$DW$348	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$348, DW_AT_name("R17_b0")
	.dwattr $C$DW$348, DW_AT_location[DW_OP_regx 0x44]

$C$DW$349	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$349, DW_AT_name("R17_b1")
	.dwattr $C$DW$349, DW_AT_location[DW_OP_regx 0x45]

$C$DW$350	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$350, DW_AT_name("R17_b2")
	.dwattr $C$DW$350, DW_AT_location[DW_OP_regx 0x46]

$C$DW$351	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$351, DW_AT_name("R17_b3")
	.dwattr $C$DW$351, DW_AT_location[DW_OP_regx 0x47]

$C$DW$352	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$352, DW_AT_name("R18_b0")
	.dwattr $C$DW$352, DW_AT_location[DW_OP_regx 0x48]

$C$DW$353	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$353, DW_AT_name("R18_b1")
	.dwattr $C$DW$353, DW_AT_location[DW_OP_regx 0x49]

$C$DW$354	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$354, DW_AT_name("R18_b2")
	.dwattr $C$DW$354, DW_AT_location[DW_OP_regx 0x4a]

$C$DW$355	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$355, DW_AT_name("R18_b3")
	.dwattr $C$DW$355, DW_AT_location[DW_OP_regx 0x4b]

$C$DW$356	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$356, DW_AT_name("R19_b0")
	.dwattr $C$DW$356, DW_AT_location[DW_OP_regx 0x4c]

$C$DW$357	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$357, DW_AT_name("R19_b1")
	.dwattr $C$DW$357, DW_AT_location[DW_OP_regx 0x4d]

$C$DW$358	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$358, DW_AT_name("R19_b2")
	.dwattr $C$DW$358, DW_AT_location[DW_OP_regx 0x4e]

$C$DW$359	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$359, DW_AT_name("R19_b3")
	.dwattr $C$DW$359, DW_AT_location[DW_OP_regx 0x4f]

$C$DW$360	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$360, DW_AT_name("R20_b0")
	.dwattr $C$DW$360, DW_AT_location[DW_OP_regx 0x50]

$C$DW$361	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$361, DW_AT_name("R20_b1")
	.dwattr $C$DW$361, DW_AT_location[DW_OP_regx 0x51]

$C$DW$362	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$362, DW_AT_name("R20_b2")
	.dwattr $C$DW$362, DW_AT_location[DW_OP_regx 0x52]

$C$DW$363	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$363, DW_AT_name("R20_b3")
	.dwattr $C$DW$363, DW_AT_location[DW_OP_regx 0x53]

$C$DW$364	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$364, DW_AT_name("R21_b0")
	.dwattr $C$DW$364, DW_AT_location[DW_OP_regx 0x54]

$C$DW$365	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$365, DW_AT_name("R21_b1")
	.dwattr $C$DW$365, DW_AT_location[DW_OP_regx 0x55]

$C$DW$366	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$366, DW_AT_name("R21_b2")
	.dwattr $C$DW$366, DW_AT_location[DW_OP_regx 0x56]

$C$DW$367	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$367, DW_AT_name("R21_b3")
	.dwattr $C$DW$367, DW_AT_location[DW_OP_regx 0x57]

$C$DW$368	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$368, DW_AT_name("R22_b0")
	.dwattr $C$DW$368, DW_AT_location[DW_OP_regx 0x58]

$C$DW$369	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$369, DW_AT_name("R22_b1")
	.dwattr $C$DW$369, DW_AT_location[DW_OP_regx 0x59]

$C$DW$370	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$370, DW_AT_name("R22_b2")
	.dwattr $C$DW$370, DW_AT_location[DW_OP_regx 0x5a]

$C$DW$371	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$371, DW_AT_name("R22_b3")
	.dwattr $C$DW$371, DW_AT_location[DW_OP_regx 0x5b]

$C$DW$372	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$372, DW_AT_name("R23_b0")
	.dwattr $C$DW$372, DW_AT_location[DW_OP_regx 0x5c]

$C$DW$373	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$373, DW_AT_name("R23_b1")
	.dwattr $C$DW$373, DW_AT_location[DW_OP_regx 0x5d]

$C$DW$374	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$374, DW_AT_name("R23_b2")
	.dwattr $C$DW$374, DW_AT_location[DW_OP_regx 0x5e]

$C$DW$375	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$375, DW_AT_name("R23_b3")
	.dwattr $C$DW$375, DW_AT_location[DW_OP_regx 0x5f]

$C$DW$376	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$376, DW_AT_name("R24_b0")
	.dwattr $C$DW$376, DW_AT_location[DW_OP_regx 0x60]

$C$DW$377	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$377, DW_AT_name("R24_b1")
	.dwattr $C$DW$377, DW_AT_location[DW_OP_regx 0x61]

$C$DW$378	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$378, DW_AT_name("R24_b2")
	.dwattr $C$DW$378, DW_AT_location[DW_OP_regx 0x62]

$C$DW$379	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$379, DW_AT_name("R24_b3")
	.dwattr $C$DW$379, DW_AT_location[DW_OP_regx 0x63]

$C$DW$380	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$380, DW_AT_name("R25_b0")
	.dwattr $C$DW$380, DW_AT_location[DW_OP_regx 0x64]

$C$DW$381	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$381, DW_AT_name("R25_b1")
	.dwattr $C$DW$381, DW_AT_location[DW_OP_regx 0x65]

$C$DW$382	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$382, DW_AT_name("R25_b2")
	.dwattr $C$DW$382, DW_AT_location[DW_OP_regx 0x66]

$C$DW$383	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$383, DW_AT_name("R25_b3")
	.dwattr $C$DW$383, DW_AT_location[DW_OP_regx 0x67]

$C$DW$384	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$384, DW_AT_name("R26_b0")
	.dwattr $C$DW$384, DW_AT_location[DW_OP_regx 0x68]

$C$DW$385	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$385, DW_AT_name("R26_b1")
	.dwattr $C$DW$385, DW_AT_location[DW_OP_regx 0x69]

$C$DW$386	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$386, DW_AT_name("R26_b2")
	.dwattr $C$DW$386, DW_AT_location[DW_OP_regx 0x6a]

$C$DW$387	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$387, DW_AT_name("R26_b3")
	.dwattr $C$DW$387, DW_AT_location[DW_OP_regx 0x6b]

$C$DW$388	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$388, DW_AT_name("R27_b0")
	.dwattr $C$DW$388, DW_AT_location[DW_OP_regx 0x6c]

$C$DW$389	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$389, DW_AT_name("R27_b1")
	.dwattr $C$DW$389, DW_AT_location[DW_OP_regx 0x6d]

$C$DW$390	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$390, DW_AT_name("R27_b2")
	.dwattr $C$DW$390, DW_AT_location[DW_OP_regx 0x6e]

$C$DW$391	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$391, DW_AT_name("R27_b3")
	.dwattr $C$DW$391, DW_AT_location[DW_OP_regx 0x6f]

$C$DW$392	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$392, DW_AT_name("R28_b0")
	.dwattr $C$DW$392, DW_AT_location[DW_OP_regx 0x70]

$C$DW$393	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$393, DW_AT_name("R28_b1")
	.dwattr $C$DW$393, DW_AT_location[DW_OP_regx 0x71]

$C$DW$394	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$394, DW_AT_name("R28_b2")
	.dwattr $C$DW$394, DW_AT_location[DW_OP_regx 0x72]

$C$DW$395	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$395, DW_AT_name("R28_b3")
	.dwattr $C$DW$395, DW_AT_location[DW_OP_regx 0x73]

$C$DW$396	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$396, DW_AT_name("R29_b0")
	.dwattr $C$DW$396, DW_AT_location[DW_OP_regx 0x74]

$C$DW$397	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$397, DW_AT_name("R29_b1")
	.dwattr $C$DW$397, DW_AT_location[DW_OP_regx 0x75]

$C$DW$398	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$398, DW_AT_name("R29_b2")
	.dwattr $C$DW$398, DW_AT_location[DW_OP_regx 0x76]

$C$DW$399	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$399, DW_AT_name("R29_b3")
	.dwattr $C$DW$399, DW_AT_location[DW_OP_regx 0x77]

$C$DW$400	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$400, DW_AT_name("R30_b0")
	.dwattr $C$DW$400, DW_AT_location[DW_OP_regx 0x78]

$C$DW$401	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$401, DW_AT_name("R30_b1")
	.dwattr $C$DW$401, DW_AT_location[DW_OP_regx 0x79]

$C$DW$402	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$402, DW_AT_name("R30_b2")
	.dwattr $C$DW$402, DW_AT_location[DW_OP_regx 0x7a]

$C$DW$403	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$403, DW_AT_name("R30_b3")
	.dwattr $C$DW$403, DW_AT_location[DW_OP_regx 0x7b]

$C$DW$404	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$404, DW_AT_name("R31_b0")
	.dwattr $C$DW$404, DW_AT_location[DW_OP_regx 0x7c]

$C$DW$405	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$405, DW_AT_name("R31_b1")
	.dwattr $C$DW$405, DW_AT_location[DW_OP_regx 0x7d]

$C$DW$406	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$406, DW_AT_name("R31_b2")
	.dwattr $C$DW$406, DW_AT_location[DW_OP_regx 0x7e]

$C$DW$407	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$407, DW_AT_name("R31_b3")
	.dwattr $C$DW$407, DW_AT_location[DW_OP_regx 0x7f]

	.dwendtag $C$DW$CU

