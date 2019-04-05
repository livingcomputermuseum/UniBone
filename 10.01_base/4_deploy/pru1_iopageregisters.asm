;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.3.1 *
;* Date/Time created: Sun Mar 31 20:55:32 2019                                *
;******************************************************************************
	.compiler_opts --abi=eabi --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("pru1_iopageregisters.c")
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
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$96)
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$1, DW_AT_decl_column(0x17)

$C$DW$2	.dwtag  DW_TAG_variable
	.dwattr $C$DW$2, DW_AT_name("mailbox")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("mailbox")
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$104)
	.dwattr $C$DW$2, DW_AT_declaration
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$2, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$2, DW_AT_decl_column(0x1f)

	.global	||deviceregisters||
||deviceregisters||:	.usect	".deviceregisters_sec",6176,1
$C$DW$3	.dwtag  DW_TAG_variable
	.dwattr $C$DW$3, DW_AT_name("deviceregisters")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("deviceregisters")
	.dwattr $C$DW$3, DW_AT_location[DW_OP_addr ||deviceregisters||]
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$108)
	.dwattr $C$DW$3, DW_AT_external
	.dwattr $C$DW$3, DW_AT_decl_file("pru1_iopageregisters.c")
	.dwattr $C$DW$3, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$3, DW_AT_decl_column(0x13)


$C$DW$4	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$4, DW_AT_name("__delay_cycles")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("__delay_cycles")
	.dwattr $C$DW$4, DW_AT_declaration
	.dwattr $C$DW$4, DW_AT_external
$C$DW$5	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$11)

	.dwendtag $C$DW$4

;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/optpru --gen_opt_info=2 /tmp/TI1jPxG1X1l /tmp/TI1jPMMYWIu --opt_info_filename=/home/joerg/retrocmp/dec/UniBone/10.01_base/4_deploy/pru1_iopageregisters.nfo 
;	/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//bin/acpiapru -@/tmp/TI1jP3jTN9Y 
	.sect	".text:iopageregisters_write_w"
	.clink
	.global	||iopageregisters_write_w||

$C$DW$6	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$6, DW_AT_name("iopageregisters_write_w")
	.dwattr $C$DW$6, DW_AT_low_pc(||iopageregisters_write_w||)
	.dwattr $C$DW$6, DW_AT_high_pc(0x00)
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("iopageregisters_write_w")
	.dwattr $C$DW$6, DW_AT_external
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$6, DW_AT_TI_begin_file("pru1_iopageregisters.c")
	.dwattr $C$DW$6, DW_AT_TI_begin_line(0x55)
	.dwattr $C$DW$6, DW_AT_TI_begin_column(0x09)
	.dwattr $C$DW$6, DW_AT_decl_file("pru1_iopageregisters.c")
	.dwattr $C$DW$6, DW_AT_decl_line(0x55)
	.dwattr $C$DW$6, DW_AT_decl_column(0x09)
	.dwattr $C$DW$6, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru1_iopageregisters.c",line 85,column 60,is_stmt,address ||iopageregisters_write_w||,isa 0

	.dwfde $C$DW$CIE, ||iopageregisters_write_w||
$C$DW$7	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$7, DW_AT_name("addr")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$7, DW_AT_location[DW_OP_regx 0x38]

$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_name("w")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("w")
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$8, DW_AT_location[DW_OP_regx 0x3c]

;----------------------------------------------------------------------
;  85 | uint8_t iopageregisters_write_w(uint32_t addr, uint16_t w) {           
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: iopageregisters_write_w       FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||iopageregisters_write_w||:
;* --------------------------------------------------------------------------*
;* r0_0  assigned to $O$C1
$C$DW$9	.dwtag  DW_TAG_variable
	.dwattr $C$DW$9, DW_AT_name("$O$C1")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$102)
	.dwattr $C$DW$9, DW_AT_location[DW_OP_reg0]

;* r0_0  assigned to $O$C2
$C$DW$10	.dwtag  DW_TAG_variable
	.dwattr $C$DW$10, DW_AT_name("$O$C2")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$10, DW_AT_location[DW_OP_reg0]

;* r1_0  assigned to $O$C3
$C$DW$11	.dwtag  DW_TAG_variable
	.dwattr $C$DW$11, DW_AT_name("$O$C3")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$11, DW_AT_location[DW_OP_reg4]

;* r17_0 assigned to $O$C4
$C$DW$12	.dwtag  DW_TAG_variable
	.dwattr $C$DW$12, DW_AT_name("$O$C4")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("$O$C4")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$12, DW_AT_location[DW_OP_regx 0x44]

;* r1_0  assigned to $O$C5
$C$DW$13	.dwtag  DW_TAG_variable
	.dwattr $C$DW$13, DW_AT_name("$O$C5")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("$O$C5")
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$13, DW_AT_location[DW_OP_reg4]

;* r0_0  assigned to $O$K5
$C$DW$14	.dwtag  DW_TAG_variable
	.dwattr $C$DW$14, DW_AT_name("$O$K5")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("$O$K5")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$117)
	.dwattr $C$DW$14, DW_AT_location[DW_OP_reg0]

;* r14_0 assigned to addr
$C$DW$15	.dwtag  DW_TAG_variable
	.dwattr $C$DW$15, DW_AT_name("addr")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$134)
	.dwattr $C$DW$15, DW_AT_location[DW_OP_regx 0x38]

;* r15_0 assigned to w
$C$DW$16	.dwtag  DW_TAG_variable
	.dwattr $C$DW$16, DW_AT_name("w")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("w")
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$131)
	.dwattr $C$DW$16, DW_AT_location[DW_OP_regx 0x3c]

;* r1_0  assigned to page_table_entry
$C$DW$17	.dwtag  DW_TAG_variable
	.dwattr $C$DW$17, DW_AT_name("page_table_entry")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("page_table_entry")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$17, DW_AT_location[DW_OP_reg4]

;* r16_0 assigned to reg
$C$DW$18	.dwtag  DW_TAG_variable
	.dwattr $C$DW$18, DW_AT_name("reg")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("reg")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$106)
	.dwattr $C$DW$18, DW_AT_location[DW_OP_regx 0x40]

;* r1_0  assigned to reg_val
$C$DW$19	.dwtag  DW_TAG_variable
	.dwattr $C$DW$19, DW_AT_name("reg_val")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("reg_val")
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$19, DW_AT_location[DW_OP_reg4]

	.dwcfi	cfa_offset, 0
;*** 86	-----------------------    if ( (page_table_entry = *((addr>>13)+&deviceregisters)) != 1 ) goto g3;
	.dwpsn	file "pru1_iopageregisters.c",line 86,column 27,is_stmt,isa 0
;----------------------------------------------------------------------
;  86 | uint8_t page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);     
;  87 | if (page_table_entry == PAGE_MEMORY) {                                 
;  88 |         // addr in allowed 18bit memory range, not in I/O page         
;  89 |         // no check wether addr is even (A00=0)                        
;  90 |         // write 16 bits                                               
;----------------------------------------------------------------------
        LSR       r1, r14, 0x0d         ; [ALU_PRU] |86| addr
        LDI       r0, ||deviceregisters|| ; [ALU_PRU] |86| deviceregisters
        LBBO      &r1.b0, r0, r1, 1     ; [ALU_PRU] |86| page_table_entry
        QBNE      ||$C$L1||, r1.b0, 0x01 ; [ALU_PRU] |86| page_table_entry
;* --------------------------------------------------------------------------*
	.dwcfi	remember_state
;*** 91	-----------------------    *((addr>>1)*2+(volatile unsigned short *)mailbox.ddrmem_base_physical) = w;
;*** 92	-----------------------    return 1;
	.dwpsn	file "pru1_iopageregisters.c",line 91,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  91 | DDRMEM_MEMSET_W(addr, w);                                              
;----------------------------------------------------------------------
        LSR       r0, r14, 0x01         ; [ALU_PRU] |91| addr
        LDI32     r1, ||mailbox||+8     ; [ALU_PRU] |91| mailbox
	.dwpsn	file "pru1_iopageregisters.c",line 92,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  92 | return 1;                                                              
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |92| 
	.dwpsn	file "pru1_iopageregisters.c",line 91,column 3,is_stmt,isa 0
        LSL       r0, r0, 0x01          ; [ALU_PRU] |91| 
        LBBO      &r1, r1, 0, 4         ; [ALU_PRU] |91| 
        SBBO      &r15.w0, r1, r0, 2    ; [ALU_PRU] |91| w
$C$DW$20	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$20, DW_AT_low_pc(0x00)
	.dwattr $C$DW$20, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
||$C$L1||:    
;***	-----------------------g3:
;*** 93	-----------------------    if ( page_table_entry != 2 ) goto g5;
	.dwpsn	file "pru1_iopageregisters.c",line 93,column 9,is_stmt,isa 0
;----------------------------------------------------------------------
;  93 | } else if (page_table_entry == PAGE_IO) {                              
;  94 | //              uint8_t reghandle = deviceregisters.iopage_register_han
;     | dles[ADDR2IOPAGEWORD(addr)];                                           
;  95 |         uint8_t reghandle = IOPAGE_REGISTER_ENTRY(deviceregisters,addr)
;     |  ;                                                                     
;----------------------------------------------------------------------
        QBNE      ||$C$L2||, r1.b0, 0x02 ; [ALU_PRU] |93| page_table_entry
;* --------------------------------------------------------------------------*
;*** 96	-----------------------    if ( C$5 = *((addr>>1&0xfff)+(K$5 = &deviceregisters)+32) ) goto g6;
	.dwpsn	file "pru1_iopageregisters.c",line 96,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  96 | if (!reghandle)                                                        
;----------------------------------------------------------------------
        LDI       r1, 0x0fff            ; [ALU_PRU] |96| 
        LSR       r16, r14, 0x01        ; [ALU_PRU] |96| addr
        AND       r1, r16, r1           ; [ALU_PRU] |96| 
        ADD       r1, r1, r0            ; [ALU_PRU] |96| $O$K5
        LBBO      &r1.b0, r1, 32, 1     ; [ALU_PRU] |96| $O$C5
        QBNE      ||$C$L3||, r1.b0, 0x00 ; [ALU_PRU] |96| $O$C5
;* --------------------------------------------------------------------------*
||$C$L2||:    
	.dwcfi	remember_state
;***	-----------------------g5:
;*** 97	-----------------------    return 0;
	.dwpsn	file "pru1_iopageregisters.c",line 97,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
;  97 | return 0; // register not implemented                                  
;  98 | // change register value                                               
;----------------------------------------------------------------------
        LDI       r14.b0, 0x00          ; [ALU_PRU] |97| 
$C$DW$21	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$21, DW_AT_low_pc(0x00)
	.dwattr $C$DW$21, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
||$C$L3||:    
;***	-----------------------g6:
;*** 99	-----------------------    C$4 = (int)C$5<<3;
;*** 99	-----------------------    reg = (struct $$fake23 *)K$5+C$4+4128;
;*** 100	-----------------------    C$2 = (struct $$fake23 *)K$5+C$4+4128;
;*** 100	-----------------------    C$3 = (*C$2).writable_bits;
;*** 100	-----------------------    reg_val = (*C$2).value&(C$3^0xffff)|C$3&w;
;*** 101	-----------------------    (*C$2).value = reg_val;
;*** 102	-----------------------    if ( !((*reg).event_flags&2) ) goto g8;
	.dwpsn	file "pru1_iopageregisters.c",line 99,column 25,is_stmt,isa 0
;----------------------------------------------------------------------
;  99 | iopageregister_t *reg = (iopageregister_t *) &(deviceregisters.register
;     | s[reghandle]); // alias                                                
;----------------------------------------------------------------------
        LSL       r17, r1.b0, 0x03      ; [ALU_PRU] |99| $O$C4,$O$C5
        LDI       r1, 0x1020            ; [ALU_PRU] |99| 
        ADD       r16, r0, r17          ; [ALU_PRU] |99| $O$K5,$O$C4
        ADD       r16, r16, r1          ; [ALU_PRU] |99| reg
	.dwpsn	file "pru1_iopageregisters.c",line 100,column 20,is_stmt,isa 0
;----------------------------------------------------------------------
; 100 | uint16_t reg_val = (reg->value & ~reg->writable_bits) | (w & reg->writa
;     | ble_bits);                                                             
;----------------------------------------------------------------------
        ADD       r0, r0, r17           ; [ALU_PRU] |100| $O$K5,$O$C4
        ADD       r0, r0, r1            ; [ALU_PRU] |100| $O$C2
        LDI       r1.w2, 0xffff         ; [ALU_PRU] |100| 
        LBBO      &r15.w2, r0, 0, 2     ; [ALU_PRU] |100| $O$C2
        LBBO      &r1.w0, r0, 2, 2      ; [ALU_PRU] |100| $O$C3,$O$C2
        XOR       r1.w2, r1.w0, r1.w2   ; [ALU_PRU] |100| $O$C3
        AND       r1.w0, r1.w0, r15.w0  ; [ALU_PRU] |100| $O$C3,w
        AND       r1.w2, r15.w2, r1.w2  ; [ALU_PRU] |100| 
        OR        r1.w0, r1.w2, r1.w0   ; [ALU_PRU] |100| reg_val
	.dwpsn	file "pru1_iopageregisters.c",line 101,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 101 | reg->value = reg_val ;                                                 
;----------------------------------------------------------------------
        SBBO      &r1.w0, r0, 0, 2      ; [ALU_PRU] |101| $O$C2,reg_val
	.dwpsn	file "pru1_iopageregisters.c",line 102,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 102 | if (reg->event_flags & IOPAGEREGISTER_EVENT_FLAG_DATO)                 
;----------------------------------------------------------------------
        LBBO      &r0.b0, r16, 4, 1     ; [ALU_PRU] |102| reg
        QBBC      ||$C$L4||, r0.b0, 0x01 ; [ALU_PRU] |102| 
;* --------------------------------------------------------------------------*
;*** 103	-----------------------    (*(C$1 = &mailbox)).events.unibus_control = 2u;
;*** 103	-----------------------    (*C$1).events.device_handle = (*reg).event_device_handle;
;*** 103	-----------------------    (*C$1).events.device_register_idx = (*reg).event_device_register_idx;
;*** 103	-----------------------    (*C$1).events.addr = addr;
;*** 103	-----------------------    (*C$1).events.data = reg_val;
;*** 103	-----------------------    (*C$1).events.eventmask |= 1u;
;*** 103	-----------------------    __R31 = 35u;
;*** 103	-----------------------    __R30 |= 0x1000u;
;*** 103	-----------------------    __delay_cycles(3u);
;*** 103	-----------------------    __R30 &= 0xffffefffu;
	.dwpsn	file "pru1_iopageregisters.c",line 103,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 103 | DO_EVENT_DEVICEREGISTER(reg, UNIBUS_CONTROL_DATO, addr, reg_val);      
;----------------------------------------------------------------------
        LDI32     r0, ||mailbox||       ; [ALU_PRU] |103| $O$C1,mailbox
        LDI       r1.b2, 0x02           ; [ALU_PRU] |103| 
        SBBO      &r1.b2, r0, 13, 1     ; [ALU_PRU] |103| $O$C1
        LBBO      &r1.b2, r16, 5, 1     ; [ALU_PRU] |103| reg
        SBBO      &r1.b2, r0, 14, 1     ; [ALU_PRU] |103| $O$C1
        LBBO      &r1.b2, r16, 6, 1     ; [ALU_PRU] |103| reg
        SBBO      &r1.b2, r0, 15, 1     ; [ALU_PRU] |103| $O$C1
        SBBO      &r14, r0, 16, 4       ; [ALU_PRU] |103| $O$C1,addr
        SBBO      &r1.w0, r0, 20, 2     ; [ALU_PRU] |103| $O$C1,reg_val
        LBBO      &r1.b2, r0, 12, 1     ; [ALU_PRU] |103| $O$C1
        SET       r1.b2, r1.b2, 0x00000000 ; [ALU_PRU] |103| 
        SBBO      &r1.b2, r0, 12, 1     ; [ALU_PRU] |103| $O$C1
        LDI       r31, 0x0023           ; [ALU_PRU] |103| 
        SET       r30, r30, 0x0000000c  ; [ALU_PRU] |103| 
        .newblock
        LDI      r1.w0, 1
$1:     SUB      r1.w0, r1.w0, 1
        QBNE     $1, r1.w0, 0          ; [ALU_PRU] |103| 
        CLR       r30, r30, 0x0000000c  ; [ALU_PRU] |103| 
;* --------------------------------------------------------------------------*
||$C$L4||:    
;***	-----------------------g8:
;*** 104	-----------------------    return 1;
	.dwpsn	file "pru1_iopageregisters.c",line 104,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 104 | return 1;                                                              
; 105 | } else                                                                 
; 106 | return 0;                                                              
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |104| 
$C$DW$22	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$22, DW_AT_low_pc(0x00)
	.dwattr $C$DW$22, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$6, DW_AT_TI_end_file("pru1_iopageregisters.c")
	.dwattr $C$DW$6, DW_AT_TI_end_line(0x6b)
	.dwattr $C$DW$6, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$6

	.sect	".text:iopageregisters_write_b"
	.clink
	.global	||iopageregisters_write_b||

$C$DW$23	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$23, DW_AT_name("iopageregisters_write_b")
	.dwattr $C$DW$23, DW_AT_low_pc(||iopageregisters_write_b||)
	.dwattr $C$DW$23, DW_AT_high_pc(0x00)
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("iopageregisters_write_b")
	.dwattr $C$DW$23, DW_AT_external
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$23, DW_AT_TI_begin_file("pru1_iopageregisters.c")
	.dwattr $C$DW$23, DW_AT_TI_begin_line(0x6d)
	.dwattr $C$DW$23, DW_AT_TI_begin_column(0x09)
	.dwattr $C$DW$23, DW_AT_decl_file("pru1_iopageregisters.c")
	.dwattr $C$DW$23, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$23, DW_AT_decl_column(0x09)
	.dwattr $C$DW$23, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru1_iopageregisters.c",line 109,column 59,is_stmt,address ||iopageregisters_write_b||,isa 0

	.dwfde $C$DW$CIE, ||iopageregisters_write_b||
$C$DW$24	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$24, DW_AT_name("addr")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$24, DW_AT_location[DW_OP_regx 0x38]

$C$DW$25	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$25, DW_AT_name("b")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("b")
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$25, DW_AT_location[DW_OP_regx 0x3c]

;----------------------------------------------------------------------
; 109 | uint8_t iopageregisters_write_b(uint32_t addr, uint8_t b) {            
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: iopageregisters_write_b       FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||iopageregisters_write_b||:
;* --------------------------------------------------------------------------*
;* r0_0  assigned to $O$C1
$C$DW$26	.dwtag  DW_TAG_variable
	.dwattr $C$DW$26, DW_AT_name("$O$C1")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$102)
	.dwattr $C$DW$26, DW_AT_location[DW_OP_reg0]

;* r0_2  assigned to $O$C2
$C$DW$27	.dwtag  DW_TAG_variable
	.dwattr $C$DW$27, DW_AT_name("$O$C2")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$27, DW_AT_location[DW_OP_reg2]

;* r0_0  assigned to $O$C3
$C$DW$28	.dwtag  DW_TAG_variable
	.dwattr $C$DW$28, DW_AT_name("$O$C3")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$28, DW_AT_location[DW_OP_reg0]

;* r0_0  assigned to $O$C4
$C$DW$29	.dwtag  DW_TAG_variable
	.dwattr $C$DW$29, DW_AT_name("$O$C4")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("$O$C4")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$29, DW_AT_location[DW_OP_reg0]

;* r0_0  assigned to $O$C5
$C$DW$30	.dwtag  DW_TAG_variable
	.dwattr $C$DW$30, DW_AT_name("$O$C5")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("$O$C5")
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$30, DW_AT_location[DW_OP_reg0]

;* r1_0  assigned to $O$C6
$C$DW$31	.dwtag  DW_TAG_variable
	.dwattr $C$DW$31, DW_AT_name("$O$C6")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("$O$C6")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg4]

;* r17_0 assigned to $O$C7
$C$DW$32	.dwtag  DW_TAG_variable
	.dwattr $C$DW$32, DW_AT_name("$O$C7")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("$O$C7")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_regx 0x44]

;* r1_0  assigned to $O$C8
$C$DW$33	.dwtag  DW_TAG_variable
	.dwattr $C$DW$33, DW_AT_name("$O$C8")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("$O$C8")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg4]

;* r0_0  assigned to $O$K5
$C$DW$34	.dwtag  DW_TAG_variable
	.dwattr $C$DW$34, DW_AT_name("$O$K5")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("$O$K5")
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$117)
	.dwattr $C$DW$34, DW_AT_location[DW_OP_reg0]

;* r14_0 assigned to addr
$C$DW$35	.dwtag  DW_TAG_variable
	.dwattr $C$DW$35, DW_AT_name("addr")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$134)
	.dwattr $C$DW$35, DW_AT_location[DW_OP_regx 0x38]

;* r15_0 assigned to b
$C$DW$36	.dwtag  DW_TAG_variable
	.dwattr $C$DW$36, DW_AT_name("b")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("b")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$124)
	.dwattr $C$DW$36, DW_AT_location[DW_OP_regx 0x3c]

;* r1_0  assigned to page_table_entry
$C$DW$37	.dwtag  DW_TAG_variable
	.dwattr $C$DW$37, DW_AT_name("page_table_entry")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("page_table_entry")
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$37, DW_AT_location[DW_OP_reg4]

;* r16_0 assigned to reg
$C$DW$38	.dwtag  DW_TAG_variable
	.dwattr $C$DW$38, DW_AT_name("reg")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("reg")
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$106)
	.dwattr $C$DW$38, DW_AT_location[DW_OP_regx 0x40]

;* r1_0  assigned to reg_val
$C$DW$39	.dwtag  DW_TAG_variable
	.dwattr $C$DW$39, DW_AT_name("reg_val")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("reg_val")
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$39, DW_AT_location[DW_OP_reg4]

	.dwcfi	cfa_offset, 0
;*** 110	-----------------------    if ( (page_table_entry = *((addr>>13)+&deviceregisters)) != 1 ) goto g3;
	.dwpsn	file "pru1_iopageregisters.c",line 110,column 27,is_stmt,isa 0
;----------------------------------------------------------------------
; 110 | uint8_t page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);     
; 111 | if (page_table_entry == PAGE_MEMORY) {                                 
; 112 |         // addr in allowed 18bit memory range, not in I/O page         
;----------------------------------------------------------------------
        LSR       r1, r14, 0x0d         ; [ALU_PRU] |110| addr
        LDI       r0, ||deviceregisters|| ; [ALU_PRU] |110| deviceregisters
        LBBO      &r1.b0, r0, r1, 1     ; [ALU_PRU] |110| page_table_entry
        QBNE      ||$C$L5||, r1.b0, 0x01 ; [ALU_PRU] |110| page_table_entry
;* --------------------------------------------------------------------------*
	.dwcfi	remember_state
;*** 113	-----------------------    *((volatile unsigned char *)mailbox.ddrmem_base_physical+addr) = b;
;*** 114	-----------------------    return 1;
	.dwpsn	file "pru1_iopageregisters.c",line 113,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 113 | DDRMEM_MEMSET_B(addr, b);                                              
;----------------------------------------------------------------------
        LDI32     r0, ||mailbox||+8     ; [ALU_PRU] |113| mailbox
        LBBO      &r0, r0, 0, 4         ; [ALU_PRU] |113| 
        SBBO      &r15.b0, r14, r0, 1   ; [ALU_PRU] |113| addr,b
	.dwpsn	file "pru1_iopageregisters.c",line 114,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 114 | return 1;                                                              
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |114| 
$C$DW$40	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$40, DW_AT_low_pc(0x00)
	.dwattr $C$DW$40, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
||$C$L5||:    
;***	-----------------------g3:
;*** 115	-----------------------    if ( page_table_entry != 2 ) goto g5;
	.dwpsn	file "pru1_iopageregisters.c",line 115,column 9,is_stmt,isa 0
;----------------------------------------------------------------------
; 115 | } else if (page_table_entry == PAGE_IO) {                              
; 116 | //              uint8_t reghandle = deviceregisters.iopage_register_han
;     | dles[ADDR2IOPAGEWORD(addr)];                                           
; 117 |         uint8_t reghandle = IOPAGE_REGISTER_ENTRY(deviceregisters,addr)
;     |  ;                                                                     
;----------------------------------------------------------------------
        QBNE      ||$C$L6||, r1.b0, 0x02 ; [ALU_PRU] |115| page_table_entry
;* --------------------------------------------------------------------------*
;*** 118	-----------------------    if ( C$8 = *((addr>>1&0xfff)+(K$5 = &deviceregisters)+32) ) goto g6;
	.dwpsn	file "pru1_iopageregisters.c",line 118,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 118 | if (!reghandle)                                                        
;----------------------------------------------------------------------
        LDI       r1, 0x0fff            ; [ALU_PRU] |118| 
        LSR       r16, r14, 0x01        ; [ALU_PRU] |118| addr
        AND       r1, r16, r1           ; [ALU_PRU] |118| 
        ADD       r1, r1, r0            ; [ALU_PRU] |118| $O$K5
        LBBO      &r1.b0, r1, 32, 1     ; [ALU_PRU] |118| $O$C8
        QBNE      ||$C$L7||, r1.b0, 0x00 ; [ALU_PRU] |118| $O$C8
;* --------------------------------------------------------------------------*
||$C$L6||:    
	.dwcfi	remember_state
;***	-----------------------g5:
;*** 119	-----------------------    return 0;
	.dwpsn	file "pru1_iopageregisters.c",line 119,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 119 | return 0; // register not implemented                                  
; 120 | // change register value                                               
;----------------------------------------------------------------------
        LDI       r14.b0, 0x00          ; [ALU_PRU] |119| 
$C$DW$41	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$41, DW_AT_low_pc(0x00)
	.dwattr $C$DW$41, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
||$C$L7||:    
;***	-----------------------g6:
;*** 121	-----------------------    C$7 = (int)C$8<<3;
;*** 121	-----------------------    reg = (struct $$fake23 *)K$5+C$7+4128;
;*** 123	-----------------------    if ( addr&1u ) goto g8;
	.dwpsn	file "pru1_iopageregisters.c",line 121,column 25,is_stmt,isa 0
;----------------------------------------------------------------------
; 121 | iopageregister_t *reg = (iopageregister_t *) &(deviceregisters.register
;     | s[reghandle]); // alias                                                
; 122 | uint16_t        reg_val ;                                              
;----------------------------------------------------------------------
        LSL       r17, r1.b0, 0x03      ; [ALU_PRU] |121| $O$C7,$O$C8
        LDI       r1, 0x1020            ; [ALU_PRU] |121| 
        ADD       r16, r0, r17          ; [ALU_PRU] |121| $O$K5,$O$C7
        ADD       r16, r16, r1          ; [ALU_PRU] |121| reg
	.dwpsn	file "pru1_iopageregisters.c",line 123,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 123 | if (addr & 1)  // odd address = write upper byte                       
; 124 |         reg_val = (reg->value & 0x00ff) // don't touch lower byte      
; 125 |         | (reg->value & ~reg->writable_bits & 0xff00) // protected uppe
;     | r byte bits                                                            
; 126 |                         | (((uint16_t)b << 8) & reg->writable_bits); //
;     |  changed upper byte bits                                               
; 127 | else                                                                   
; 128 |         // even address: write lower byte                              
;----------------------------------------------------------------------
        QBBS      ||$C$L8||, r14, 0x00  ; [ALU_PRU] |123| addr
;* --------------------------------------------------------------------------*
;*** 129	-----------------------    C$5 = (struct $$fake23 *)K$5+C$7+4128;
;*** 129	-----------------------    C$6 = (*C$5).writable_bits;
;*** 129	-----------------------    C$4 = (*C$5).value;
;*** 129	-----------------------    reg_val = C$4&0xff00|(C$6^0xff)&C$4&0xff|C$6&b;
;*** 129	-----------------------    goto g9;
	.dwpsn	file "pru1_iopageregisters.c",line 129,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 129 | reg_val = (reg->value & 0xff00) // don' touch upper byte               
; 130 | | (reg->value & ~reg->writable_bits & 0x00ff) // protected upper byte b
;     | its                                                                    
; 131 |                 | (b & reg->writable_bits); // changed lower byte bits 
;----------------------------------------------------------------------
        ADD       r0, r0, r17           ; [ALU_PRU] |129| $O$K5,$O$C7
        ADD       r0, r0, r1            ; [ALU_PRU] |129| $O$C5
        LDI       r1.w2, 0xff00         ; [ALU_PRU] |129| 
        LBBO      &r1.w0, r0, 2, 2      ; [ALU_PRU] |129| $O$C6,$O$C5
        LBBO      &r0.w0, r0, 0, 2      ; [ALU_PRU] |129| $O$C4,$O$C5
        XOR       r0.w2, r1.w0, 0xff    ; [ALU_PRU] |129| $O$C6
        AND       r0.w2, r0.w2, r0.w0   ; [ALU_PRU] |129| $O$C4
        AND       r0.w2, r0.w2, 0xff    ; [ALU_PRU] |129| 
        AND       r0.w0, r0.w0, r1.w2   ; [ALU_PRU] |129| $O$C4
        OR        r0.w0, r0.w0, r0.w2   ; [ALU_PRU] |129| 
        AND       r0.w2, r1.w0, r15.b0  ; [ALU_PRU] |129| $O$C6,b
        OR        r1.w0, r0.w0, r0.w2   ; [ALU_PRU] |129| reg_val
        JMP       ||$C$L9||             ; [ALU_PRU] |129| 
;* --------------------------------------------------------------------------*
||$C$L8||:    
;***	-----------------------g8:
;*** 124	-----------------------    C$3 = (*reg).writable_bits;
;*** 124	-----------------------    C$2 = (*reg).value;
;*** 124	-----------------------    reg_val = C$2&0xff|(C$3^0xff00)&C$2&0xff00|(int)b<<8&C$3;
	.dwpsn	file "pru1_iopageregisters.c",line 124,column 4,is_stmt,isa 0
        LBBO      &r0.w0, r16, 2, 2     ; [ALU_PRU] |124| $O$C3,reg
        LSL       r1.w0, r15.b0, 0x08   ; [ALU_PRU] |124| b
        LBBO      &r0.w2, r16, 0, 2     ; [ALU_PRU] |124| $O$C2,reg
        AND       r1.w0, r1.w0, r0.w0   ; [ALU_PRU] |124| $O$C3
        XOR       r0.b1, r0.b1, 0xff    ; [ALU_PRU] |124| 
        AND       r1.w2, r0.w0, r0.w2   ; [ALU_PRU] |124| $O$C2
        LDI       r0.w0, 0xff00         ; [ALU_PRU] |124| 
        AND       r0.w2, r0.w2, 0xff    ; [ALU_PRU] |124| $O$C2
        AND       r0.w0, r1.w2, r0.w0   ; [ALU_PRU] |124| 
        OR        r0.w0, r0.w2, r0.w0   ; [ALU_PRU] |124| 
        OR        r1.w0, r0.w0, r1.w0   ; [ALU_PRU] |124| reg_val
;* --------------------------------------------------------------------------*
||$C$L9||:    
;***	-----------------------g9:
;*** 132	-----------------------    (*reg).value = reg_val;
;*** 133	-----------------------    if ( !((*reg).event_flags&2) ) goto g11;
	.dwpsn	file "pru1_iopageregisters.c",line 132,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 132 | reg->value = reg_val ;                                                 
;----------------------------------------------------------------------
        SBBO      &r1.w0, r16, 0, 2     ; [ALU_PRU] |132| reg,reg_val
	.dwpsn	file "pru1_iopageregisters.c",line 133,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 133 | if (reg->event_flags & IOPAGEREGISTER_EVENT_FLAG_DATO)                 
;----------------------------------------------------------------------
        LBBO      &r0.b0, r16, 4, 1     ; [ALU_PRU] |133| reg
        QBBC      ||$C$L10||, r0.b0, 0x01 ; [ALU_PRU] |133| 
;* --------------------------------------------------------------------------*
;*** 134	-----------------------    (*(C$1 = &mailbox)).events.unibus_control = 3u;
;*** 134	-----------------------    (*C$1).events.device_handle = (*reg).event_device_handle;
;*** 134	-----------------------    (*C$1).events.device_register_idx = (*reg).event_device_register_idx;
;*** 134	-----------------------    (*C$1).events.addr = addr;
;*** 134	-----------------------    (*C$1).events.data = reg_val;
;*** 134	-----------------------    (*C$1).events.eventmask |= 1u;
;*** 134	-----------------------    __R31 = 35u;
;*** 134	-----------------------    __R30 |= 0x1000u;
;*** 134	-----------------------    __delay_cycles(3u);
;*** 134	-----------------------    __R30 &= 0xffffefffu;
	.dwpsn	file "pru1_iopageregisters.c",line 134,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 134 | DO_EVENT_DEVICEREGISTER(reg, UNIBUS_CONTROL_DATOB, addr, reg_val);     
;----------------------------------------------------------------------
        LDI32     r0, ||mailbox||       ; [ALU_PRU] |134| $O$C1,mailbox
        LDI       r1.b2, 0x03           ; [ALU_PRU] |134| 
        SBBO      &r1.b2, r0, 13, 1     ; [ALU_PRU] |134| $O$C1
        LBBO      &r1.b2, r16, 5, 1     ; [ALU_PRU] |134| reg
        SBBO      &r1.b2, r0, 14, 1     ; [ALU_PRU] |134| $O$C1
        LBBO      &r1.b2, r16, 6, 1     ; [ALU_PRU] |134| reg
        SBBO      &r1.b2, r0, 15, 1     ; [ALU_PRU] |134| $O$C1
        SBBO      &r14, r0, 16, 4       ; [ALU_PRU] |134| $O$C1,addr
        SBBO      &r1.w0, r0, 20, 2     ; [ALU_PRU] |134| $O$C1,reg_val
        LBBO      &r1.b2, r0, 12, 1     ; [ALU_PRU] |134| $O$C1
        SET       r1.b2, r1.b2, 0x00000000 ; [ALU_PRU] |134| 
        SBBO      &r1.b2, r0, 12, 1     ; [ALU_PRU] |134| $O$C1
        LDI       r31, 0x0023           ; [ALU_PRU] |134| 
        SET       r30, r30, 0x0000000c  ; [ALU_PRU] |134| 
        .newblock
        LDI      r1.w0, 1
$1:     SUB      r1.w0, r1.w0, 1
        QBNE     $1, r1.w0, 0          ; [ALU_PRU] |134| 
        CLR       r30, r30, 0x0000000c  ; [ALU_PRU] |134| 
;* --------------------------------------------------------------------------*
||$C$L10||:    
;***	-----------------------g11:
;*** 135	-----------------------    return 1;
	.dwpsn	file "pru1_iopageregisters.c",line 135,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 135 | return 1;                                                              
; 136 | } else                                                                 
; 137 | return 0;                                                              
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |135| 
$C$DW$42	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$42, DW_AT_low_pc(0x00)
	.dwattr $C$DW$42, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$23, DW_AT_TI_end_file("pru1_iopageregisters.c")
	.dwattr $C$DW$23, DW_AT_TI_end_line(0x8b)
	.dwattr $C$DW$23, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$23

	.sect	".text:iopageregisters_read"
	.clink
	.global	||iopageregisters_read||

$C$DW$43	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$43, DW_AT_name("iopageregisters_read")
	.dwattr $C$DW$43, DW_AT_low_pc(||iopageregisters_read||)
	.dwattr $C$DW$43, DW_AT_high_pc(0x00)
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("iopageregisters_read")
	.dwattr $C$DW$43, DW_AT_external
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$43, DW_AT_TI_begin_file("pru1_iopageregisters.c")
	.dwattr $C$DW$43, DW_AT_TI_begin_line(0x36)
	.dwattr $C$DW$43, DW_AT_TI_begin_column(0x09)
	.dwattr $C$DW$43, DW_AT_decl_file("pru1_iopageregisters.c")
	.dwattr $C$DW$43, DW_AT_decl_line(0x36)
	.dwattr $C$DW$43, DW_AT_decl_column(0x09)
	.dwattr $C$DW$43, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru1_iopageregisters.c",line 54,column 60,is_stmt,address ||iopageregisters_read||,isa 0

	.dwfde $C$DW$CIE, ||iopageregisters_read||
$C$DW$44	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$44, DW_AT_name("addr")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_regx 0x38]

$C$DW$45	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$45, DW_AT_name("val")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$113)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_regx 0x3c]

;----------------------------------------------------------------------
;  54 | uint8_t iopageregisters_read(uint32_t addr, uint16_t *val) {           
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: iopageregisters_read          FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||iopageregisters_read||:
;* --------------------------------------------------------------------------*
;* r1_0  assigned to $O$C1
$C$DW$46	.dwtag  DW_TAG_variable
	.dwattr $C$DW$46, DW_AT_name("$O$C1")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("$O$C1")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$102)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg4]

;* r0_0  assigned to $O$C2
$C$DW$47	.dwtag  DW_TAG_variable
	.dwattr $C$DW$47, DW_AT_name("$O$C2")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("$O$C2")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg0]

;* r1_0  assigned to $O$C3
$C$DW$48	.dwtag  DW_TAG_variable
	.dwattr $C$DW$48, DW_AT_name("$O$C3")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("$O$C3")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_reg4]

;* r1_0  assigned to $O$C4
$C$DW$49	.dwtag  DW_TAG_variable
	.dwattr $C$DW$49, DW_AT_name("$O$C4")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("$O$C4")
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$49, DW_AT_location[DW_OP_reg4]

;* r0_0  assigned to $O$K5
$C$DW$50	.dwtag  DW_TAG_variable
	.dwattr $C$DW$50, DW_AT_name("$O$K5")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("$O$K5")
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$117)
	.dwattr $C$DW$50, DW_AT_location[DW_OP_reg0]

;* r14_0 assigned to addr
$C$DW$51	.dwtag  DW_TAG_variable
	.dwattr $C$DW$51, DW_AT_name("addr")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$134)
	.dwattr $C$DW$51, DW_AT_location[DW_OP_regx 0x38]

;* r15_0 assigned to val
$C$DW$52	.dwtag  DW_TAG_variable
	.dwattr $C$DW$52, DW_AT_name("val")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_regx 0x3c]

;* r1_0  assigned to page_table_entry
$C$DW$53	.dwtag  DW_TAG_variable
	.dwattr $C$DW$53, DW_AT_name("page_table_entry")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("page_table_entry")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg4]

;* r16_0 assigned to reg
$C$DW$54	.dwtag  DW_TAG_variable
	.dwattr $C$DW$54, DW_AT_name("reg")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("reg")
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$106)
	.dwattr $C$DW$54, DW_AT_location[DW_OP_regx 0x40]

	.dwcfi	cfa_offset, 0
;*** 55	-----------------------    if ( (page_table_entry = *((addr>>13)+&deviceregisters)) != 1 ) goto g3;
	.dwpsn	file "pru1_iopageregisters.c",line 55,column 27,is_stmt,isa 0
;----------------------------------------------------------------------
;  55 | uint8_t page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);     
;  56 | if (page_table_entry == PAGE_MEMORY) {                                 
;  57 |         // addr in allowed 18bit memory range, not in I/O page         
;----------------------------------------------------------------------
        LSR       r1, r14, 0x0d         ; [ALU_PRU] |55| addr
        LDI       r0, ||deviceregisters|| ; [ALU_PRU] |55| deviceregisters
        LBBO      &r1.b0, r0, r1, 1     ; [ALU_PRU] |55| page_table_entry
        QBNE      ||$C$L11||, r1.b0, 0x01 ; [ALU_PRU] |55| page_table_entry
;* --------------------------------------------------------------------------*
	.dwcfi	remember_state
;*** 58	-----------------------    *val = *((addr>>1)*2+(volatile unsigned short *)mailbox.ddrmem_base_physical);
;*** 59	-----------------------    return 1;
	.dwpsn	file "pru1_iopageregisters.c",line 58,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  58 | *val = DDRMEM_MEMGET_W(addr);                                          
;----------------------------------------------------------------------
        LSR       r0, r14, 0x01         ; [ALU_PRU] |58| addr
        LDI32     r1, ||mailbox||+8     ; [ALU_PRU] |58| mailbox
	.dwpsn	file "pru1_iopageregisters.c",line 59,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  59 | return 1;                                                              
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |59| 
	.dwpsn	file "pru1_iopageregisters.c",line 58,column 3,is_stmt,isa 0
        LSL       r0, r0, 0x01          ; [ALU_PRU] |58| 
        LBBO      &r1, r1, 0, 4         ; [ALU_PRU] |58| 
        LBBO      &r0.w0, r1, r0, 2     ; [ALU_PRU] |58| 
        SBBO      &r0.w0, r15, 0, 2     ; [ALU_PRU] |58| val
$C$DW$55	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$55, DW_AT_low_pc(0x00)
	.dwattr $C$DW$55, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
||$C$L11||:    
;***	-----------------------g3:
;*** 60	-----------------------    if ( page_table_entry != 2 ) goto g5;
	.dwpsn	file "pru1_iopageregisters.c",line 60,column 9,is_stmt,isa 0
;----------------------------------------------------------------------
;  60 | } else if (page_table_entry == PAGE_IO) {                              
;  61 | //              uint8_t reghandle = deviceregisters.iopage_register_han
;     | dles[ADDR2IOPAGEWORD(addr)];                                           
;  62 |         uint8_t reghandle  ;                                           
;  63 |         reghandle = IOPAGE_REGISTER_ENTRY(deviceregisters,addr) ;      
;----------------------------------------------------------------------
        QBNE      ||$C$L12||, r1.b0, 0x02 ; [ALU_PRU] |60| page_table_entry
;* --------------------------------------------------------------------------*
;*** 64	-----------------------    if ( C$4 = *((addr>>1&0xfff)+(K$5 = &deviceregisters)+32) ) goto g6;
	.dwpsn	file "pru1_iopageregisters.c",line 64,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  64 | if (!reghandle) {                                                      
;----------------------------------------------------------------------
        LDI       r1, 0x0fff            ; [ALU_PRU] |64| 
        LSR       r16, r14, 0x01        ; [ALU_PRU] |64| addr
        AND       r1, r16, r1           ; [ALU_PRU] |64| 
        ADD       r1, r1, r0            ; [ALU_PRU] |64| $O$K5
        LBBO      &r1.b0, r1, 32, 1     ; [ALU_PRU] |64| $O$C4
        QBNE      ||$C$L13||, r1.b0, 0x00 ; [ALU_PRU] |64| $O$C4
;* --------------------------------------------------------------------------*
||$C$L12||:    
	.dwcfi	remember_state
;***	-----------------------g5:
;*** 65	-----------------------    return 0;
	.dwpsn	file "pru1_iopageregisters.c",line 65,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
;  65 | return 0; // register not implemented as "active"                      
;  67 | // return register value. remove "volatile" attribute                  
;  68 | //              DEBUG_PIN_SET(1) ;                                     
;  69 | // indexing this records takes 4,6 us, if record size != 8             
;----------------------------------------------------------------------
        LDI       r14.b0, 0x00          ; [ALU_PRU] |65| 
$C$DW$56	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$56, DW_AT_low_pc(0x00)
	.dwattr $C$DW$56, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwcfi	restore_state
;* --------------------------------------------------------------------------*
||$C$L13||:    
;***	-----------------------g6:
;*** 70	-----------------------    C$3 = (int)C$4<<3;
;*** 70	-----------------------    reg = (struct $$fake23 *)K$5+C$3+4128;
;*** 72	-----------------------    *val = C$2 = *((struct $$fake23 *)K$5+C$3+4128);
;*** 73	-----------------------    if ( !((*reg).event_flags&1) ) goto g8;
	.dwpsn	file "pru1_iopageregisters.c",line 70,column 25,is_stmt,isa 0
;----------------------------------------------------------------------
;  70 | iopageregister_t *reg = (iopageregister_t *) &(deviceregisters.register
;     | s[reghandle]); // alias                                                
;  71 | //              DEBUG_PIN_SET(0) ;                                     
;----------------------------------------------------------------------
        LSL       r1, r1.b0, 0x03       ; [ALU_PRU] |70| $O$C3,$O$C4
        LDI       r16, 0x1020           ; [ALU_PRU] |70| 
        ADD       r17, r0, r1           ; [ALU_PRU] |70| $O$K5,$O$C3
        ADD       r16, r17, r16         ; [ALU_PRU] |70| reg
	.dwpsn	file "pru1_iopageregisters.c",line 72,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  72 | *val = reg->value;                                                     
;----------------------------------------------------------------------
        ADD       r0, r0, r1            ; [ALU_PRU] |72| $O$K5,$O$C3
        LDI       r1.w0, 0x1020         ; [ALU_PRU] |72| 
        LBBO      &r0.w0, r0, r1.w0, 2  ; [ALU_PRU] |72| $O$C2
        SBBO      &r0.w0, r15, 0, 2     ; [ALU_PRU] |72| val,$O$C2
	.dwpsn	file "pru1_iopageregisters.c",line 73,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  73 | if (reg->event_flags & IOPAGEREGISTER_EVENT_FLAG_DATI)                 
;----------------------------------------------------------------------
        LBBO      &r0.b2, r16, 4, 1     ; [ALU_PRU] |73| reg
        QBBC      ||$C$L14||, r0.b2, 0x00 ; [ALU_PRU] |73| 
;* --------------------------------------------------------------------------*
;*** 74	-----------------------    (*(C$1 = &mailbox)).events.unibus_control = 0u;
;*** 74	-----------------------    (*C$1).events.device_handle = (*reg).event_device_handle;
;*** 74	-----------------------    (*C$1).events.device_register_idx = (*reg).event_device_register_idx;
;*** 74	-----------------------    (*C$1).events.addr = addr;
;*** 74	-----------------------    (*C$1).events.data = C$2;
;*** 74	-----------------------    (*C$1).events.eventmask |= 1u;
;*** 74	-----------------------    __R31 = 35u;
;*** 74	-----------------------    __R30 |= 0x1000u;
;*** 74	-----------------------    __delay_cycles(3u);
;*** 74	-----------------------    __R30 &= 0xffffefffu;
	.dwpsn	file "pru1_iopageregisters.c",line 74,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
;  74 | DO_EVENT_DEVICEREGISTER(reg, UNIBUS_CONTROL_DATI, addr, *val);         
;----------------------------------------------------------------------
        LDI32     r1, ||mailbox||       ; [ALU_PRU] |74| $O$C1,mailbox
        LDI       r0.b2, 0x00           ; [ALU_PRU] |74| 
        SBBO      &r0.b2, r1, 13, 1     ; [ALU_PRU] |74| $O$C1
        LBBO      &r0.b2, r16, 5, 1     ; [ALU_PRU] |74| reg
        SBBO      &r0.b2, r1, 14, 1     ; [ALU_PRU] |74| $O$C1
        LBBO      &r0.b2, r16, 6, 1     ; [ALU_PRU] |74| reg
        SBBO      &r0.b2, r1, 15, 1     ; [ALU_PRU] |74| $O$C1
        SBBO      &r14, r1, 16, 4       ; [ALU_PRU] |74| $O$C1,addr
        SBBO      &r0.w0, r1, 20, 2     ; [ALU_PRU] |74| $O$C1,$O$C2
        LBBO      &r0.b2, r1, 12, 1     ; [ALU_PRU] |74| $O$C1
        SET       r0.b2, r0.b2, 0x00000000 ; [ALU_PRU] |74| 
        SBBO      &r0.b2, r1, 12, 1     ; [ALU_PRU] |74| $O$C1
        LDI       r31, 0x0023           ; [ALU_PRU] |74| 
        SET       r30, r30, 0x0000000c  ; [ALU_PRU] |74| 
        .newblock
        LDI      r0.w0, 1
$1:     SUB      r0.w0, r0.w0, 1
        QBNE     $1, r0.w0, 0          ; [ALU_PRU] |74| 
        CLR       r30, r30, 0x0000000c  ; [ALU_PRU] |74| 
;* --------------------------------------------------------------------------*
||$C$L14||:    
;***	-----------------------g8:
;*** 75	-----------------------    return 1;
	.dwpsn	file "pru1_iopageregisters.c",line 75,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  75 | return 1;                                                              
;  76 | } else                                                                 
;  77 | return 0;                                                              
;----------------------------------------------------------------------
        LDI       r14.b0, 0x01          ; [ALU_PRU] |75| 
$C$DW$57	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$57, DW_AT_low_pc(0x00)
	.dwattr $C$DW$57, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$43, DW_AT_TI_end_file("pru1_iopageregisters.c")
	.dwattr $C$DW$43, DW_AT_TI_end_line(0x4e)
	.dwattr $C$DW$43, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$43

	.sect	".text:iopageregisters_init"
	.clink
	.global	||iopageregisters_init||

$C$DW$58	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$58, DW_AT_name("iopageregisters_init")
	.dwattr $C$DW$58, DW_AT_low_pc(||iopageregisters_init||)
	.dwattr $C$DW$58, DW_AT_high_pc(0x00)
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("iopageregisters_init")
	.dwattr $C$DW$58, DW_AT_external
	.dwattr $C$DW$58, DW_AT_TI_begin_file("pru1_iopageregisters.c")
	.dwattr $C$DW$58, DW_AT_TI_begin_line(0x8e)
	.dwattr $C$DW$58, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$58, DW_AT_decl_file("pru1_iopageregisters.c")
	.dwattr $C$DW$58, DW_AT_decl_line(0x8e)
	.dwattr $C$DW$58, DW_AT_decl_column(0x06)
	.dwattr $C$DW$58, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru1_iopageregisters.c",line 142,column 29,is_stmt,address ||iopageregisters_init||,isa 0

	.dwfde $C$DW$CIE, ||iopageregisters_init||
;----------------------------------------------------------------------
; 142 | void iopageregisters_init() {                                          
; 143 | // clear the pagetable: no address emulated                            
; 144 | memset((void *) deviceregisters.pagetable, 0, sizeof(deviceregisters.pa
;     | getable));                                                             
; 145 | // clear the iopage addr map: no register assigned                     
; 146 | memset((void *) deviceregisters.iopage_register_handles, 0,            
; 147 |                 sizeof(deviceregisters.iopage_register_handles));      
; 148 | // and clear all register descriptors                                  
; 149 | memset((void *) deviceregisters.registers, 0, sizeof(deviceregisters.re
;     | gisters));                                                             
; 151 |                                                                        
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: iopageregisters_init          FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||iopageregisters_init||:
;* --------------------------------------------------------------------------*
;* r14_0 assigned to $O$K6
$C$DW$59	.dwtag  DW_TAG_variable
	.dwattr $C$DW$59, DW_AT_name("$O$K6")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("$O$K6")
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$59, DW_AT_location[DW_OP_regx 0x38]

;* r1_0  assigned to $O$K1
$C$DW$60	.dwtag  DW_TAG_variable
	.dwattr $C$DW$60, DW_AT_name("$O$K1")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("$O$K1")
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$117)
	.dwattr $C$DW$60, DW_AT_location[DW_OP_reg4]

;* r14_1 assigned to $O$L2
$C$DW$61	.dwtag  DW_TAG_variable
	.dwattr $C$DW$61, DW_AT_name("$O$L2")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("$O$L2")
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$61, DW_AT_location[DW_OP_regx 0x39]

;* r1_0  assigned to $O$L3
$C$DW$62	.dwtag  DW_TAG_variable
	.dwattr $C$DW$62, DW_AT_name("$O$L3")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("$O$L3")
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$62, DW_AT_location[DW_OP_reg4]

;* r0_0  assigned to m
$C$DW$63	.dwtag  DW_TAG_variable
	.dwattr $C$DW$63, DW_AT_name("m")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("m")
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$63, DW_AT_location[DW_OP_reg0]

;* r0_0  assigned to m
$C$DW$64	.dwtag  DW_TAG_variable
	.dwattr $C$DW$64, DW_AT_name("m")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("m")
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$64, DW_AT_location[DW_OP_reg0]

;* r0_0  assigned to m
$C$DW$65	.dwtag  DW_TAG_variable
	.dwattr $C$DW$65, DW_AT_name("m")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("m")
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$65, DW_AT_location[DW_OP_reg0]

	.dwcfi	cfa_offset, 0
;***  	-----------------------    #pragma MUST_ITERATE(16, 16, 16)
;***  	-----------------------    #pragma LOOP_FLAGS(0u)
;***  	-----------------------    K$6 = 0;
;*** 412	-----------------------    m = &deviceregisters;  // [0]
;***  	-----------------------    L$1 = 16u;
;***	-----------------------g2:
;***	-----------------------g12:
        ZERO      &r14, 4               ; [ALU_PRU] $O$K6
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 412,column 14,is_stmt,isa 0
        LDI       r0, ||deviceregisters|| ; [ALU_PRU] |412| m,deviceregisters
        LOOP      ||$C$L16||, 0x10      ; [ALU_PRU] 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L15||
;*
;*   Loop source line                : 414
;*   Loop closing brace source line  : 414
;*   Known Minimum Trip Count        : 16
;*   Known Maximum Trip Count        : 16
;*   Known Max Trip Count Factor     : 16
;* --------------------------------------------------------------------------*
||$C$L15||:    
;*** 414	-----------------------    *m = K$6;  // [0]
;*** 414	-----------------------    *(++m) = K$6;  // [0]
;*** 414	-----------------------    ++m;  // [0]
;*** 414	-----------------------    if ( --L$1 != 0 ) goto g12;  // [0]
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 414,column 23,is_stmt,isa 0
;----------------------------------------------------------------------
; 152 |                                                                        
; 153 |                                                                        
; 154 |                                                                        
; 155 |                                                                        
; 156 |                                                                        
; 157 |                                                                        
; 158 |                                                                        
; 159 |                                                                        
; 160 |                                                                        
; 161 |                                                                        
; 162 |                                                                        
; 163 |                                                                        
; 164 |                                                                        
; 165 |                                                                        
; 166 |                                                                        
; 167 |                                                                        
; 168 |                                                                        
; 169 |                                                                        
; 170 |                                                                        
; 171 |                                                                        
; 172 |                                                                        
; 173 |                                                                        
; 174 |                                                                        
; 175 |                                                                        
; 176 |                                                                        
; 177 |                                                                        
; 178 |                                                                        
; 179 |                                                                        
; 180 |                                                                        
; 181 |                                                                        
; 182 |                                                                        
; 183 |                                                                        
; 184 |                                                                        
; 185 |                                                                        
; 186 |                                                                        
; 187 |                                                                        
; 188 |                                                                        
; 189 |                                                                        
; 190 |                                                                        
; 191 |                                                                        
; 192 |                                                                        
; 193 |                                                                        
; 194 |                                                                        
; 195 |                                                                        
; 196 |                                                                        
; 197 |                                                                        
; 198 |                                                                        
; 199 |                                                                        
; 200 |                                                                        
; 201 |                                                                        
; 202 |                                                                        
; 203 |                                                                        
; 204 |                                                                        
; 205 |                                                                        
; 206 |                                                                        
; 207 |                                                                        
; 208 |                                                                        
; 209 |                                                                        
; 210 |                                                                        
; 211 |                                                                        
; 212 |                                                                        
; 213 |                                                                        
; 214 |                                                                        
; 215 |                                                                        
; 216 |                                                                        
; 217 |                                                                        
; 218 |                                                                        
; 219 |                                                                        
; 220 |                                                                        
; 221 |                                                                        
; 222 |                                                                        
; 223 |                                                                        
; 224 |                                                                        
; 225 |                                                                        
; 226 |                                                                        
; 227 |                                                                        
; 228 |                                                                        
; 229 |                                                                        
; 230 |                                                                        
; 231 |                                                                        
; 232 |                                                                        
; 233 |                                                                        
; 234 |                                                                        
; 235 |                                                                        
; 236 |                                                                        
; 237 |                                                                        
; 238 |                                                                        
; 239 |                                                                        
; 240 |                                                                        
; 241 |                                                                        
; 242 |                                                                        
; 243 |                                                                        
; 244 |                                                                        
; 245 |                                                                        
; 246 |                                                                        
; 247 |                                                                        
; 248 |                                                                        
; 249 |                                                                        
; 250 |                                                                        
; 251 |                                                                        
; 252 |                                                                        
; 253 |                                                                        
; 254 |                                                                        
; 255 |                                                                        
; 256 |                                                                        
; 257 |                                                                        
; 258 |                                                                        
; 259 |                                                                        
; 260 |                                                                        
; 261 |                                                                        
; 262 |                                                                        
; 263 |                                                                        
; 264 |                                                                        
; 265 |                                                                        
; 266 |                                                                        
; 267 |                                                                        
; 268 |                                                                        
; 269 |                                                                        
; 270 |                                                                        
; 271 |                                                                        
; 272 |                                                                        
; 273 |                                                                        
; 274 |                                                                        
; 275 |                                                                        
; 276 |                                                                        
; 277 |                                                                        
; 278 |                                                                        
; 279 |                                                                        
; 280 |                                                                        
; 281 |                                                                        
; 282 |                                                                        
; 283 |                                                                        
; 284 |                                                                        
; 285 |                                                                        
; 286 |                                                                        
; 287 |                                                                        
; 288 |                                                                        
; 289 |                                                                        
; 290 |                                                                        
; 291 |                                                                        
; 292 |                                                                        
; 293 |                                                                        
; 294 |                                                                        
; 295 |                                                                        
; 296 |                                                                        
; 297 |                                                                        
; 298 |                                                                        
; 299 |                                                                        
; 300 |                                                                        
; 301 |                                                                        
; 302 |                                                                        
; 303 |                                                                        
; 304 |                                                                        
; 305 |                                                                        
; 306 |                                                                        
; 307 |                                                                        
; 308 |                                                                        
; 309 |                                                                        
; 310 |                                                                        
; 311 |                                                                        
; 312 |                                                                        
; 313 |                                                                        
; 314 |                                                                        
; 315 |                                                                        
; 316 |                                                                        
; 317 |                                                                        
; 318 |                                                                        
; 319 |                                                                        
; 320 |                                                                        
; 321 |                                                                        
; 322 |                                                                        
; 323 |                                                                        
; 324 |                                                                        
; 325 |                                                                        
; 326 |                                                                        
; 327 |                                                                        
; 328 |                                                                        
; 329 |                                                                        
; 330 |                                                                        
; 331 |                                                                        
; 332 |                                                                        
; 333 |                                                                        
; 334 |                                                                        
; 335 |                                                                        
; 336 |                                                                        
; 337 |                                                                        
; 338 |                                                                        
; 339 |                                                                        
; 340 |                                                                        
; 341 |                                                                        
; 342 |                                                                        
; 343 |                                                                        
; 344 |                                                                        
; 345 |                                                                        
; 346 |                                                                        
; 347 |                                                                        
; 348 |                                                                        
; 349 |                                                                        
; 350 |                                                                        
; 351 |                                                                        
; 352 |                                                                        
; 353 |                                                                        
; 354 |                                                                        
; 355 |                                                                        
; 356 |                                                                        
; 357 |                                                                        
; 358 |                                                                        
; 359 |                                                                        
; 360 |                                                                        
; 361 |                                                                        
; 362 |                                                                        
; 363 |                                                                        
; 364 |                                                                        
; 365 |                                                                        
; 366 |                                                                        
; 367 |                                                                        
; 368 |                                                                        
; 369 |                                                                        
; 370 |                                                                        
; 371 |                                                                        
; 372 |                                                                        
; 373 |                                                                        
; 374 |                                                                        
; 375 |                                                                        
; 376 |                                                                        
; 377 |                                                                        
; 378 |                                                                        
; 379 |                                                                        
; 380 |                                                                        
; 381 |                                                                        
; 382 |                                                                        
; 383 |                                                                        
; 384 |                                                                        
; 385 |                                                                        
; 386 |                                                                        
; 387 |                                                                        
; 388 |                                                                        
; 389 |                                                                        
; 390 |                                                                        
; 391 |                                                                        
; 392 |                                                                        
; 393 |                                                                        
; 394 |                                                                        
; 395 |                                                                        
; 396 |                                                                        
; 397 |                                                                        
; 398 |                                                                        
; 399 |                                                                        
; 400 |                                                                        
; 401 |                                                                        
; 402 |                                                                        
; 403 |                                                                        
; 404 |                                                                        
; 405 |                                                                        
; 406 |                                                                        
; 407 |                                                                        
; 408 |                                                                        
; 409 |                                                                        
; 410 |                                                                        
; 411 |                                                                        
; 412 |                                                                        
; 413 |                                                                        
; 414 |                                                                        
;----------------------------------------------------------------------
        SBBO      &r14.b0, r0, 0, 1     ; [ALU_PRU] |414| m,$O$K6
        ADD       r0, r0, 0x01          ; [ALU_PRU] |414| m,m
        SBBO      &r14.b0, r0, 0, 1     ; [ALU_PRU] |414| m,$O$K6
        ADD       r0, r0, 0x01          ; [ALU_PRU] |414| m,m
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 414,column 6,is_stmt,isa 0
        ; END LOOP ; [] |414| 
;* --------------------------------------------------------------------------*
||$C$L16||:    
;*** 412	-----------------------    m = (K$1 = &deviceregisters)+32;  // [0]
;***  	-----------------------    #pragma MUST_ITERATE(2048, 2048, 2048)
;***  	-----------------------    #pragma LOOP_FLAGS(0u)
;***  	-----------------------    L$2 = 2048u;
;***	-----------------------g4:
;***	-----------------------g11:
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 412,column 14,is_stmt,isa 0
        LDI       r1, ||deviceregisters|| ; [ALU_PRU] |412| $O$K1,deviceregisters
        LDI       r14.w1, 0x0800        ; [ALU_PRU] $O$L2
        ADD       r0, r1, 0x20          ; [ALU_PRU] |412| m,$O$K1
        LOOP      ||$C$L18||, r14.w1    ; [ALU_PRU] $O$L2
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L17||
;*
;*   Loop source line                : 414
;*   Loop closing brace source line  : 414
;*   Known Minimum Trip Count        : 2048
;*   Known Maximum Trip Count        : 2048
;*   Known Max Trip Count Factor     : 2048
;* --------------------------------------------------------------------------*
||$C$L17||:    
;*** 414	-----------------------    *m = K$6;  // [0]
;*** 414	-----------------------    *(++m) = K$6;  // [0]
;*** 414	-----------------------    ++m;  // [0]
;*** 414	-----------------------    if ( --L$2 != 0 ) goto g11;  // [0]
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 414,column 23,is_stmt,isa 0
        SBBO      &r14.b0, r0, 0, 1     ; [ALU_PRU] |414| m,$O$K6
        ADD       r0, r0, 0x01          ; [ALU_PRU] |414| m,m
        SBBO      &r14.b0, r0, 0, 1     ; [ALU_PRU] |414| m,$O$K6
        ADD       r0, r0, 0x01          ; [ALU_PRU] |414| m,m
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 414,column 6,is_stmt,isa 0
        ; END LOOP ; [] |414| 
;* --------------------------------------------------------------------------*
||$C$L18||:    
;*** 412	-----------------------    m = (struct $$fake23 *)K$1+4128;  // [0]
;***  	-----------------------    #pragma MUST_ITERATE(1024, 1024, 1024)
;***  	-----------------------    #pragma LOOP_FLAGS(0u)
;***  	-----------------------    L$3 = 1024u;
;***	-----------------------g6:
;***	-----------------------g10:
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 412,column 14,is_stmt,isa 0
        LDI       r0, 0x1020            ; [ALU_PRU] |412| 
        ADD       r0, r1, r0            ; [ALU_PRU] |412| m,$O$K1
        LDI       r1.w0, 0x0400         ; [ALU_PRU] $O$L3
        LOOP      ||$C$L20||, r1.w0     ; [ALU_PRU] $O$L3
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L19||
;*
;*   Loop source line                : 414
;*   Loop closing brace source line  : 414
;*   Known Minimum Trip Count        : 1024
;*   Known Maximum Trip Count        : 1024
;*   Known Max Trip Count Factor     : 1024
;* --------------------------------------------------------------------------*
||$C$L19||:    
;*** 414	-----------------------    *m = K$6;  // [0]
;*** 414	-----------------------    *(++m) = K$6;  // [0]
;*** 414	-----------------------    ++m;  // [0]
;*** 414	-----------------------    if ( --L$3 != 0 ) goto g10;  // [0]
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 414,column 23,is_stmt,isa 0
        SBBO      &r14.b0, r0, 0, 1     ; [ALU_PRU] |414| m,$O$K6
        ADD       r0, r0, 0x01          ; [ALU_PRU] |414| m,m
        SBBO      &r14.b0, r0, 0, 1     ; [ALU_PRU] |414| m,$O$K6
        ADD       r0, r0, 0x01          ; [ALU_PRU] |414| m,m
	.dwpsn	file "/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h",line 414,column 6,is_stmt,isa 0
        ; END LOOP ; [] |414| 
;* --------------------------------------------------------------------------*
||$C$L20||:    
;***  	-----------------------    return;
$C$DW$66	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$66, DW_AT_low_pc(0x00)
	.dwattr $C$DW$66, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$58, DW_AT_TI_end_file("pru1_iopageregisters.c")
	.dwattr $C$DW$58, DW_AT_TI_end_line(0x96)
	.dwattr $C$DW$58, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$58

;* Inlined function references:
;* [0] memset
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||mailbox||

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x04)
$C$DW$67	.dwtag  DW_TAG_member
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$67, DW_AT_name("REVID")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$67, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$67, DW_AT_bit_size(0x20)
	.dwattr $C$DW$67, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$67, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$67, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$67, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$67, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$19, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$19

$C$DW$T$60	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$19)


$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x04)
$C$DW$68	.dwtag  DW_TAG_member
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$68, DW_AT_name("IDLE_MODE")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("IDLE_MODE")
	.dwattr $C$DW$68, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$68, DW_AT_bit_size(0x02)
	.dwattr $C$DW$68, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$68, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$68, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$68, DW_AT_decl_line(0x37)
	.dwattr $C$DW$68, DW_AT_decl_column(0x0d)

$C$DW$69	.dwtag  DW_TAG_member
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$69, DW_AT_name("STANDBY_MODE")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("STANDBY_MODE")
	.dwattr $C$DW$69, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$69, DW_AT_bit_size(0x02)
	.dwattr $C$DW$69, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$69, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$69, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$69, DW_AT_decl_line(0x38)
	.dwattr $C$DW$69, DW_AT_decl_column(0x0d)

$C$DW$70	.dwtag  DW_TAG_member
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$70, DW_AT_name("STANDBY_INIT")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("STANDBY_INIT")
	.dwattr $C$DW$70, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$70, DW_AT_bit_size(0x01)
	.dwattr $C$DW$70, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$70, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$70, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$70, DW_AT_decl_line(0x39)
	.dwattr $C$DW$70, DW_AT_decl_column(0x0d)

$C$DW$71	.dwtag  DW_TAG_member
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$71, DW_AT_name("SUB_MWAIT")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("SUB_MWAIT")
	.dwattr $C$DW$71, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$71, DW_AT_bit_size(0x01)
	.dwattr $C$DW$71, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$71, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$71, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$71, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$71, DW_AT_decl_column(0x0d)

$C$DW$72	.dwtag  DW_TAG_member
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$72, DW_AT_name("rsvd6")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("rsvd6")
	.dwattr $C$DW$72, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$72, DW_AT_bit_size(0x1a)
	.dwattr $C$DW$72, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$72, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$72, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$72, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$72, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$20, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$20

$C$DW$T$62	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$20)


$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x04)
$C$DW$73	.dwtag  DW_TAG_member
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$73, DW_AT_name("PRU0_GPI_MODE")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("PRU0_GPI_MODE")
	.dwattr $C$DW$73, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$73, DW_AT_bit_size(0x02)
	.dwattr $C$DW$73, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$73, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$73, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$73, DW_AT_decl_line(0x45)
	.dwattr $C$DW$73, DW_AT_decl_column(0x0d)

$C$DW$74	.dwtag  DW_TAG_member
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$74, DW_AT_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$74, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$74, DW_AT_bit_size(0x01)
	.dwattr $C$DW$74, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$74, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$74, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$74, DW_AT_decl_line(0x46)
	.dwattr $C$DW$74, DW_AT_decl_column(0x0d)

$C$DW$75	.dwtag  DW_TAG_member
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$75, DW_AT_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$75, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$75, DW_AT_bit_size(0x05)
	.dwattr $C$DW$75, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$75, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$75, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$75, DW_AT_decl_line(0x47)
	.dwattr $C$DW$75, DW_AT_decl_column(0x0d)

$C$DW$76	.dwtag  DW_TAG_member
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$76, DW_AT_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$76, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$76, DW_AT_bit_size(0x05)
	.dwattr $C$DW$76, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$76, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$76, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$76, DW_AT_decl_line(0x48)
	.dwattr $C$DW$76, DW_AT_decl_column(0x0d)

$C$DW$77	.dwtag  DW_TAG_member
	.dwattr $C$DW$77, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$77, DW_AT_name("PRU0_GPI_SB")
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("PRU0_GPI_SB")
	.dwattr $C$DW$77, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$77, DW_AT_bit_size(0x01)
	.dwattr $C$DW$77, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$77, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$77, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$77, DW_AT_decl_line(0x49)
	.dwattr $C$DW$77, DW_AT_decl_column(0x0d)

$C$DW$78	.dwtag  DW_TAG_member
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$78, DW_AT_name("PRU0_GPO_MODE")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("PRU0_GPO_MODE")
	.dwattr $C$DW$78, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$78, DW_AT_bit_size(0x01)
	.dwattr $C$DW$78, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$78, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$78, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$78, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$78, DW_AT_decl_column(0x0d)

$C$DW$79	.dwtag  DW_TAG_member
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$79, DW_AT_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$79, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$79, DW_AT_bit_size(0x05)
	.dwattr $C$DW$79, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$79, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$79, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$79, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$79, DW_AT_decl_column(0x0d)

$C$DW$80	.dwtag  DW_TAG_member
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$80, DW_AT_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$80, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$80, DW_AT_bit_size(0x05)
	.dwattr $C$DW$80, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$80, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$80, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$80, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$80, DW_AT_decl_column(0x0d)

$C$DW$81	.dwtag  DW_TAG_member
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$81, DW_AT_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$81, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$81, DW_AT_bit_size(0x01)
	.dwattr $C$DW$81, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$81, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$81, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$81, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$81, DW_AT_decl_column(0x0d)

$C$DW$82	.dwtag  DW_TAG_member
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$82, DW_AT_name("rsvd26")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$82, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$82, DW_AT_bit_size(0x06)
	.dwattr $C$DW$82, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$82, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$82, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$82, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$82, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$21, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$21

$C$DW$T$64	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$21)


$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x04)
$C$DW$83	.dwtag  DW_TAG_member
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$83, DW_AT_name("PRU1_GPI_MODE")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("PRU1_GPI_MODE")
	.dwattr $C$DW$83, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$83, DW_AT_bit_size(0x02)
	.dwattr $C$DW$83, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$83, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$83, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$83, DW_AT_decl_line(0x58)
	.dwattr $C$DW$83, DW_AT_decl_column(0x0d)

$C$DW$84	.dwtag  DW_TAG_member
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$84, DW_AT_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$84, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$84, DW_AT_bit_size(0x01)
	.dwattr $C$DW$84, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$84, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$84, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$84, DW_AT_decl_line(0x59)
	.dwattr $C$DW$84, DW_AT_decl_column(0x0d)

$C$DW$85	.dwtag  DW_TAG_member
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$85, DW_AT_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$85, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$85, DW_AT_bit_size(0x05)
	.dwattr $C$DW$85, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$85, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$85, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$85, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$85, DW_AT_decl_column(0x0d)

$C$DW$86	.dwtag  DW_TAG_member
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$86, DW_AT_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$86, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$86, DW_AT_bit_size(0x05)
	.dwattr $C$DW$86, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$86, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$86, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$86, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$86, DW_AT_decl_column(0x0d)

$C$DW$87	.dwtag  DW_TAG_member
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$87, DW_AT_name("PRU1_GPI_SB")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("PRU1_GPI_SB")
	.dwattr $C$DW$87, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$87, DW_AT_bit_size(0x01)
	.dwattr $C$DW$87, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$87, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$87, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$87, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$87, DW_AT_decl_column(0x0d)

$C$DW$88	.dwtag  DW_TAG_member
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$88, DW_AT_name("PRU1_GPO_MODE")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("PRU1_GPO_MODE")
	.dwattr $C$DW$88, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$88, DW_AT_bit_size(0x01)
	.dwattr $C$DW$88, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$88, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$88, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$88, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$88, DW_AT_decl_column(0x0d)

$C$DW$89	.dwtag  DW_TAG_member
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$89, DW_AT_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$89, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$89, DW_AT_bit_size(0x05)
	.dwattr $C$DW$89, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$89, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$89, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$89, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$89, DW_AT_decl_column(0x0d)

$C$DW$90	.dwtag  DW_TAG_member
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$90, DW_AT_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$90, DW_AT_bit_offset(0x07)
	.dwattr $C$DW$90, DW_AT_bit_size(0x05)
	.dwattr $C$DW$90, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$90, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$90, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$90, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$90, DW_AT_decl_column(0x0d)

$C$DW$91	.dwtag  DW_TAG_member
	.dwattr $C$DW$91, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$91, DW_AT_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$91, DW_AT_bit_offset(0x06)
	.dwattr $C$DW$91, DW_AT_bit_size(0x01)
	.dwattr $C$DW$91, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$91, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$91, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$91, DW_AT_decl_line(0x60)
	.dwattr $C$DW$91, DW_AT_decl_column(0x0d)

$C$DW$92	.dwtag  DW_TAG_member
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$92, DW_AT_name("rsvd26")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$92, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$92, DW_AT_bit_size(0x06)
	.dwattr $C$DW$92, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$92, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$92, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$92, DW_AT_decl_line(0x61)
	.dwattr $C$DW$92, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$22, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$22

$C$DW$T$66	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$66, DW_AT_type(*$C$DW$T$22)


$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x04)
$C$DW$93	.dwtag  DW_TAG_member
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$93, DW_AT_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$93, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$93, DW_AT_bit_size(0x01)
	.dwattr $C$DW$93, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$93, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$93, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$93, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$93, DW_AT_decl_column(0x0d)

$C$DW$94	.dwtag  DW_TAG_member
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$94, DW_AT_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$94, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$94, DW_AT_bit_size(0x01)
	.dwattr $C$DW$94, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$94, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$94, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$94, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$94, DW_AT_decl_column(0x0d)

$C$DW$95	.dwtag  DW_TAG_member
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$95, DW_AT_name("PRU0_CLK_EN")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("PRU0_CLK_EN")
	.dwattr $C$DW$95, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$95, DW_AT_bit_size(0x01)
	.dwattr $C$DW$95, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$95, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$95, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$95, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$95, DW_AT_decl_column(0x0d)

$C$DW$96	.dwtag  DW_TAG_member
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$96, DW_AT_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$96, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$96, DW_AT_bit_size(0x01)
	.dwattr $C$DW$96, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$96, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$96, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$96, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$96, DW_AT_decl_column(0x0d)

$C$DW$97	.dwtag  DW_TAG_member
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$97, DW_AT_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$97, DW_AT_bit_offset(0x1b)
	.dwattr $C$DW$97, DW_AT_bit_size(0x01)
	.dwattr $C$DW$97, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$97, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$97, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$97, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$97, DW_AT_decl_column(0x0d)

$C$DW$98	.dwtag  DW_TAG_member
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$98, DW_AT_name("PRU1_CLK_EN")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("PRU1_CLK_EN")
	.dwattr $C$DW$98, DW_AT_bit_offset(0x1a)
	.dwattr $C$DW$98, DW_AT_bit_size(0x01)
	.dwattr $C$DW$98, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$98, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$98, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$98, DW_AT_decl_line(0x70)
	.dwattr $C$DW$98, DW_AT_decl_column(0x0d)

$C$DW$99	.dwtag  DW_TAG_member
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$99, DW_AT_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$99, DW_AT_bit_offset(0x19)
	.dwattr $C$DW$99, DW_AT_bit_size(0x01)
	.dwattr $C$DW$99, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$99, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$99, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$99, DW_AT_decl_line(0x71)
	.dwattr $C$DW$99, DW_AT_decl_column(0x0d)

$C$DW$100	.dwtag  DW_TAG_member
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$100, DW_AT_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$100, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$100, DW_AT_bit_size(0x01)
	.dwattr $C$DW$100, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$100, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$100, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$100, DW_AT_decl_line(0x72)
	.dwattr $C$DW$100, DW_AT_decl_column(0x0d)

$C$DW$101	.dwtag  DW_TAG_member
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$101, DW_AT_name("INTC_CLK_EN")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("INTC_CLK_EN")
	.dwattr $C$DW$101, DW_AT_bit_offset(0x17)
	.dwattr $C$DW$101, DW_AT_bit_size(0x01)
	.dwattr $C$DW$101, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$101, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$101, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$101, DW_AT_decl_line(0x73)
	.dwattr $C$DW$101, DW_AT_decl_column(0x0d)

$C$DW$102	.dwtag  DW_TAG_member
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$102, DW_AT_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$102, DW_AT_bit_offset(0x16)
	.dwattr $C$DW$102, DW_AT_bit_size(0x01)
	.dwattr $C$DW$102, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$102, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$102, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$102, DW_AT_decl_line(0x74)
	.dwattr $C$DW$102, DW_AT_decl_column(0x0d)

$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$103, DW_AT_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$103, DW_AT_bit_offset(0x15)
	.dwattr $C$DW$103, DW_AT_bit_size(0x01)
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$103, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$103, DW_AT_decl_line(0x75)
	.dwattr $C$DW$103, DW_AT_decl_column(0x0d)

$C$DW$104	.dwtag  DW_TAG_member
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$104, DW_AT_name("UART_CLK_EN")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("UART_CLK_EN")
	.dwattr $C$DW$104, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$104, DW_AT_bit_size(0x01)
	.dwattr $C$DW$104, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$104, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$104, DW_AT_decl_line(0x76)
	.dwattr $C$DW$104, DW_AT_decl_column(0x0d)

$C$DW$105	.dwtag  DW_TAG_member
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$105, DW_AT_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$105, DW_AT_bit_offset(0x13)
	.dwattr $C$DW$105, DW_AT_bit_size(0x01)
	.dwattr $C$DW$105, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$105, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$105, DW_AT_decl_line(0x77)
	.dwattr $C$DW$105, DW_AT_decl_column(0x0d)

$C$DW$106	.dwtag  DW_TAG_member
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$106, DW_AT_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$106, DW_AT_bit_offset(0x12)
	.dwattr $C$DW$106, DW_AT_bit_size(0x01)
	.dwattr $C$DW$106, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$106, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$106, DW_AT_decl_line(0x78)
	.dwattr $C$DW$106, DW_AT_decl_column(0x0d)

$C$DW$107	.dwtag  DW_TAG_member
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$107, DW_AT_name("ECAP_CLK_EN")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("ECAP_CLK_EN")
	.dwattr $C$DW$107, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$107, DW_AT_bit_size(0x01)
	.dwattr $C$DW$107, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$107, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$107, DW_AT_decl_line(0x79)
	.dwattr $C$DW$107, DW_AT_decl_column(0x0d)

$C$DW$108	.dwtag  DW_TAG_member
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$108, DW_AT_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$108, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$108, DW_AT_bit_size(0x01)
	.dwattr $C$DW$108, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$108, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$108, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$108, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$108, DW_AT_decl_column(0x0d)

$C$DW$109	.dwtag  DW_TAG_member
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$109, DW_AT_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$109, DW_AT_bit_offset(0x0f)
	.dwattr $C$DW$109, DW_AT_bit_size(0x01)
	.dwattr $C$DW$109, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$109, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$109, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$109, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$109, DW_AT_decl_column(0x0d)

$C$DW$110	.dwtag  DW_TAG_member
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$110, DW_AT_name("IEP_CLK_EN")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("IEP_CLK_EN")
	.dwattr $C$DW$110, DW_AT_bit_offset(0x0e)
	.dwattr $C$DW$110, DW_AT_bit_size(0x01)
	.dwattr $C$DW$110, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$110, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$110, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$110, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$110, DW_AT_decl_column(0x0d)

$C$DW$111	.dwtag  DW_TAG_member
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$111, DW_AT_name("rsvd18")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("rsvd18")
	.dwattr $C$DW$111, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$111, DW_AT_bit_size(0x0e)
	.dwattr $C$DW$111, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$111, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$111, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$111, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$111, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$23, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$23

$C$DW$T$68	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$68, DW_AT_type(*$C$DW$T$23)


$C$DW$T$24	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x04)
$C$DW$112	.dwtag  DW_TAG_member
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$112, DW_AT_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$112, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$112, DW_AT_bit_size(0x04)
	.dwattr $C$DW$112, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$112, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$112, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$112, DW_AT_decl_line(0x87)
	.dwattr $C$DW$112, DW_AT_decl_column(0x0d)

$C$DW$113	.dwtag  DW_TAG_member
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$113, DW_AT_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$113, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$113, DW_AT_bit_size(0x04)
	.dwattr $C$DW$113, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$113, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$113, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$113, DW_AT_decl_line(0x88)
	.dwattr $C$DW$113, DW_AT_decl_column(0x0d)

$C$DW$114	.dwtag  DW_TAG_member
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$114, DW_AT_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$114, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$114, DW_AT_bit_size(0x04)
	.dwattr $C$DW$114, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$114, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$114, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$114, DW_AT_decl_line(0x89)
	.dwattr $C$DW$114, DW_AT_decl_column(0x0d)

$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$115, DW_AT_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$115, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$115, DW_AT_bit_size(0x04)
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$115, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$115, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$115, DW_AT_decl_column(0x0d)

$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$116, DW_AT_name("RAM_PE_RAW")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("RAM_PE_RAW")
	.dwattr $C$DW$116, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$116, DW_AT_bit_size(0x04)
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$116, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$116, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$116, DW_AT_decl_column(0x0d)

$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$117, DW_AT_name("rsvd20")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$117, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$117, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$117, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$117, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$117, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$24, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x86)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$24

$C$DW$T$70	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$70, DW_AT_type(*$C$DW$T$24)


$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x04)
$C$DW$118	.dwtag  DW_TAG_member
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$118, DW_AT_name("PRU0_IMEM_PE")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("PRU0_IMEM_PE")
	.dwattr $C$DW$118, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$118, DW_AT_bit_size(0x04)
	.dwattr $C$DW$118, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$118, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$118, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$118, DW_AT_decl_line(0x96)
	.dwattr $C$DW$118, DW_AT_decl_column(0x0d)

$C$DW$119	.dwtag  DW_TAG_member
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$119, DW_AT_name("PRU0_DMEM_PE")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("PRU0_DMEM_PE")
	.dwattr $C$DW$119, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$119, DW_AT_bit_size(0x04)
	.dwattr $C$DW$119, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$119, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$119, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$119, DW_AT_decl_line(0x97)
	.dwattr $C$DW$119, DW_AT_decl_column(0x0d)

$C$DW$120	.dwtag  DW_TAG_member
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$120, DW_AT_name("PRU1_IMEM_PE")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("PRU1_IMEM_PE")
	.dwattr $C$DW$120, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$120, DW_AT_bit_size(0x04)
	.dwattr $C$DW$120, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$120, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$120, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$120, DW_AT_decl_line(0x98)
	.dwattr $C$DW$120, DW_AT_decl_column(0x0d)

$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$121, DW_AT_name("PRU1_DMEM_PE")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("PRU1_DMEM_PE")
	.dwattr $C$DW$121, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$121, DW_AT_bit_size(0x04)
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$121, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$121, DW_AT_decl_line(0x99)
	.dwattr $C$DW$121, DW_AT_decl_column(0x0d)

$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$122, DW_AT_name("RAM_PE")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("RAM_PE")
	.dwattr $C$DW$122, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$122, DW_AT_bit_size(0x04)
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$122, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$122, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$122, DW_AT_decl_column(0x0d)

$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$123, DW_AT_name("rsvd20")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$123, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$123, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$123, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$123, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$123, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$25, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$25

$C$DW$T$72	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$72, DW_AT_type(*$C$DW$T$25)


$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x04)
$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$124, DW_AT_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$124, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$124, DW_AT_bit_size(0x04)
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$124, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$124, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$124, DW_AT_decl_column(0x0d)

$C$DW$125	.dwtag  DW_TAG_member
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$125, DW_AT_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$125, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$125, DW_AT_bit_size(0x04)
	.dwattr $C$DW$125, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$125, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$125, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$125, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$125, DW_AT_decl_column(0x0d)

$C$DW$126	.dwtag  DW_TAG_member
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$126, DW_AT_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$126, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$126, DW_AT_bit_size(0x04)
	.dwattr $C$DW$126, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$126, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$126, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$126, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$126, DW_AT_decl_column(0x0d)

$C$DW$127	.dwtag  DW_TAG_member
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$127, DW_AT_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$127, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$127, DW_AT_bit_size(0x04)
	.dwattr $C$DW$127, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$127, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$127, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$127, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$127, DW_AT_decl_column(0x0d)

$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$128, DW_AT_name("RAM_PE_SET")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("RAM_PE_SET")
	.dwattr $C$DW$128, DW_AT_bit_offset(0x0c)
	.dwattr $C$DW$128, DW_AT_bit_size(0x04)
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$128, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$128, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$128, DW_AT_decl_column(0x0d)

$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$129, DW_AT_name("rsvd20")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$129, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$129, DW_AT_bit_size(0x0c)
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$129, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$129, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$129, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$26, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$26

$C$DW$T$74	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$74, DW_AT_type(*$C$DW$T$26)


$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x04)
$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$130, DW_AT_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$130, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$130, DW_AT_bit_size(0x04)
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$130, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$130, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$130, DW_AT_decl_column(0x0d)

$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$131, DW_AT_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$131, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$131, DW_AT_bit_size(0x04)
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$131, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$131, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$131, DW_AT_decl_column(0x0d)

$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$132, DW_AT_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$132, DW_AT_bit_offset(0x14)
	.dwattr $C$DW$132, DW_AT_bit_size(0x04)
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$132, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$132, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$132, DW_AT_decl_column(0x0d)

$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$133, DW_AT_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$133, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$133, DW_AT_bit_size(0x04)
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$133, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$133, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$133, DW_AT_decl_column(0x0d)

$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$134, DW_AT_name("rsvd16")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$134, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$134, DW_AT_bit_size(0x10)
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$134, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$134, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$134, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$27, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$27

$C$DW$T$76	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$76, DW_AT_type(*$C$DW$T$27)


$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x04)
$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$135, DW_AT_name("PMAO_PRU0")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("PMAO_PRU0")
	.dwattr $C$DW$135, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$135, DW_AT_bit_size(0x01)
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$135, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$135, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$135, DW_AT_decl_column(0x0d)

$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$136, DW_AT_name("PMAO_PRU1")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("PMAO_PRU1")
	.dwattr $C$DW$136, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$136, DW_AT_bit_size(0x01)
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$136, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$136, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$136, DW_AT_decl_column(0x0d)

$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$137, DW_AT_name("rsvd2")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$137, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$137, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$137, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$137, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$137, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$28, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$28

$C$DW$T$78	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$78, DW_AT_type(*$C$DW$T$28)


$C$DW$T$29	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x04)
$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$138, DW_AT_name("OCP_EN")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("OCP_EN")
	.dwattr $C$DW$138, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$138, DW_AT_bit_size(0x01)
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$138, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$138, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$138, DW_AT_decl_column(0x0d)

$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$139, DW_AT_name("rsvd1")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$139, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$139, DW_AT_bit_size(0x1f)
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$139, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$139, DW_AT_decl_line(0xd4)
	.dwattr $C$DW$139, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$29, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$29, DW_AT_decl_line(0xd2)
	.dwattr $C$DW$T$29, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$29

$C$DW$T$80	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$80, DW_AT_type(*$C$DW$T$29)


$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x04)
$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$140, DW_AT_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$140, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$140, DW_AT_bit_size(0x01)
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$140, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$140, DW_AT_decl_line(0xde)
	.dwattr $C$DW$140, DW_AT_decl_column(0x0d)

$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$141, DW_AT_name("XFR_SHIFT_EN")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("XFR_SHIFT_EN")
	.dwattr $C$DW$141, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$141, DW_AT_bit_size(0x01)
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$141, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$141, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$141, DW_AT_decl_column(0x0d)

$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$142, DW_AT_name("rsvd2")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$142, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$142, DW_AT_bit_size(0x1e)
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$142, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$142, DW_AT_decl_line(0xe0)
	.dwattr $C$DW$142, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$30, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$30

$C$DW$T$82	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$82, DW_AT_type(*$C$DW$T$30)


$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x04)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$143, DW_AT_name("PIN_MUX_SEL")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("PIN_MUX_SEL")
	.dwattr $C$DW$143, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$143, DW_AT_bit_size(0x08)
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$143, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$143, DW_AT_decl_line(0xec)
	.dwattr $C$DW$143, DW_AT_decl_column(0x0d)

$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$144, DW_AT_name("rsvd2")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$144, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$144, DW_AT_bit_size(0x18)
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$144, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$144, DW_AT_decl_line(0xed)
	.dwattr $C$DW$144, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$31, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$31

$C$DW$T$84	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$84, DW_AT_type(*$C$DW$T$31)


$C$DW$T$35	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x44)
$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$145, DW_AT_name("$P$T0")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$145, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$145, DW_AT_decl_line(0x29)
	.dwattr $C$DW$145, DW_AT_decl_column(0x02)

$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$146, DW_AT_name("$P$T1")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$146, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$146, DW_AT_decl_line(0x33)
	.dwattr $C$DW$146, DW_AT_decl_column(0x02)

$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$147, DW_AT_name("$P$T2")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$147, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$147, DW_AT_decl_line(0x41)
	.dwattr $C$DW$147, DW_AT_decl_column(0x02)

$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$148, DW_AT_name("$P$T3")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$148, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$148, DW_AT_decl_line(0x54)
	.dwattr $C$DW$148, DW_AT_decl_column(0x02)

$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$69)
	.dwattr $C$DW$149, DW_AT_name("$P$T4")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$149, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$149, DW_AT_decl_line(0x67)
	.dwattr $C$DW$149, DW_AT_decl_column(0x02)

$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$150, DW_AT_name("$P$T5")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$150, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$150, DW_AT_decl_line(0x83)
	.dwattr $C$DW$150, DW_AT_decl_column(0x02)

$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$73)
	.dwattr $C$DW$151, DW_AT_name("$P$T6")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$151, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$151, DW_AT_decl_line(0x92)
	.dwattr $C$DW$151, DW_AT_decl_column(0x02)

$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$75)
	.dwattr $C$DW$152, DW_AT_name("$P$T7")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$152, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$152, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$152, DW_AT_decl_column(0x02)

$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$77)
	.dwattr $C$DW$153, DW_AT_name("$P$T8")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$153, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$153, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$153, DW_AT_decl_column(0x02)

$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$154, DW_AT_name("rsvd24")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$154, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$154, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$154, DW_AT_decl_column(0x0b)

$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$79)
	.dwattr $C$DW$155, DW_AT_name("$P$T9")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("$P$T9")
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$155, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$155, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$155, DW_AT_decl_column(0x02)

$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$156, DW_AT_name("rsvd2c")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("rsvd2c")
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$156, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$156, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$156, DW_AT_decl_column(0x0b)

$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$81)
	.dwattr $C$DW$157, DW_AT_name("$P$T10")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("$P$T10")
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$157, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$157, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$157, DW_AT_decl_column(0x02)

$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$158, DW_AT_name("$P$T11")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("$P$T11")
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$158, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$158, DW_AT_decl_line(0xda)
	.dwattr $C$DW$158, DW_AT_decl_column(0x02)

$C$DW$159	.dwtag  DW_TAG_member
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$159, DW_AT_name("rsvd38")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("rsvd38")
	.dwattr $C$DW$159, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$159, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$159, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$159, DW_AT_decl_column(0x0b)

$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$85)
	.dwattr $C$DW$160, DW_AT_name("$P$T12")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("$P$T12")
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$160, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$160, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$160, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$35, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$35

$C$DW$T$95	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$95, DW_AT_name("pruCfg")
	.dwattr $C$DW$T$95, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$95, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$95, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$95, DW_AT_decl_line(0xf0)
	.dwattr $C$DW$T$95, DW_AT_decl_column(0x03)

$C$DW$T$96	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$96, DW_AT_type(*$C$DW$T$95)


$C$DW$T$36	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$36, DW_AT_byte_size(0x40000)
$C$DW$161	.dwtag  DW_TAG_member
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$161, DW_AT_name("$P$T13")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("$P$T13")
	.dwattr $C$DW$161, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$161, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$161, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$161, DW_AT_decl_line(0x34)
	.dwattr $C$DW$161, DW_AT_decl_column(0x02)

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
$C$DW$162	.dwtag  DW_TAG_member
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$162, DW_AT_name("memory")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("memory")
	.dwattr $C$DW$162, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$162, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$162, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/ddrmem.h")
	.dwattr $C$DW$162, DW_AT_decl_line(0x17)
	.dwattr $C$DW$162, DW_AT_decl_column(0x12)

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
$C$DW$163	.dwtag  DW_TAG_member
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$163, DW_AT_name("eventmask")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("eventmask")
	.dwattr $C$DW$163, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$163, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$163, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$163, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$163, DW_AT_decl_column(0x0a)

$C$DW$164	.dwtag  DW_TAG_member
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$164, DW_AT_name("unibus_control")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("unibus_control")
	.dwattr $C$DW$164, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$164, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$164, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$164, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$164, DW_AT_decl_column(0x0a)

$C$DW$165	.dwtag  DW_TAG_member
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$165, DW_AT_name("device_handle")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("device_handle")
	.dwattr $C$DW$165, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$165, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$165, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$165, DW_AT_decl_line(0x7f)
	.dwattr $C$DW$165, DW_AT_decl_column(0x0a)

$C$DW$166	.dwtag  DW_TAG_member
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$166, DW_AT_name("device_register_idx")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("device_register_idx")
	.dwattr $C$DW$166, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$166, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$166, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$166, DW_AT_decl_line(0x81)
	.dwattr $C$DW$166, DW_AT_decl_column(0x0a)

$C$DW$167	.dwtag  DW_TAG_member
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$167, DW_AT_name("addr")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$167, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$167, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$167, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$167, DW_AT_decl_line(0x83)
	.dwattr $C$DW$167, DW_AT_decl_column(0x0b)

$C$DW$168	.dwtag  DW_TAG_member
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$168, DW_AT_name("data")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("data")
	.dwattr $C$DW$168, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$168, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$168, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$168, DW_AT_decl_line(0x84)
	.dwattr $C$DW$168, DW_AT_decl_column(0x0b)

$C$DW$169	.dwtag  DW_TAG_member
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$169, DW_AT_name("initialization_signals_prev")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("initialization_signals_prev")
	.dwattr $C$DW$169, DW_AT_data_member_location[DW_OP_plus_uconst 0xa]
	.dwattr $C$DW$169, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$169, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$169, DW_AT_decl_line(0x87)
	.dwattr $C$DW$169, DW_AT_decl_column(0x0a)

$C$DW$170	.dwtag  DW_TAG_member
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$170, DW_AT_name("initialization_signals_cur")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("initialization_signals_cur")
	.dwattr $C$DW$170, DW_AT_data_member_location[DW_OP_plus_uconst 0xb]
	.dwattr $C$DW$170, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$170, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$170, DW_AT_decl_line(0x88)
	.dwattr $C$DW$170, DW_AT_decl_column(0x0a)

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
$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$171, DW_AT_name("addr")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$171, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$171, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$171, DW_AT_decl_column(0x0b)

$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$172, DW_AT_name("val")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$172, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$172, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$172, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$42, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$42

$C$DW$T$89	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$89, DW_AT_name("mailbox_test_t")
	.dwattr $C$DW$T$89, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$T$89, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$89, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$89, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$89, DW_AT_decl_column(0x03)


$C$DW$T$43	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$43, DW_AT_byte_size(0x0c)
$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$173, DW_AT_name("addr")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("addr")
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$173, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$173, DW_AT_decl_line(0x51)
	.dwattr $C$DW$173, DW_AT_decl_column(0x0b)

$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$174, DW_AT_name("bitmask")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("bitmask")
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$174, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$174, DW_AT_decl_line(0x52)
	.dwattr $C$DW$174, DW_AT_decl_column(0x0b)

$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$175, DW_AT_name("val")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("val")
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$175, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$175, DW_AT_decl_line(0x53)
	.dwattr $C$DW$175, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$43, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x50)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$43

$C$DW$T$90	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$90, DW_AT_name("mailbox_buslatch_t")
	.dwattr $C$DW$T$90, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$T$90, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$90, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$90, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$90, DW_AT_decl_column(0x03)


$C$DW$T$44	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x04)
$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$176, DW_AT_name("addr_0_7")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("addr_0_7")
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$176, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$176, DW_AT_decl_line(0x57)
	.dwattr $C$DW$176, DW_AT_decl_column(0x0a)

$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$177, DW_AT_name("addr_8_15")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("addr_8_15")
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$177, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$177, DW_AT_decl_line(0x58)
	.dwattr $C$DW$177, DW_AT_decl_column(0x0a)

$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$178, DW_AT_name("data_0_7")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("data_0_7")
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$178, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$178, DW_AT_decl_line(0x59)
	.dwattr $C$DW$178, DW_AT_decl_column(0x0a)

$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$179, DW_AT_name("data_8_15")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("data_8_15")
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x3]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$179, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$179, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$179, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$44, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$44

$C$DW$T$91	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$91, DW_AT_name("mailbox_buslatch_test_t")
	.dwattr $C$DW$T$91, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$T$91, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$91, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$91, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$T$91, DW_AT_decl_column(0x03)


$C$DW$T$46	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x40c)
$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$180, DW_AT_name("cur_status")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("cur_status")
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$180, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$180, DW_AT_decl_line(0x61)
	.dwattr $C$DW$180, DW_AT_decl_column(0x0a)

$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$181, DW_AT_name("control")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("control")
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$181, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$181, DW_AT_decl_line(0x62)
	.dwattr $C$DW$181, DW_AT_decl_column(0x0a)

$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$182, DW_AT_name("wordcount")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("wordcount")
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$182, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$182, DW_AT_decl_line(0x63)
	.dwattr $C$DW$182, DW_AT_decl_column(0x0b)

$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$183, DW_AT_name("cur_addr")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("cur_addr")
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$183, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$183, DW_AT_decl_line(0x64)
	.dwattr $C$DW$183, DW_AT_decl_column(0x0b)

$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$184, DW_AT_name("startaddr")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("startaddr")
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$184, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$184, DW_AT_decl_line(0x65)
	.dwattr $C$DW$184, DW_AT_decl_column(0x0b)

$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$185, DW_AT_name("words")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("words")
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$185, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$185, DW_AT_decl_line(0x66)
	.dwattr $C$DW$185, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$46, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$46, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$T$46, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$46

$C$DW$T$92	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$92, DW_AT_name("mailbox_dma_t")
	.dwattr $C$DW$T$92, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$T$92, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$92, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$92, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$92, DW_AT_decl_column(0x03)


$C$DW$T$47	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x03)
$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$186, DW_AT_name("vector")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("vector")
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$186, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$186, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$186, DW_AT_decl_column(0x0b)

$C$DW$187	.dwtag  DW_TAG_member
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$187, DW_AT_name("priority_bit")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("priority_bit")
	.dwattr $C$DW$187, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$187, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$187, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$187, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$187, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$47, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$47

$C$DW$T$93	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$93, DW_AT_name("mailbox_intr_t")
	.dwattr $C$DW$T$93, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$T$93, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$93, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$93, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$T$93, DW_AT_decl_column(0x03)


$C$DW$T$52	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$52, DW_AT_byte_size(0x424)
$C$DW$188	.dwtag  DW_TAG_member
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$188, DW_AT_name("arm2pru_req")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("arm2pru_req")
	.dwattr $C$DW$188, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$188, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$188, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$188, DW_AT_decl_line(0x90)
	.dwattr $C$DW$188, DW_AT_decl_column(0x0b)

$C$DW$189	.dwtag  DW_TAG_member
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$189, DW_AT_name("arm2pru_resp")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("arm2pru_resp")
	.dwattr $C$DW$189, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$189, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$189, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$189, DW_AT_decl_line(0x91)
	.dwattr $C$DW$189, DW_AT_decl_column(0x0b)

$C$DW$190	.dwtag  DW_TAG_member
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$190, DW_AT_name("ddrmem_base_physical")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("ddrmem_base_physical")
	.dwattr $C$DW$190, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$190, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$190, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$190, DW_AT_decl_line(0x94)
	.dwattr $C$DW$190, DW_AT_decl_column(0x15)

$C$DW$191	.dwtag  DW_TAG_member
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$191, DW_AT_name("events")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("events")
	.dwattr $C$DW$191, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$191, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$191, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$191, DW_AT_decl_line(0x97)
	.dwattr $C$DW$191, DW_AT_decl_column(0x13)

$C$DW$192	.dwtag  DW_TAG_member
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$94)
	.dwattr $C$DW$192, DW_AT_name("$P$T14")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("$P$T14")
	.dwattr $C$DW$192, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$192, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$192, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$192, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$192, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$52, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$52, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$T$52, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$52

$C$DW$T$101	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$101, DW_AT_type(*$C$DW$T$52)

$C$DW$T$102	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$102, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$T$102, DW_AT_address_class(0x20)

$C$DW$T$103	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$103, DW_AT_name("mailbox_t")
	.dwattr $C$DW$T$103, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$T$103, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$103, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$103, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$T$103, DW_AT_decl_column(0x03)

$C$DW$T$104	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$104, DW_AT_type(*$C$DW$T$103)


$C$DW$T$53	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x08)
$C$DW$193	.dwtag  DW_TAG_member
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$193, DW_AT_name("value")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("value")
	.dwattr $C$DW$193, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$193, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$193, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$193, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$193, DW_AT_decl_column(0x0b)

$C$DW$194	.dwtag  DW_TAG_member
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$194, DW_AT_name("writable_bits")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("writable_bits")
	.dwattr $C$DW$194, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$194, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$194, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$194, DW_AT_decl_line(0x87)
	.dwattr $C$DW$194, DW_AT_decl_column(0x0b)

$C$DW$195	.dwtag  DW_TAG_member
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$195, DW_AT_name("event_flags")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("event_flags")
	.dwattr $C$DW$195, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$195, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$195, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$195, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$195, DW_AT_decl_column(0x0a)

$C$DW$196	.dwtag  DW_TAG_member
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$196, DW_AT_name("event_device_handle")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("event_device_handle")
	.dwattr $C$DW$196, DW_AT_data_member_location[DW_OP_plus_uconst 0x5]
	.dwattr $C$DW$196, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$196, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$196, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$196, DW_AT_decl_column(0x0a)

$C$DW$197	.dwtag  DW_TAG_member
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$197, DW_AT_name("event_device_register_idx")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("event_device_register_idx")
	.dwattr $C$DW$197, DW_AT_data_member_location[DW_OP_plus_uconst 0x6]
	.dwattr $C$DW$197, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$197, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$197, DW_AT_decl_line(0x8e)
	.dwattr $C$DW$197, DW_AT_decl_column(0x0a)

$C$DW$198	.dwtag  DW_TAG_member
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$198, DW_AT_name("dummy")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("dummy")
	.dwattr $C$DW$198, DW_AT_data_member_location[DW_OP_plus_uconst 0x7]
	.dwattr $C$DW$198, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$198, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$198, DW_AT_decl_line(0x93)
	.dwattr $C$DW$198, DW_AT_decl_column(0x0a)

	.dwattr $C$DW$T$53, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$53

$C$DW$T$105	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$105, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$105, DW_AT_address_class(0x20)

$C$DW$T$56	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$56, DW_AT_name("iopageregister_t")
	.dwattr $C$DW$T$56, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$56, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$56, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$T$56, DW_AT_decl_line(0x94)
	.dwattr $C$DW$T$56, DW_AT_decl_column(0x03)


$C$DW$T$57	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$57, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$57, DW_AT_byte_size(0x800)
$C$DW$199	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$199, DW_AT_upper_bound(0xff)

	.dwendtag $C$DW$T$57

$C$DW$T$106	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$106, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$106, DW_AT_address_class(0x20)


$C$DW$T$58	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x1820)
$C$DW$200	.dwtag  DW_TAG_member
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$200, DW_AT_name("pagetable")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("pagetable")
	.dwattr $C$DW$200, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$200, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$200, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$200, DW_AT_decl_line(0x99)
	.dwattr $C$DW$200, DW_AT_decl_column(0x0a)

$C$DW$201	.dwtag  DW_TAG_member
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$201, DW_AT_name("iopage_register_handles")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("iopage_register_handles")
	.dwattr $C$DW$201, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$201, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$201, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$201, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$201, DW_AT_decl_column(0x0a)

$C$DW$202	.dwtag  DW_TAG_member
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$202, DW_AT_name("registers")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("registers")
	.dwattr $C$DW$202, DW_AT_data_member_location[DW_OP_plus_uconst 0x1020]
	.dwattr $C$DW$202, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$202, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$202, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$202, DW_AT_decl_column(0x13)

	.dwattr $C$DW$T$58, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x96)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$58

$C$DW$T$108	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$108, DW_AT_name("iopageregisters_t")
	.dwattr $C$DW$T$108, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$108, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$108, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/iopageregister.h")
	.dwattr $C$DW$T$108, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$T$108, DW_AT_decl_column(0x03)


$C$DW$T$61	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$61, DW_AT_byte_size(0x04)
$C$DW$203	.dwtag  DW_TAG_member
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$203, DW_AT_name("REVID")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$203, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$203, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$203, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$203, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$203, DW_AT_decl_column(0x15)

$C$DW$204	.dwtag  DW_TAG_member
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$204, DW_AT_name("REVID_bit")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$204, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$204, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$204, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$204, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$204, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$61, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$61


$C$DW$T$63	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x04)
$C$DW$205	.dwtag  DW_TAG_member
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$205, DW_AT_name("SYSCFG")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("SYSCFG")
	.dwattr $C$DW$205, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$205, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$205, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$205, DW_AT_decl_line(0x34)
	.dwattr $C$DW$205, DW_AT_decl_column(0x15)

$C$DW$206	.dwtag  DW_TAG_member
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$206, DW_AT_name("SYSCFG_bit")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("SYSCFG_bit")
	.dwattr $C$DW$206, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$206, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$206, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$206, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$206, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$63, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$63


$C$DW$T$65	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$65, DW_AT_byte_size(0x04)
$C$DW$207	.dwtag  DW_TAG_member
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$207, DW_AT_name("GPCFG0")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("GPCFG0")
	.dwattr $C$DW$207, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$207, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$207, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$207, DW_AT_decl_line(0x42)
	.dwattr $C$DW$207, DW_AT_decl_column(0x15)

$C$DW$208	.dwtag  DW_TAG_member
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$64)
	.dwattr $C$DW$208, DW_AT_name("GPCFG0_bit")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("GPCFG0_bit")
	.dwattr $C$DW$208, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$208, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$208, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$208, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$208, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$65, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$65


$C$DW$T$67	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$67, DW_AT_byte_size(0x04)
$C$DW$209	.dwtag  DW_TAG_member
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$209, DW_AT_name("GPCFG1")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("GPCFG1")
	.dwattr $C$DW$209, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$209, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$209, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$209, DW_AT_decl_line(0x55)
	.dwattr $C$DW$209, DW_AT_decl_column(0x15)

$C$DW$210	.dwtag  DW_TAG_member
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$210, DW_AT_name("GPCFG1_bit")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("GPCFG1_bit")
	.dwattr $C$DW$210, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$210, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$210, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$210, DW_AT_decl_line(0x62)
	.dwattr $C$DW$210, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$67, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$67


$C$DW$T$69	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$69, DW_AT_byte_size(0x04)
$C$DW$211	.dwtag  DW_TAG_member
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$211, DW_AT_name("CGR")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("CGR")
	.dwattr $C$DW$211, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$211, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$211, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$211, DW_AT_decl_line(0x68)
	.dwattr $C$DW$211, DW_AT_decl_column(0x15)

$C$DW$212	.dwtag  DW_TAG_member
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$212, DW_AT_name("CGR_bit")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("CGR_bit")
	.dwattr $C$DW$212, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$212, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$212, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$212, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$212, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$69, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$69


$C$DW$T$71	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$71, DW_AT_byte_size(0x04)
$C$DW$213	.dwtag  DW_TAG_member
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$213, DW_AT_name("ISRP")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("ISRP")
	.dwattr $C$DW$213, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$213, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$213, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$213, DW_AT_decl_line(0x84)
	.dwattr $C$DW$213, DW_AT_decl_column(0x15)

$C$DW$214	.dwtag  DW_TAG_member
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$70)
	.dwattr $C$DW$214, DW_AT_name("ISRP_bit")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("ISRP_bit")
	.dwattr $C$DW$214, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$214, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$214, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$214, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$214, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$71, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$71, DW_AT_decl_line(0x83)
	.dwattr $C$DW$T$71, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$71


$C$DW$T$73	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$73, DW_AT_byte_size(0x04)
$C$DW$215	.dwtag  DW_TAG_member
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$215, DW_AT_name("ISP")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("ISP")
	.dwattr $C$DW$215, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$215, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$215, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$215, DW_AT_decl_line(0x93)
	.dwattr $C$DW$215, DW_AT_decl_column(0x15)

$C$DW$216	.dwtag  DW_TAG_member
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$72)
	.dwattr $C$DW$216, DW_AT_name("ISP_bit")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("ISP_bit")
	.dwattr $C$DW$216, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$216, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$216, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$216, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$216, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$73, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$73, DW_AT_decl_line(0x92)
	.dwattr $C$DW$T$73, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$73


$C$DW$T$75	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$75, DW_AT_byte_size(0x04)
$C$DW$217	.dwtag  DW_TAG_member
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$217, DW_AT_name("IESP")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("IESP")
	.dwattr $C$DW$217, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$217, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$217, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$217, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$217, DW_AT_decl_column(0x15)

$C$DW$218	.dwtag  DW_TAG_member
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$218, DW_AT_name("IESP_bit")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("IESP_bit")
	.dwattr $C$DW$218, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$218, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$218, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$218, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$218, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$75, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$75, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$75, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$75


$C$DW$T$77	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$77, DW_AT_byte_size(0x04)
$C$DW$219	.dwtag  DW_TAG_member
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$219, DW_AT_name("IECP")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("IECP")
	.dwattr $C$DW$219, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$219, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$219, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$219, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$219, DW_AT_decl_column(0x15)

$C$DW$220	.dwtag  DW_TAG_member
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$76)
	.dwattr $C$DW$220, DW_AT_name("IECP_bit")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("IECP_bit")
	.dwattr $C$DW$220, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$220, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$220, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$220, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$220, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$77, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$77, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$77, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$77


$C$DW$T$79	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$79, DW_AT_byte_size(0x04)
$C$DW$221	.dwtag  DW_TAG_member
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$221, DW_AT_name("PMAO")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("PMAO")
	.dwattr $C$DW$221, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$221, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$221, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$221, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$221, DW_AT_decl_column(0x15)

$C$DW$222	.dwtag  DW_TAG_member
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$222, DW_AT_name("PMAO_bit")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("PMAO_bit")
	.dwattr $C$DW$222, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$222, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$222, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$222, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$222, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$79, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$79, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$T$79, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$79


$C$DW$T$81	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$81, DW_AT_byte_size(0x04)
$C$DW$223	.dwtag  DW_TAG_member
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$223, DW_AT_name("IEPCLK")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("IEPCLK")
	.dwattr $C$DW$223, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$223, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$223, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$223, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$223, DW_AT_decl_column(0x15)

$C$DW$224	.dwtag  DW_TAG_member
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$80)
	.dwattr $C$DW$224, DW_AT_name("IEPCLK_bit")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("IEPCLK_bit")
	.dwattr $C$DW$224, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$224, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$224, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$224, DW_AT_decl_line(0xd5)
	.dwattr $C$DW$224, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$81, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$81, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$T$81, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$81


$C$DW$T$83	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$83, DW_AT_byte_size(0x04)
$C$DW$225	.dwtag  DW_TAG_member
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$225, DW_AT_name("SPP")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("SPP")
	.dwattr $C$DW$225, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$225, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$225, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$225, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$225, DW_AT_decl_column(0x15)

$C$DW$226	.dwtag  DW_TAG_member
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$226, DW_AT_name("SPP_bit")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("SPP_bit")
	.dwattr $C$DW$226, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$226, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$226, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$226, DW_AT_decl_line(0xe1)
	.dwattr $C$DW$226, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$83, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$83, DW_AT_decl_line(0xda)
	.dwattr $C$DW$T$83, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$83


$C$DW$T$85	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$85, DW_AT_byte_size(0x04)
$C$DW$227	.dwtag  DW_TAG_member
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$227, DW_AT_name("PIN_MX")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("PIN_MX")
	.dwattr $C$DW$227, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$227, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$227, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$227, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$227, DW_AT_decl_column(0x15)

$C$DW$228	.dwtag  DW_TAG_member
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$228, DW_AT_name("PIN_MX_bit")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("PIN_MX_bit")
	.dwattr $C$DW$228, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$228, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$228, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$228, DW_AT_decl_line(0xee)
	.dwattr $C$DW$228, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$85, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/pru-software-support-package/include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$85, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$T$85, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$85


$C$DW$T$88	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$88, DW_AT_byte_size(0x40000)
$C$DW$229	.dwtag  DW_TAG_member
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$229, DW_AT_name("words")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("words")
	.dwattr $C$DW$229, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$229, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$229, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$229, DW_AT_decl_line(0x35)
	.dwattr $C$DW$229, DW_AT_decl_column(0x0b)

$C$DW$230	.dwtag  DW_TAG_member
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$87)
	.dwattr $C$DW$230, DW_AT_name("bytes")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("bytes")
	.dwattr $C$DW$230, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$230, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$230, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$230, DW_AT_decl_line(0x36)
	.dwattr $C$DW$230, DW_AT_decl_column(0x0b)

	.dwattr $C$DW$T$88, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/unibus.h")
	.dwattr $C$DW$T$88, DW_AT_decl_line(0x34)
	.dwattr $C$DW$T$88, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$88


$C$DW$T$94	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$94, DW_AT_byte_size(0x40c)
$C$DW$231	.dwtag  DW_TAG_member
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$231, DW_AT_name("mailbox_test")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("mailbox_test")
	.dwattr $C$DW$231, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$231, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$231, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$231, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$231, DW_AT_decl_column(0x12)

$C$DW$232	.dwtag  DW_TAG_member
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$90)
	.dwattr $C$DW$232, DW_AT_name("buslatch")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("buslatch")
	.dwattr $C$DW$232, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$232, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$232, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$232, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$232, DW_AT_decl_column(0x16)

$C$DW$233	.dwtag  DW_TAG_member
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$91)
	.dwattr $C$DW$233, DW_AT_name("buslatch_test")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("buslatch_test")
	.dwattr $C$DW$233, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$233, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$233, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$233, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$233, DW_AT_decl_column(0x1b)

$C$DW$234	.dwtag  DW_TAG_member
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$92)
	.dwattr $C$DW$234, DW_AT_name("dma")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("dma")
	.dwattr $C$DW$234, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$234, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$234, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$234, DW_AT_decl_line(0x9e)
	.dwattr $C$DW$234, DW_AT_decl_column(0x11)

$C$DW$235	.dwtag  DW_TAG_member
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$93)
	.dwattr $C$DW$235, DW_AT_name("intr")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("intr")
	.dwattr $C$DW$235, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$235, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$235, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$235, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$235, DW_AT_decl_column(0x12)

	.dwattr $C$DW$T$94, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/10.01_base/2_src/shared/mailbox.h")
	.dwattr $C$DW$T$94, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$T$94, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$94

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

$C$DW$T$117	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$117, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$117, DW_AT_address_class(0x20)

$C$DW$T$39	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$39, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$39, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$39, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/stdint.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x1c)


$C$DW$T$54	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$54, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$T$54, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x20)
$C$DW$236	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$236, DW_AT_upper_bound(0x1f)

	.dwendtag $C$DW$T$54


$C$DW$T$55	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$T$55, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$55, DW_AT_byte_size(0x1000)
$C$DW$237	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$237, DW_AT_upper_bound(0xfff)

	.dwendtag $C$DW$T$55


$C$DW$T$87	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$87, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$T$87, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$87, DW_AT_byte_size(0x40000)
$C$DW$238	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$238, DW_AT_upper_bound(0x3ffff)

	.dwendtag $C$DW$T$87

$C$DW$T$124	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$124, DW_AT_type(*$C$DW$T$39)

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
$C$DW$239	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$239, DW_AT_upper_bound(0x1ff)

	.dwendtag $C$DW$T$45


$C$DW$T$86	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$86, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$T$86, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$86, DW_AT_byte_size(0x40000)
$C$DW$240	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$240, DW_AT_upper_bound(0x1ffff)

	.dwendtag $C$DW$T$86

$C$DW$T$113	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$113, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$T$113, DW_AT_address_class(0x20)

$C$DW$T$130	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$130, DW_AT_type(*$C$DW$T$113)

$C$DW$T$131	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$131, DW_AT_type(*$C$DW$T$40)

$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)

$C$DW$T$109	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$109, DW_AT_name("size_t")
	.dwattr $C$DW$T$109, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$109, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$109, DW_AT_decl_file("/home/joerg/retrocmp/dec/UniBone/91_3rd_party/pru-c-compile/ti-cgt-pru_2.3.1//include/string.h")
	.dwattr $C$DW$T$109, DW_AT_decl_line(0x42)
	.dwattr $C$DW$T$109, DW_AT_decl_column(0x19)

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
$C$DW$241	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$241, DW_AT_upper_bound(0x00)

	.dwendtag $C$DW$T$33


$C$DW$T$34	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_byte_size(0x08)
$C$DW$242	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$242, DW_AT_upper_bound(0x01)

	.dwendtag $C$DW$T$34

$C$DW$T$59	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$32)

$C$DW$T$134	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$134, DW_AT_type(*$C$DW$T$32)

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

$C$DW$T$136	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$136, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$136, DW_AT_address_class(0x20)

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

$C$DW$243	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$243, DW_AT_name("R0_b0")
	.dwattr $C$DW$243, DW_AT_location[DW_OP_reg0]

$C$DW$244	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$244, DW_AT_name("R0_b1")
	.dwattr $C$DW$244, DW_AT_location[DW_OP_reg1]

$C$DW$245	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$245, DW_AT_name("R0_b2")
	.dwattr $C$DW$245, DW_AT_location[DW_OP_reg2]

$C$DW$246	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$246, DW_AT_name("R0_b3")
	.dwattr $C$DW$246, DW_AT_location[DW_OP_reg3]

$C$DW$247	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$247, DW_AT_name("R1_b0")
	.dwattr $C$DW$247, DW_AT_location[DW_OP_reg4]

$C$DW$248	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$248, DW_AT_name("R1_b1")
	.dwattr $C$DW$248, DW_AT_location[DW_OP_reg5]

$C$DW$249	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$249, DW_AT_name("R1_b2")
	.dwattr $C$DW$249, DW_AT_location[DW_OP_reg6]

$C$DW$250	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$250, DW_AT_name("R1_b3")
	.dwattr $C$DW$250, DW_AT_location[DW_OP_reg7]

$C$DW$251	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$251, DW_AT_name("R2_b0")
	.dwattr $C$DW$251, DW_AT_location[DW_OP_reg8]

$C$DW$252	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$252, DW_AT_name("R2_b1")
	.dwattr $C$DW$252, DW_AT_location[DW_OP_reg9]

$C$DW$253	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$253, DW_AT_name("R2_b2")
	.dwattr $C$DW$253, DW_AT_location[DW_OP_reg10]

$C$DW$254	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$254, DW_AT_name("R2_b3")
	.dwattr $C$DW$254, DW_AT_location[DW_OP_reg11]

$C$DW$255	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$255, DW_AT_name("R3_b0")
	.dwattr $C$DW$255, DW_AT_location[DW_OP_reg12]

$C$DW$256	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$256, DW_AT_name("R3_b1")
	.dwattr $C$DW$256, DW_AT_location[DW_OP_reg13]

$C$DW$257	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$257, DW_AT_name("R3_b2")
	.dwattr $C$DW$257, DW_AT_location[DW_OP_reg14]

$C$DW$258	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$258, DW_AT_name("R3_b3")
	.dwattr $C$DW$258, DW_AT_location[DW_OP_reg15]

$C$DW$259	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$259, DW_AT_name("R4_b0")
	.dwattr $C$DW$259, DW_AT_location[DW_OP_reg16]

$C$DW$260	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$260, DW_AT_name("R4_b1")
	.dwattr $C$DW$260, DW_AT_location[DW_OP_reg17]

$C$DW$261	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$261, DW_AT_name("R4_b2")
	.dwattr $C$DW$261, DW_AT_location[DW_OP_reg18]

$C$DW$262	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$262, DW_AT_name("R4_b3")
	.dwattr $C$DW$262, DW_AT_location[DW_OP_reg19]

$C$DW$263	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$263, DW_AT_name("R5_b0")
	.dwattr $C$DW$263, DW_AT_location[DW_OP_reg20]

$C$DW$264	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$264, DW_AT_name("R5_b1")
	.dwattr $C$DW$264, DW_AT_location[DW_OP_reg21]

$C$DW$265	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$265, DW_AT_name("R5_b2")
	.dwattr $C$DW$265, DW_AT_location[DW_OP_reg22]

$C$DW$266	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$266, DW_AT_name("R5_b3")
	.dwattr $C$DW$266, DW_AT_location[DW_OP_reg23]

$C$DW$267	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$267, DW_AT_name("R6_b0")
	.dwattr $C$DW$267, DW_AT_location[DW_OP_reg24]

$C$DW$268	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$268, DW_AT_name("R6_b1")
	.dwattr $C$DW$268, DW_AT_location[DW_OP_reg25]

$C$DW$269	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$269, DW_AT_name("R6_b2")
	.dwattr $C$DW$269, DW_AT_location[DW_OP_reg26]

$C$DW$270	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$270, DW_AT_name("R6_b3")
	.dwattr $C$DW$270, DW_AT_location[DW_OP_reg27]

$C$DW$271	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$271, DW_AT_name("R7_b0")
	.dwattr $C$DW$271, DW_AT_location[DW_OP_reg28]

$C$DW$272	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$272, DW_AT_name("R7_b1")
	.dwattr $C$DW$272, DW_AT_location[DW_OP_reg29]

$C$DW$273	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$273, DW_AT_name("R7_b2")
	.dwattr $C$DW$273, DW_AT_location[DW_OP_reg30]

$C$DW$274	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$274, DW_AT_name("R7_b3")
	.dwattr $C$DW$274, DW_AT_location[DW_OP_reg31]

$C$DW$275	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$275, DW_AT_name("R8_b0")
	.dwattr $C$DW$275, DW_AT_location[DW_OP_regx 0x20]

$C$DW$276	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$276, DW_AT_name("R8_b1")
	.dwattr $C$DW$276, DW_AT_location[DW_OP_regx 0x21]

$C$DW$277	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$277, DW_AT_name("R8_b2")
	.dwattr $C$DW$277, DW_AT_location[DW_OP_regx 0x22]

$C$DW$278	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$278, DW_AT_name("R8_b3")
	.dwattr $C$DW$278, DW_AT_location[DW_OP_regx 0x23]

$C$DW$279	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$279, DW_AT_name("R9_b0")
	.dwattr $C$DW$279, DW_AT_location[DW_OP_regx 0x24]

$C$DW$280	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$280, DW_AT_name("R9_b1")
	.dwattr $C$DW$280, DW_AT_location[DW_OP_regx 0x25]

$C$DW$281	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$281, DW_AT_name("R9_b2")
	.dwattr $C$DW$281, DW_AT_location[DW_OP_regx 0x26]

$C$DW$282	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$282, DW_AT_name("R9_b3")
	.dwattr $C$DW$282, DW_AT_location[DW_OP_regx 0x27]

$C$DW$283	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$283, DW_AT_name("R10_b0")
	.dwattr $C$DW$283, DW_AT_location[DW_OP_regx 0x28]

$C$DW$284	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$284, DW_AT_name("R10_b1")
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0x29]

$C$DW$285	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$285, DW_AT_name("R10_b2")
	.dwattr $C$DW$285, DW_AT_location[DW_OP_regx 0x2a]

$C$DW$286	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$286, DW_AT_name("R10_b3")
	.dwattr $C$DW$286, DW_AT_location[DW_OP_regx 0x2b]

$C$DW$287	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$287, DW_AT_name("R11_b0")
	.dwattr $C$DW$287, DW_AT_location[DW_OP_regx 0x2c]

$C$DW$288	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$288, DW_AT_name("R11_b1")
	.dwattr $C$DW$288, DW_AT_location[DW_OP_regx 0x2d]

$C$DW$289	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$289, DW_AT_name("R11_b2")
	.dwattr $C$DW$289, DW_AT_location[DW_OP_regx 0x2e]

$C$DW$290	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$290, DW_AT_name("R11_b3")
	.dwattr $C$DW$290, DW_AT_location[DW_OP_regx 0x2f]

$C$DW$291	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$291, DW_AT_name("R12_b0")
	.dwattr $C$DW$291, DW_AT_location[DW_OP_regx 0x30]

$C$DW$292	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$292, DW_AT_name("R12_b1")
	.dwattr $C$DW$292, DW_AT_location[DW_OP_regx 0x31]

$C$DW$293	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$293, DW_AT_name("R12_b2")
	.dwattr $C$DW$293, DW_AT_location[DW_OP_regx 0x32]

$C$DW$294	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$294, DW_AT_name("R12_b3")
	.dwattr $C$DW$294, DW_AT_location[DW_OP_regx 0x33]

$C$DW$295	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$295, DW_AT_name("R13_b0")
	.dwattr $C$DW$295, DW_AT_location[DW_OP_regx 0x34]

$C$DW$296	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$296, DW_AT_name("R13_b1")
	.dwattr $C$DW$296, DW_AT_location[DW_OP_regx 0x35]

$C$DW$297	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$297, DW_AT_name("R13_b2")
	.dwattr $C$DW$297, DW_AT_location[DW_OP_regx 0x36]

$C$DW$298	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$298, DW_AT_name("R13_b3")
	.dwattr $C$DW$298, DW_AT_location[DW_OP_regx 0x37]

$C$DW$299	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$299, DW_AT_name("R14_b0")
	.dwattr $C$DW$299, DW_AT_location[DW_OP_regx 0x38]

$C$DW$300	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$300, DW_AT_name("R14_b1")
	.dwattr $C$DW$300, DW_AT_location[DW_OP_regx 0x39]

$C$DW$301	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$301, DW_AT_name("R14_b2")
	.dwattr $C$DW$301, DW_AT_location[DW_OP_regx 0x3a]

$C$DW$302	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$302, DW_AT_name("R14_b3")
	.dwattr $C$DW$302, DW_AT_location[DW_OP_regx 0x3b]

$C$DW$303	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$303, DW_AT_name("R15_b0")
	.dwattr $C$DW$303, DW_AT_location[DW_OP_regx 0x3c]

$C$DW$304	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$304, DW_AT_name("R15_b1")
	.dwattr $C$DW$304, DW_AT_location[DW_OP_regx 0x3d]

$C$DW$305	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$305, DW_AT_name("R15_b2")
	.dwattr $C$DW$305, DW_AT_location[DW_OP_regx 0x3e]

$C$DW$306	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$306, DW_AT_name("R15_b3")
	.dwattr $C$DW$306, DW_AT_location[DW_OP_regx 0x3f]

$C$DW$307	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$307, DW_AT_name("R16_b0")
	.dwattr $C$DW$307, DW_AT_location[DW_OP_regx 0x40]

$C$DW$308	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$308, DW_AT_name("R16_b1")
	.dwattr $C$DW$308, DW_AT_location[DW_OP_regx 0x41]

$C$DW$309	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$309, DW_AT_name("R16_b2")
	.dwattr $C$DW$309, DW_AT_location[DW_OP_regx 0x42]

$C$DW$310	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$310, DW_AT_name("R16_b3")
	.dwattr $C$DW$310, DW_AT_location[DW_OP_regx 0x43]

$C$DW$311	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$311, DW_AT_name("R17_b0")
	.dwattr $C$DW$311, DW_AT_location[DW_OP_regx 0x44]

$C$DW$312	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$312, DW_AT_name("R17_b1")
	.dwattr $C$DW$312, DW_AT_location[DW_OP_regx 0x45]

$C$DW$313	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$313, DW_AT_name("R17_b2")
	.dwattr $C$DW$313, DW_AT_location[DW_OP_regx 0x46]

$C$DW$314	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$314, DW_AT_name("R17_b3")
	.dwattr $C$DW$314, DW_AT_location[DW_OP_regx 0x47]

$C$DW$315	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$315, DW_AT_name("R18_b0")
	.dwattr $C$DW$315, DW_AT_location[DW_OP_regx 0x48]

$C$DW$316	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$316, DW_AT_name("R18_b1")
	.dwattr $C$DW$316, DW_AT_location[DW_OP_regx 0x49]

$C$DW$317	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$317, DW_AT_name("R18_b2")
	.dwattr $C$DW$317, DW_AT_location[DW_OP_regx 0x4a]

$C$DW$318	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$318, DW_AT_name("R18_b3")
	.dwattr $C$DW$318, DW_AT_location[DW_OP_regx 0x4b]

$C$DW$319	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$319, DW_AT_name("R19_b0")
	.dwattr $C$DW$319, DW_AT_location[DW_OP_regx 0x4c]

$C$DW$320	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$320, DW_AT_name("R19_b1")
	.dwattr $C$DW$320, DW_AT_location[DW_OP_regx 0x4d]

$C$DW$321	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$321, DW_AT_name("R19_b2")
	.dwattr $C$DW$321, DW_AT_location[DW_OP_regx 0x4e]

$C$DW$322	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$322, DW_AT_name("R19_b3")
	.dwattr $C$DW$322, DW_AT_location[DW_OP_regx 0x4f]

$C$DW$323	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$323, DW_AT_name("R20_b0")
	.dwattr $C$DW$323, DW_AT_location[DW_OP_regx 0x50]

$C$DW$324	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$324, DW_AT_name("R20_b1")
	.dwattr $C$DW$324, DW_AT_location[DW_OP_regx 0x51]

$C$DW$325	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$325, DW_AT_name("R20_b2")
	.dwattr $C$DW$325, DW_AT_location[DW_OP_regx 0x52]

$C$DW$326	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$326, DW_AT_name("R20_b3")
	.dwattr $C$DW$326, DW_AT_location[DW_OP_regx 0x53]

$C$DW$327	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$327, DW_AT_name("R21_b0")
	.dwattr $C$DW$327, DW_AT_location[DW_OP_regx 0x54]

$C$DW$328	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$328, DW_AT_name("R21_b1")
	.dwattr $C$DW$328, DW_AT_location[DW_OP_regx 0x55]

$C$DW$329	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$329, DW_AT_name("R21_b2")
	.dwattr $C$DW$329, DW_AT_location[DW_OP_regx 0x56]

$C$DW$330	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$330, DW_AT_name("R21_b3")
	.dwattr $C$DW$330, DW_AT_location[DW_OP_regx 0x57]

$C$DW$331	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$331, DW_AT_name("R22_b0")
	.dwattr $C$DW$331, DW_AT_location[DW_OP_regx 0x58]

$C$DW$332	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$332, DW_AT_name("R22_b1")
	.dwattr $C$DW$332, DW_AT_location[DW_OP_regx 0x59]

$C$DW$333	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$333, DW_AT_name("R22_b2")
	.dwattr $C$DW$333, DW_AT_location[DW_OP_regx 0x5a]

$C$DW$334	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$334, DW_AT_name("R22_b3")
	.dwattr $C$DW$334, DW_AT_location[DW_OP_regx 0x5b]

$C$DW$335	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$335, DW_AT_name("R23_b0")
	.dwattr $C$DW$335, DW_AT_location[DW_OP_regx 0x5c]

$C$DW$336	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$336, DW_AT_name("R23_b1")
	.dwattr $C$DW$336, DW_AT_location[DW_OP_regx 0x5d]

$C$DW$337	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$337, DW_AT_name("R23_b2")
	.dwattr $C$DW$337, DW_AT_location[DW_OP_regx 0x5e]

$C$DW$338	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$338, DW_AT_name("R23_b3")
	.dwattr $C$DW$338, DW_AT_location[DW_OP_regx 0x5f]

$C$DW$339	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$339, DW_AT_name("R24_b0")
	.dwattr $C$DW$339, DW_AT_location[DW_OP_regx 0x60]

$C$DW$340	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$340, DW_AT_name("R24_b1")
	.dwattr $C$DW$340, DW_AT_location[DW_OP_regx 0x61]

$C$DW$341	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$341, DW_AT_name("R24_b2")
	.dwattr $C$DW$341, DW_AT_location[DW_OP_regx 0x62]

$C$DW$342	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$342, DW_AT_name("R24_b3")
	.dwattr $C$DW$342, DW_AT_location[DW_OP_regx 0x63]

$C$DW$343	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$343, DW_AT_name("R25_b0")
	.dwattr $C$DW$343, DW_AT_location[DW_OP_regx 0x64]

$C$DW$344	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$344, DW_AT_name("R25_b1")
	.dwattr $C$DW$344, DW_AT_location[DW_OP_regx 0x65]

$C$DW$345	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$345, DW_AT_name("R25_b2")
	.dwattr $C$DW$345, DW_AT_location[DW_OP_regx 0x66]

$C$DW$346	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$346, DW_AT_name("R25_b3")
	.dwattr $C$DW$346, DW_AT_location[DW_OP_regx 0x67]

$C$DW$347	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$347, DW_AT_name("R26_b0")
	.dwattr $C$DW$347, DW_AT_location[DW_OP_regx 0x68]

$C$DW$348	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$348, DW_AT_name("R26_b1")
	.dwattr $C$DW$348, DW_AT_location[DW_OP_regx 0x69]

$C$DW$349	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$349, DW_AT_name("R26_b2")
	.dwattr $C$DW$349, DW_AT_location[DW_OP_regx 0x6a]

$C$DW$350	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$350, DW_AT_name("R26_b3")
	.dwattr $C$DW$350, DW_AT_location[DW_OP_regx 0x6b]

$C$DW$351	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$351, DW_AT_name("R27_b0")
	.dwattr $C$DW$351, DW_AT_location[DW_OP_regx 0x6c]

$C$DW$352	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$352, DW_AT_name("R27_b1")
	.dwattr $C$DW$352, DW_AT_location[DW_OP_regx 0x6d]

$C$DW$353	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$353, DW_AT_name("R27_b2")
	.dwattr $C$DW$353, DW_AT_location[DW_OP_regx 0x6e]

$C$DW$354	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$354, DW_AT_name("R27_b3")
	.dwattr $C$DW$354, DW_AT_location[DW_OP_regx 0x6f]

$C$DW$355	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$355, DW_AT_name("R28_b0")
	.dwattr $C$DW$355, DW_AT_location[DW_OP_regx 0x70]

$C$DW$356	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$356, DW_AT_name("R28_b1")
	.dwattr $C$DW$356, DW_AT_location[DW_OP_regx 0x71]

$C$DW$357	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$357, DW_AT_name("R28_b2")
	.dwattr $C$DW$357, DW_AT_location[DW_OP_regx 0x72]

$C$DW$358	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$358, DW_AT_name("R28_b3")
	.dwattr $C$DW$358, DW_AT_location[DW_OP_regx 0x73]

$C$DW$359	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$359, DW_AT_name("R29_b0")
	.dwattr $C$DW$359, DW_AT_location[DW_OP_regx 0x74]

$C$DW$360	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$360, DW_AT_name("R29_b1")
	.dwattr $C$DW$360, DW_AT_location[DW_OP_regx 0x75]

$C$DW$361	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$361, DW_AT_name("R29_b2")
	.dwattr $C$DW$361, DW_AT_location[DW_OP_regx 0x76]

$C$DW$362	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$362, DW_AT_name("R29_b3")
	.dwattr $C$DW$362, DW_AT_location[DW_OP_regx 0x77]

$C$DW$363	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$363, DW_AT_name("R30_b0")
	.dwattr $C$DW$363, DW_AT_location[DW_OP_regx 0x78]

$C$DW$364	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$364, DW_AT_name("R30_b1")
	.dwattr $C$DW$364, DW_AT_location[DW_OP_regx 0x79]

$C$DW$365	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$365, DW_AT_name("R30_b2")
	.dwattr $C$DW$365, DW_AT_location[DW_OP_regx 0x7a]

$C$DW$366	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$366, DW_AT_name("R30_b3")
	.dwattr $C$DW$366, DW_AT_location[DW_OP_regx 0x7b]

$C$DW$367	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$367, DW_AT_name("R31_b0")
	.dwattr $C$DW$367, DW_AT_location[DW_OP_regx 0x7c]

$C$DW$368	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$368, DW_AT_name("R31_b1")
	.dwattr $C$DW$368, DW_AT_location[DW_OP_regx 0x7d]

$C$DW$369	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$369, DW_AT_name("R31_b2")
	.dwattr $C$DW$369, DW_AT_location[DW_OP_regx 0x7e]

$C$DW$370	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$370, DW_AT_name("R31_b3")
	.dwattr $C$DW$370, DW_AT_location[DW_OP_regx 0x7f]

	.dwendtag $C$DW$CU

