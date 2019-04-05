;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.3.1 *
;* Date/Time created: Sun Mar 31 20:55:39 2019                                *
;******************************************************************************
	.compiler_opts --abi=eabi --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("pru1_utils.c")
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
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$64)
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$1, DW_AT_decl_column(0x17)

	.global	||timeout_target||
	.common	||timeout_target||,4,1
$C$DW$2	.dwtag  DW_TAG_variable
	.dwattr $C$DW$2, DW_AT_name("timeout_target")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("timeout_target")
	.dwattr $C$DW$2, DW_AT_location[DW_OP_addr ||timeout_target||]
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_decl_file("pru1_utils.c")
	.dwattr $C$DW$2, DW_AT_decl_line(0x24)
	.dwattr $C$DW$2, DW_AT_decl_column(0x0a)

;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/optpru --gen_opt_info=2 /tmp/TI1mAsbx399 /tmp/TI1mA5Wcteq --opt_info_filename=/home/joerg/retrocmp/dec/UniBone/10.01_base/4_deploy/pru1_utils.nfo 
;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/acpiapru -@/tmp/TI1mAemBeuP 

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x04)
$C$DW$3	.dwtag  DW_TAG_member
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$3, DW_AT_name("REVID")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$3, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$3, DW_AT_bit_size(0x20)
	.dwattr $C$DW$3, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$3, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$3, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$3, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$3, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$19, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$19

$C$DW$T$37	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$19)


$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x04)
$C$DW$4	.dwtag  DW_TAG_member
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$4, DW_AT_name("IDLE_MODE")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("IDLE_MODE")
	.dwattr $C$DW$4, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$4, DW_AT_bit_size(0x02)
	.dwattr $C$DW$4, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$4, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$4, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$4, DW_AT_decl_line(0x37)
	.dwattr $C$DW$4, DW_AT_decl_column(0x0d)

$C$DW$5	.dwtag  DW_TAG_member
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$5, DW_AT_name("STANDBY_MODE")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("STANDBY_MODE")
	.dwattr $C$DW$5, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$5, DW_AT_bit_size(0x02)
	.dwattr $C$DW$5, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$5, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$5, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$5, DW_AT_decl_line(0x38)
	.dwattr $C$DW$5, DW_AT_decl_column(0x0d)

$C$DW$6	.dwtag  DW_TAG_member
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$6, DW_AT_name("STANDBY_INIT")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("STANDBY_INIT")
	.dwattr $C$DW$6, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$6, DW_AT_bit_size(0x01)
	.dwattr $C$DW$6, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$6, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$6, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$6, DW_AT_decl_line(0x39)
	.dwattr $C$DW$6, DW_AT_decl_column(0x0d)

$C$DW$7	.dwtag  DW_TAG_member
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$7, DW_AT_name("SUB_MWAIT")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("SUB_MWAIT")
	.dwattr $C$DW$7, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$7, DW_AT_bit_size(0x01)
	.dwattr $C$DW$7, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$7, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$7, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$7, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$7, DW_AT_decl_column(0x0d)

$C$DW$8	.dwtag  DW_TAG_member
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$8, DW_AT_name("rsvd6")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("rsvd6")
	.dwattr $C$DW$8, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$8, DW_AT_bit_size(0x1a)
	.dwattr $C$DW$8, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$8, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$8, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$8, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$8, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$20, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$20

$C$DW$T$39	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$20)


$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x04)
$C$DW$9	.dwtag  DW_TAG_member
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$9, DW_AT_name("PRU0_GPI_MODE")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("PRU0_GPI_MODE")
	.dwattr $C$DW$9, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$9, DW_AT_bit_size(0x02)
	.dwattr $C$DW$9, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$9, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$9, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$9, DW_AT_decl_line(0x45)
	.dwattr $C$DW$9, DW_AT_decl_column(0x0d)

$C$DW$10	.dwtag  DW_TAG_member
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$10, DW_AT_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$10, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$10, DW_AT_bit_size(0x01)
	.dwattr $C$DW$10, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$10, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$10, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$10, DW_AT_decl_line(0x46)
	.dwattr $C$DW$10, DW_AT_decl_column(0x0d)

$C$DW$11	.dwtag  DW_TAG_member
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$11, DW_AT_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$11, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$11, DW_AT_bit_size(0x05)
	.dwattr $C$DW$11, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$11, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$11, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$11, DW_AT_decl_line(0x47)
	.dwattr $C$DW$11, DW_AT_decl_column(0x0d)

$C$DW$12	.dwtag  DW_TAG_member
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$12, DW_AT_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$12, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$12, DW_AT_bit_size(0x05)
	.dwattr $C$DW$12, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$12, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$12, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$12, DW_AT_decl_line(0x48)
	.dwattr $C$DW$12, DW_AT_decl_column(0x0d)

$C$DW$13	.dwtag  DW_TAG_member
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$13, DW_AT_name("PRU0_GPI_SB")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("PRU0_GPI_SB")
	.dwattr $C$DW$13, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$13, DW_AT_bit_size(0x01)
	.dwattr $C$DW$13, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$13, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$13, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$13, DW_AT_decl_line(0x49)
	.dwattr $C$DW$13, DW_AT_decl_column(0x0d)

$C$DW$14	.dwtag  DW_TAG_member
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$14, DW_AT_name("PRU0_GPO_MODE")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("PRU0_GPO_MODE")
	.dwattr $C$DW$14, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$14, DW_AT_bit_size(0x01)
	.dwattr $C$DW$14, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$14, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$14, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$14, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$14, DW_AT_decl_column(0x0d)

$C$DW$15	.dwtag  DW_TAG_member
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$15, DW_AT_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$15, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$15, DW_AT_bit_size(0x05)
	.dwattr $C$DW$15, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$15, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$15, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$15, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$15, DW_AT_decl_column(0x0d)

$C$DW$16	.dwtag  DW_TAG_member
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$16, DW_AT_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$16, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$16, DW_AT_bit_size(0x05)
	.dwattr $C$DW$16, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$16, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$16, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$16, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$16, DW_AT_decl_column(0x0d)

$C$DW$17	.dwtag  DW_TAG_member
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$17, DW_AT_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$17, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$17, DW_AT_bit_size(0x01)
	.dwattr $C$DW$17, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$17, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$17, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$17, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$17, DW_AT_decl_column(0x0d)

$C$DW$18	.dwtag  DW_TAG_member
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$18, DW_AT_name("rsvd26")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$18, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$18, DW_AT_bit_size(0x06)
	.dwattr $C$DW$18, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$18, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$18, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$18, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$18, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$21, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$21

$C$DW$T$41	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$41, DW_AT_type(*$C$DW$T$21)


$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x04)
$C$DW$19	.dwtag  DW_TAG_member
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$19, DW_AT_name("PRU1_GPI_MODE")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("PRU1_GPI_MODE")
	.dwattr $C$DW$19, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$19, DW_AT_bit_size(0x02)
	.dwattr $C$DW$19, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$19, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$19, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$19, DW_AT_decl_line(0x58)
	.dwattr $C$DW$19, DW_AT_decl_column(0x0d)

$C$DW$20	.dwtag  DW_TAG_member
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$20, DW_AT_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$20, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$20, DW_AT_bit_size(0x01)
	.dwattr $C$DW$20, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$20, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$20, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$20, DW_AT_decl_line(0x59)
	.dwattr $C$DW$20, DW_AT_decl_column(0x0d)

$C$DW$21	.dwtag  DW_TAG_member
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$21, DW_AT_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$21, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$21, DW_AT_bit_size(0x05)
	.dwattr $C$DW$21, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$21, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$21, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$21, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$21, DW_AT_decl_column(0x0d)

$C$DW$22	.dwtag  DW_TAG_member
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$22, DW_AT_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$22, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$22, DW_AT_bit_size(0x05)
	.dwattr $C$DW$22, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$22, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$22, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$22, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$22, DW_AT_decl_column(0x0d)

$C$DW$23	.dwtag  DW_TAG_member
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$23, DW_AT_name("PRU1_GPI_SB")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("PRU1_GPI_SB")
	.dwattr $C$DW$23, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$23, DW_AT_bit_size(0x01)
	.dwattr $C$DW$23, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$23, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$23, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$23, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$23, DW_AT_decl_column(0x0d)

$C$DW$24	.dwtag  DW_TAG_member
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$24, DW_AT_name("PRU1_GPO_MODE")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("PRU1_GPO_MODE")
	.dwattr $C$DW$24, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$24, DW_AT_bit_size(0x01)
	.dwattr $C$DW$24, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$24, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$24, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$24, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$24, DW_AT_decl_column(0x0d)

$C$DW$25	.dwtag  DW_TAG_member
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$25, DW_AT_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$25, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$25, DW_AT_bit_size(0x05)
	.dwattr $C$DW$25, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$25, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$25, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$25, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$25, DW_AT_decl_column(0x0d)

$C$DW$26	.dwtag  DW_TAG_member
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$26, DW_AT_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$26, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$26, DW_AT_bit_size(0x05)
	.dwattr $C$DW$26, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$26, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$26, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$26, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$26, DW_AT_decl_column(0x0d)

$C$DW$27	.dwtag  DW_TAG_member
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$27, DW_AT_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$27, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$27, DW_AT_bit_size(0x01)
	.dwattr $C$DW$27, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$27, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$27, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$27, DW_AT_decl_line(0x60)
	.dwattr $C$DW$27, DW_AT_decl_column(0x0d)

$C$DW$28	.dwtag  DW_TAG_member
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$28, DW_AT_name("rsvd26")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$28, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$28, DW_AT_bit_size(0x06)
	.dwattr $C$DW$28, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$28, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$28, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$28, DW_AT_decl_line(0x61)
	.dwattr $C$DW$28, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$22, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$22

$C$DW$T$43	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$43, DW_AT_type(*$C$DW$T$22)


$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x04)
$C$DW$29	.dwtag  DW_TAG_member
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$29, DW_AT_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$29, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$29, DW_AT_bit_size(0x01)
	.dwattr $C$DW$29, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$29, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$29, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$29, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$29, DW_AT_decl_column(0x0d)

$C$DW$30	.dwtag  DW_TAG_member
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$30, DW_AT_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$30, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$30, DW_AT_bit_size(0x01)
	.dwattr $C$DW$30, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$30, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$30, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$30, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$30, DW_AT_decl_column(0x0d)

$C$DW$31	.dwtag  DW_TAG_member
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$31, DW_AT_name("PRU0_CLK_EN")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("PRU0_CLK_EN")
	.dwattr $C$DW$31, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$31, DW_AT_bit_size(0x01)
	.dwattr $C$DW$31, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$31, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$31, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$31, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$31, DW_AT_decl_column(0x0d)

$C$DW$32	.dwtag  DW_TAG_member
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$32, DW_AT_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$32, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$32, DW_AT_bit_size(0x01)
	.dwattr $C$DW$32, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$32, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$32, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$32, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$32, DW_AT_decl_column(0x0d)

$C$DW$33	.dwtag  DW_TAG_member
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$33, DW_AT_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$33, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$33, DW_AT_bit_size(0x01)
	.dwattr $C$DW$33, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$33, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$33, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$33, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$33, DW_AT_decl_column(0x0d)

$C$DW$34	.dwtag  DW_TAG_member
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$34, DW_AT_name("PRU1_CLK_EN")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("PRU1_CLK_EN")
	.dwattr $C$DW$34, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$34, DW_AT_bit_size(0x01)
	.dwattr $C$DW$34, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$34, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$34, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$34, DW_AT_decl_line(0x70)
	.dwattr $C$DW$34, DW_AT_decl_column(0x0d)

$C$DW$35	.dwtag  DW_TAG_member
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$35, DW_AT_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$35, DW_AT_bit_offset(0x19)
	.dwattr $C$DW$35, DW_AT_bit_size(0x01)
	.dwattr $C$DW$35, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$35, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$35, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$35, DW_AT_decl_line(0x71)
	.dwattr $C$DW$35, DW_AT_decl_column(0x0d)

$C$DW$36	.dwtag  DW_TAG_member
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$36, DW_AT_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$36, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$36, DW_AT_bit_size(0x01)
	.dwattr $C$DW$36, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$36, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$36, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$36, DW_AT_decl_line(0x72)
	.dwattr $C$DW$36, DW_AT_decl_column(0x0d)

$C$DW$37	.dwtag  DW_TAG_member
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$37, DW_AT_name("INTC_CLK_EN")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("INTC_CLK_EN")
	.dwattr $C$DW$37, DW_AT_bit_offset(0x17)
	.dwattr $C$DW$37, DW_AT_bit_size(0x01)
	.dwattr $C$DW$37, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$37, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$37, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$37, DW_AT_decl_line(0x73)
	.dwattr $C$DW$37, DW_AT_decl_column(0x0d)

$C$DW$38	.dwtag  DW_TAG_member
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$38, DW_AT_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$38, DW_AT_bit_offset(0x16)
	.dwattr $C$DW$38, DW_AT_bit_size(0x01)
	.dwattr $C$DW$38, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$38, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$38, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$38, DW_AT_decl_line(0x74)
	.dwattr $C$DW$38, DW_AT_decl_column(0x0d)

$C$DW$39	.dwtag  DW_TAG_member
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$39, DW_AT_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$39, DW_AT_bit_offset(0x15)
	.dwattr $C$DW$39, DW_AT_bit_size(0x01)
	.dwattr $C$DW$39, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$39, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$39, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$39, DW_AT_decl_line(0x75)
	.dwattr $C$DW$39, DW_AT_decl_column(0x0d)

$C$DW$40	.dwtag  DW_TAG_member
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$40, DW_AT_name("UART_CLK_EN")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("UART_CLK_EN")
	.dwattr $C$DW$40, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$40, DW_AT_bit_size(0x01)
	.dwattr $C$DW$40, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$40, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$40, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$40, DW_AT_decl_line(0x76)
	.dwattr $C$DW$40, DW_AT_decl_column(0x0d)

$C$DW$41	.dwtag  DW_TAG_member
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$41, DW_AT_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$41, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$41, DW_AT_bit_size(0x01)
	.dwattr $C$DW$41, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$41, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$41, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$41, DW_AT_decl_line(0x77)
	.dwattr $C$DW$41, DW_AT_decl_column(0x0d)

$C$DW$42	.dwtag  DW_TAG_member
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$42, DW_AT_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$42, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$42, DW_AT_bit_size(0x01)
	.dwattr $C$DW$42, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$42, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$42, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$42, DW_AT_decl_line(0x78)
	.dwattr $C$DW$42, DW_AT_decl_column(0x0d)

$C$DW$43	.dwtag  DW_TAG_member
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$43, DW_AT_name("ECAP_CLK_EN")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("ECAP_CLK_EN")
	.dwattr $C$DW$43, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$43, DW_AT_bit_size(0x01)
	.dwattr $C$DW$43, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$43, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$43, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$43, DW_AT_decl_line(0x79)
	.dwattr $C$DW$43, DW_AT_decl_column(0x0d)

$C$DW$44	.dwtag  DW_TAG_member
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$44, DW_AT_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$44, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$44, DW_AT_bit_size(0x01)
	.dwattr $C$DW$44, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$44, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$44, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$44, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$44, DW_AT_decl_column(0x0d)

$C$DW$45	.dwtag  DW_TAG_member
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$45, DW_AT_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$45, DW_AT_bit_offset(0x0f)
	.dwattr $C$DW$45, DW_AT_bit_size(0x01)
	.dwattr $C$DW$45, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$45, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$45, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$45, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$45, DW_AT_decl_column(0x0d)

$C$DW$46	.dwtag  DW_TAG_member
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$46, DW_AT_name("IEP_CLK_EN")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("IEP_CLK_EN")
	.dwattr $C$DW$46, DW_AT_bit_offset(0x0e)
	.dwattr $C$DW$46, DW_AT_bit_size(0x01)
	.dwattr $C$DW$46, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$46, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$46, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$46, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$46, DW_AT_decl_column(0x0d)

$C$DW$47	.dwtag  DW_TAG_member
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$47, DW_AT_name("rsvd18")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("rsvd18")
	.dwattr $C$DW$47, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$47, DW_AT_bit_size(0x0e)
	.dwattr $C$DW$47, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$47, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$47, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$47, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$47, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$23, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$23

$C$DW$T$45	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$23)


$C$DW$T$24	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x04)
$C$DW$48	.dwtag  DW_TAG_member
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$48, DW_AT_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$48, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$48, DW_AT_bit_size(0x04)
	.dwattr $C$DW$48, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$48, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$48, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$48, DW_AT_decl_line(0x87)
	.dwattr $C$DW$48, DW_AT_decl_column(0x0d)

$C$DW$49	.dwtag  DW_TAG_member
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$49, DW_AT_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$49, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$49, DW_AT_bit_size(0x04)
	.dwattr $C$DW$49, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$49, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$49, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$49, DW_AT_decl_line(0x88)
	.dwattr $C$DW$49, DW_AT_decl_column(0x0d)

$C$DW$50	.dwtag  DW_TAG_member
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$50, DW_AT_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$50, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$50, DW_AT_bit_size(0x04)
	.dwattr $C$DW$50, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$50, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$50, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$50, DW_AT_decl_line(0x89)
	.dwattr $C$DW$50, DW_AT_decl_column(0x0d)

$C$DW$51	.dwtag  DW_TAG_member
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$51, DW_AT_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$51, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$51, DW_AT_bit_size(0x04)
	.dwattr $C$DW$51, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$51, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$51, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$51, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$51, DW_AT_decl_column(0x0d)

$C$DW$52	.dwtag  DW_TAG_member
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$52, DW_AT_name("RAM_PE_RAW")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("RAM_PE_RAW")
	.dwattr $C$DW$52, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$52, DW_AT_bit_size(0x04)
	.dwattr $C$DW$52, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$52, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$52, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$52, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$52, DW_AT_decl_column(0x0d)

$C$DW$53	.dwtag  DW_TAG_member
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$53, DW_AT_name("rsvd20")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$53, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$53, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$53, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$53, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$53, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$53, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$53, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$24, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x86)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$24

$C$DW$T$47	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$47, DW_AT_type(*$C$DW$T$24)


$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x04)
$C$DW$54	.dwtag  DW_TAG_member
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$54, DW_AT_name("PRU0_IMEM_PE")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("PRU0_IMEM_PE")
	.dwattr $C$DW$54, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$54, DW_AT_bit_size(0x04)
	.dwattr $C$DW$54, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$54, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$54, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$54, DW_AT_decl_line(0x96)
	.dwattr $C$DW$54, DW_AT_decl_column(0x0d)

$C$DW$55	.dwtag  DW_TAG_member
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$55, DW_AT_name("PRU0_DMEM_PE")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("PRU0_DMEM_PE")
	.dwattr $C$DW$55, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$55, DW_AT_bit_size(0x04)
	.dwattr $C$DW$55, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$55, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$55, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$55, DW_AT_decl_line(0x97)
	.dwattr $C$DW$55, DW_AT_decl_column(0x0d)

$C$DW$56	.dwtag  DW_TAG_member
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$56, DW_AT_name("PRU1_IMEM_PE")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("PRU1_IMEM_PE")
	.dwattr $C$DW$56, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$56, DW_AT_bit_size(0x04)
	.dwattr $C$DW$56, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$56, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$56, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$56, DW_AT_decl_line(0x98)
	.dwattr $C$DW$56, DW_AT_decl_column(0x0d)

$C$DW$57	.dwtag  DW_TAG_member
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$57, DW_AT_name("PRU1_DMEM_PE")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("PRU1_DMEM_PE")
	.dwattr $C$DW$57, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$57, DW_AT_bit_size(0x04)
	.dwattr $C$DW$57, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$57, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$57, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$57, DW_AT_decl_line(0x99)
	.dwattr $C$DW$57, DW_AT_decl_column(0x0d)

$C$DW$58	.dwtag  DW_TAG_member
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$58, DW_AT_name("RAM_PE")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("RAM_PE")
	.dwattr $C$DW$58, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$58, DW_AT_bit_size(0x04)
	.dwattr $C$DW$58, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$58, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$58, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$58, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$58, DW_AT_decl_column(0x0d)

$C$DW$59	.dwtag  DW_TAG_member
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$59, DW_AT_name("rsvd20")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$59, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$59, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$59, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$59, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$59, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$59, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$59, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$25, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$25

$C$DW$T$49	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$49, DW_AT_type(*$C$DW$T$25)


$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x04)
$C$DW$60	.dwtag  DW_TAG_member
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$60, DW_AT_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$60, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$60, DW_AT_bit_size(0x04)
	.dwattr $C$DW$60, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$60, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$60, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$60, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$60, DW_AT_decl_column(0x0d)

$C$DW$61	.dwtag  DW_TAG_member
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$61, DW_AT_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$61, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$61, DW_AT_bit_size(0x04)
	.dwattr $C$DW$61, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$61, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$61, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$61, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$61, DW_AT_decl_column(0x0d)

$C$DW$62	.dwtag  DW_TAG_member
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$62, DW_AT_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$62, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$62, DW_AT_bit_size(0x04)
	.dwattr $C$DW$62, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$62, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$62, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$62, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$62, DW_AT_decl_column(0x0d)

$C$DW$63	.dwtag  DW_TAG_member
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$63, DW_AT_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$63, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$63, DW_AT_bit_size(0x04)
	.dwattr $C$DW$63, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$63, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$63, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$63, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$63, DW_AT_decl_column(0x0d)

$C$DW$64	.dwtag  DW_TAG_member
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$64, DW_AT_name("RAM_PE_SET")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("RAM_PE_SET")
	.dwattr $C$DW$64, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$64, DW_AT_bit_size(0x04)
	.dwattr $C$DW$64, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$64, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$64, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$64, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$64, DW_AT_decl_column(0x0d)

$C$DW$65	.dwtag  DW_TAG_member
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$65, DW_AT_name("rsvd20")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$65, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$65, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$65, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$65, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$65, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$65, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$65, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$26, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$26

$C$DW$T$51	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$26)


$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x04)
$C$DW$66	.dwtag  DW_TAG_member
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$66, DW_AT_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$66, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$66, DW_AT_bit_size(0x04)
	.dwattr $C$DW$66, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$66, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$66, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$66, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$66, DW_AT_decl_column(0x0d)

$C$DW$67	.dwtag  DW_TAG_member
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$67, DW_AT_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$67, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$67, DW_AT_bit_size(0x04)
	.dwattr $C$DW$67, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$67, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$67, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$67, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$67, DW_AT_decl_column(0x0d)

$C$DW$68	.dwtag  DW_TAG_member
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$68, DW_AT_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$68, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$68, DW_AT_bit_size(0x04)
	.dwattr $C$DW$68, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$68, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$68, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$68, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$68, DW_AT_decl_column(0x0d)

$C$DW$69	.dwtag  DW_TAG_member
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$69, DW_AT_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$69, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$69, DW_AT_bit_size(0x04)
	.dwattr $C$DW$69, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$69, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$69, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$69, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$69, DW_AT_decl_column(0x0d)

$C$DW$70	.dwtag  DW_TAG_member
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$70, DW_AT_name("rsvd16")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$70, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$70, DW_AT_bit_size(0x10)
	.dwattr $C$DW$70, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$70, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$70, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$70, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$70, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$27, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$27

$C$DW$T$53	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$27)


$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x04)
$C$DW$71	.dwtag  DW_TAG_member
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$71, DW_AT_name("PMAO_PRU0")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("PMAO_PRU0")
	.dwattr $C$DW$71, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$71, DW_AT_bit_size(0x01)
	.dwattr $C$DW$71, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$71, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$71, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$71, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$71, DW_AT_decl_column(0x0d)

$C$DW$72	.dwtag  DW_TAG_member
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$72, DW_AT_name("PMAO_PRU1")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("PMAO_PRU1")
	.dwattr $C$DW$72, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$72, DW_AT_bit_size(0x01)
	.dwattr $C$DW$72, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$72, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$72, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$72, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$72, DW_AT_decl_column(0x0d)

$C$DW$73	.dwtag  DW_TAG_member
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$73, DW_AT_name("rsvd2")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$73, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$73, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$73, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$73, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$73, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$73, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$73, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$28, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$28

$C$DW$T$55	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$28)


$C$DW$T$29	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x04)
$C$DW$74	.dwtag  DW_TAG_member
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$74, DW_AT_name("OCP_EN")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("OCP_EN")
	.dwattr $C$DW$74, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$74, DW_AT_bit_size(0x01)
	.dwattr $C$DW$74, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$74, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$74, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$74, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$74, DW_AT_decl_column(0x0d)

$C$DW$75	.dwtag  DW_TAG_member
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$75, DW_AT_name("rsvd1")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$75, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$75, DW_AT_bit_size(0x1f)
	.dwattr $C$DW$75, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$75, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$75, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$75, DW_AT_decl_line(0xd4)
	.dwattr $C$DW$75, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$29, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$29, DW_AT_decl_line(0xd2)
	.dwattr $C$DW$T$29, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$29

$C$DW$T$57	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$29)


$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x04)
$C$DW$76	.dwtag  DW_TAG_member
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$76, DW_AT_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$76, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$76, DW_AT_bit_size(0x01)
	.dwattr $C$DW$76, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$76, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$76, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$76, DW_AT_decl_line(0xde)
	.dwattr $C$DW$76, DW_AT_decl_column(0x0d)

$C$DW$77	.dwtag  DW_TAG_member
	.dwattr $C$DW$77, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$77, DW_AT_name("XFR_SHIFT_EN")
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("XFR_SHIFT_EN")
	.dwattr $C$DW$77, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$77, DW_AT_bit_size(0x01)
	.dwattr $C$DW$77, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$77, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$77, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$77, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$77, DW_AT_decl_column(0x0d)

$C$DW$78	.dwtag  DW_TAG_member
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$78, DW_AT_name("rsvd2")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$78, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$78, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$78, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$78, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$78, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$78, DW_AT_decl_line(0xe0)
	.dwattr $C$DW$78, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$30, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$30

$C$DW$T$59	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$30)


$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x04)
$C$DW$79	.dwtag  DW_TAG_member
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$79, DW_AT_name("PIN_MUX_SEL")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("PIN_MUX_SEL")
	.dwattr $C$DW$79, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$79, DW_AT_bit_size(0x08)
	.dwattr $C$DW$79, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$79, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$79, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$79, DW_AT_decl_line(0xec)
	.dwattr $C$DW$79, DW_AT_decl_column(0x0d)

$C$DW$80	.dwtag  DW_TAG_member
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$80, DW_AT_name("rsvd2")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$80, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$80, DW_AT_bit_size(0x18)
	.dwattr $C$DW$80, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$80, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$80, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$80, DW_AT_decl_line(0xed)
	.dwattr $C$DW$80, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$31, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$31

$C$DW$T$61	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$61, DW_AT_type(*$C$DW$T$31)


$C$DW$T$35	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x44)
$C$DW$81	.dwtag  DW_TAG_member
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$81, DW_AT_name("$P$T0")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$81, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$81, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$81, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$81, DW_AT_decl_line(0x29)
	.dwattr $C$DW$81, DW_AT_decl_column(0x02)

$C$DW$82	.dwtag  DW_TAG_member
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$82, DW_AT_name("$P$T1")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$82, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$82, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$82, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$82, DW_AT_decl_line(0x33)
	.dwattr $C$DW$82, DW_AT_decl_column(0x02)

$C$DW$83	.dwtag  DW_TAG_member
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$83, DW_AT_name("$P$T2")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$83, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$83, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$83, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$83, DW_AT_decl_line(0x41)
	.dwattr $C$DW$83, DW_AT_decl_column(0x02)

$C$DW$84	.dwtag  DW_TAG_member
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$84, DW_AT_name("$P$T3")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$84, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$84, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$84, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$84, DW_AT_decl_line(0x54)
	.dwattr $C$DW$84, DW_AT_decl_column(0x02)

$C$DW$85	.dwtag  DW_TAG_member
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$85, DW_AT_name("$P$T4")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$85, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$85, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$85, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$85, DW_AT_decl_line(0x67)
	.dwattr $C$DW$85, DW_AT_decl_column(0x02)

$C$DW$86	.dwtag  DW_TAG_member
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$48)
	.dwattr $C$DW$86, DW_AT_name("$P$T5")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$86, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$86, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$86, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$86, DW_AT_decl_line(0x83)
	.dwattr $C$DW$86, DW_AT_decl_column(0x02)

$C$DW$87	.dwtag  DW_TAG_member
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$87, DW_AT_name("$P$T6")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$87, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$87, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$87, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$87, DW_AT_decl_line(0x92)
	.dwattr $C$DW$87, DW_AT_decl_column(0x02)

$C$DW$88	.dwtag  DW_TAG_member
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$88, DW_AT_name("$P$T7")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$88, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$88, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$88, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$88, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$88, DW_AT_decl_column(0x02)

$C$DW$89	.dwtag  DW_TAG_member
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$89, DW_AT_name("$P$T8")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$89, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$89, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$89, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$89, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$89, DW_AT_decl_column(0x02)

$C$DW$90	.dwtag  DW_TAG_member
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$90, DW_AT_name("rsvd24")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$90, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$90, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$90, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$90, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$90, DW_AT_decl_column(0x0b)

$C$DW$91	.dwtag  DW_TAG_member
	.dwattr $C$DW$91, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$91, DW_AT_name("$P$T9")
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("$P$T9")
	.dwattr $C$DW$91, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$91, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$91, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$91, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$91, DW_AT_decl_column(0x02)

$C$DW$92	.dwtag  DW_TAG_member
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$92, DW_AT_name("rsvd2c")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("rsvd2c")
	.dwattr $C$DW$92, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$92, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$92, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$92, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$92, DW_AT_decl_column(0x0b)

$C$DW$93	.dwtag  DW_TAG_member
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$93, DW_AT_name("$P$T10")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("$P$T10")
	.dwattr $C$DW$93, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$93, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$93, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$93, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$93, DW_AT_decl_column(0x02)

$C$DW$94	.dwtag  DW_TAG_member
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$94, DW_AT_name("$P$T11")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("$P$T11")
	.dwattr $C$DW$94, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$94, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$94, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$94, DW_AT_decl_line(0xda)
	.dwattr $C$DW$94, DW_AT_decl_column(0x02)

$C$DW$95	.dwtag  DW_TAG_member
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$95, DW_AT_name("rsvd38")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("rsvd38")
	.dwattr $C$DW$95, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$95, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$95, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$95, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$95, DW_AT_decl_column(0x0b)

$C$DW$96	.dwtag  DW_TAG_member
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$96, DW_AT_name("$P$T12")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("$P$T12")
	.dwattr $C$DW$96, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$96, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$96, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$96, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$96, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$35, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$35

$C$DW$T$63	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$63, DW_AT_name("pruCfg")
	.dwattr $C$DW$T$63, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$63, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$63, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0xf0)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x03)

$C$DW$T$64	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$63)


$C$DW$T$38	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x04)
$C$DW$97	.dwtag  DW_TAG_member
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$97, DW_AT_name("REVID")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$97, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$97, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$97, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$97, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$97, DW_AT_decl_column(0x15)

$C$DW$98	.dwtag  DW_TAG_member
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$98, DW_AT_name("REVID_bit")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$98, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$98, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$98, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$98, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$98, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$38, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$38, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$38, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$38


$C$DW$T$40	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x04)
$C$DW$99	.dwtag  DW_TAG_member
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$99, DW_AT_name("SYSCFG")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("SYSCFG")
	.dwattr $C$DW$99, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$99, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$99, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$99, DW_AT_decl_line(0x34)
	.dwattr $C$DW$99, DW_AT_decl_column(0x15)

$C$DW$100	.dwtag  DW_TAG_member
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$100, DW_AT_name("SYSCFG_bit")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("SYSCFG_bit")
	.dwattr $C$DW$100, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$100, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$100, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$100, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$100, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$40, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$40, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$40, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$40


$C$DW$T$42	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$42, DW_AT_byte_size(0x04)
$C$DW$101	.dwtag  DW_TAG_member
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$101, DW_AT_name("GPCFG0")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("GPCFG0")
	.dwattr $C$DW$101, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$101, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$101, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$101, DW_AT_decl_line(0x42)
	.dwattr $C$DW$101, DW_AT_decl_column(0x15)

$C$DW$102	.dwtag  DW_TAG_member
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$102, DW_AT_name("GPCFG0_bit")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("GPCFG0_bit")
	.dwattr $C$DW$102, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$102, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$102, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$102, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$102, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$42, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$42


$C$DW$T$44	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x04)
$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$103, DW_AT_name("GPCFG1")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("GPCFG1")
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$103, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$103, DW_AT_decl_line(0x55)
	.dwattr $C$DW$103, DW_AT_decl_column(0x15)

$C$DW$104	.dwtag  DW_TAG_member
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$104, DW_AT_name("GPCFG1_bit")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("GPCFG1_bit")
	.dwattr $C$DW$104, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$104, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$104, DW_AT_decl_line(0x62)
	.dwattr $C$DW$104, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$44, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$44


$C$DW$T$46	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x04)
$C$DW$105	.dwtag  DW_TAG_member
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$105, DW_AT_name("CGR")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("CGR")
	.dwattr $C$DW$105, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$105, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$105, DW_AT_decl_line(0x68)
	.dwattr $C$DW$105, DW_AT_decl_column(0x15)

$C$DW$106	.dwtag  DW_TAG_member
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$106, DW_AT_name("CGR_bit")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("CGR_bit")
	.dwattr $C$DW$106, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$106, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$106, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$106, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$46, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$46, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$46, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$46


$C$DW$T$48	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$48, DW_AT_byte_size(0x04)
$C$DW$107	.dwtag  DW_TAG_member
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$107, DW_AT_name("ISRP")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("ISRP")
	.dwattr $C$DW$107, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$107, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$107, DW_AT_decl_line(0x84)
	.dwattr $C$DW$107, DW_AT_decl_column(0x15)

$C$DW$108	.dwtag  DW_TAG_member
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$108, DW_AT_name("ISRP_bit")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("ISRP_bit")
	.dwattr $C$DW$108, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$108, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$108, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$108, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$108, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$48, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$48, DW_AT_decl_line(0x83)
	.dwattr $C$DW$T$48, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$48


$C$DW$T$50	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$50, DW_AT_byte_size(0x04)
$C$DW$109	.dwtag  DW_TAG_member
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$109, DW_AT_name("ISP")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("ISP")
	.dwattr $C$DW$109, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$109, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$109, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$109, DW_AT_decl_line(0x93)
	.dwattr $C$DW$109, DW_AT_decl_column(0x15)

$C$DW$110	.dwtag  DW_TAG_member
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$110, DW_AT_name("ISP_bit")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("ISP_bit")
	.dwattr $C$DW$110, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$110, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$110, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$110, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$110, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$50, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$50, DW_AT_decl_line(0x92)
	.dwattr $C$DW$T$50, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$50


$C$DW$T$52	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$52, DW_AT_byte_size(0x04)
$C$DW$111	.dwtag  DW_TAG_member
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$111, DW_AT_name("IESP")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("IESP")
	.dwattr $C$DW$111, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$111, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$111, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$111, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$111, DW_AT_decl_column(0x15)

$C$DW$112	.dwtag  DW_TAG_member
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$112, DW_AT_name("IESP_bit")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("IESP_bit")
	.dwattr $C$DW$112, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$112, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$112, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$112, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$112, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$52, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$52, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$52, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$52


$C$DW$T$54	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x04)
$C$DW$113	.dwtag  DW_TAG_member
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$113, DW_AT_name("IECP")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("IECP")
	.dwattr $C$DW$113, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$113, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$113, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$113, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$113, DW_AT_decl_column(0x15)

$C$DW$114	.dwtag  DW_TAG_member
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$114, DW_AT_name("IECP_bit")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("IECP_bit")
	.dwattr $C$DW$114, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$114, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$114, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$114, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$114, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$54, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$54, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$54, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$54


$C$DW$T$56	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$56, DW_AT_byte_size(0x04)
$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$115, DW_AT_name("PMAO")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("PMAO")
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$115, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$115, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$115, DW_AT_decl_column(0x15)

$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$116, DW_AT_name("PMAO_bit")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("PMAO_bit")
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$116, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$116, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$116, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$56, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$56, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$T$56, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$56


$C$DW$T$58	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x04)
$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$117, DW_AT_name("IEPCLK")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("IEPCLK")
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$117, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$117, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$117, DW_AT_decl_column(0x15)

$C$DW$118	.dwtag  DW_TAG_member
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$118, DW_AT_name("IEPCLK_bit")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("IEPCLK_bit")
	.dwattr $C$DW$118, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$118, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$118, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$118, DW_AT_decl_line(0xd5)
	.dwattr $C$DW$118, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$58, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$58


$C$DW$T$60	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$60, DW_AT_byte_size(0x04)
$C$DW$119	.dwtag  DW_TAG_member
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$119, DW_AT_name("SPP")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("SPP")
	.dwattr $C$DW$119, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$119, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$119, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$119, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$119, DW_AT_decl_column(0x15)

$C$DW$120	.dwtag  DW_TAG_member
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$120, DW_AT_name("SPP_bit")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("SPP_bit")
	.dwattr $C$DW$120, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$120, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$120, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$120, DW_AT_decl_line(0xe1)
	.dwattr $C$DW$120, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$60, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$60, DW_AT_decl_line(0xda)
	.dwattr $C$DW$T$60, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$60


$C$DW$T$62	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$62, DW_AT_byte_size(0x04)
$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$121, DW_AT_name("PIN_MX")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("PIN_MX")
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$121, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$121, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$121, DW_AT_decl_column(0x15)

$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$122, DW_AT_name("PIN_MX_bit")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("PIN_MX_bit")
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$122, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$122, DW_AT_decl_line(0xee)
	.dwattr $C$DW$122, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$62, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$62

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
$C$DW$123	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$123, DW_AT_upper_bound(0x00)

	.dwendtag $C$DW$T$33


$C$DW$T$34	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_byte_size(0x08)
$C$DW$124	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$124, DW_AT_upper_bound(0x01)

	.dwendtag $C$DW$T$34

$C$DW$T$36	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$32)

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
	.dwendtag $C$DW$CU

