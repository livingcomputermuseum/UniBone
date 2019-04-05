# PRU_CGT environment variable must point to the TI PRU code gen tools directory. E.g.:
#(Desktop Linux) export PRU_CGT=/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
#(Windows) set PRU_CGT=C:/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
#(ARM Linux*) export PRU_CGT=/usr/share/ti/cgt-pru
#
# *ARM Linux also needs to create a symbolic link to the /usr/bin/ directory in
# order to use the same Makefile
#(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin

ifndef PRU_CGT
define ERROR_BODY

*******************************************************************************
PRU_CGT environment variable is not set. Examples given:
(Desktop Linux) export PRU_CGT=/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
(Windows) set PRU_CGT=C:/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
(ARM Linux*) export PRU_CGT=/usr/share/ti/cgt-pru

*ARM Linux also needs to create a symbolic link to the /usr/bin/ directory in
order to use the same Makefile
(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin
*******************************************************************************

endef
$(error $(ERROR_BODY))
endif

PRU_NUM=1
PROJ_NAME=pru$(PRU_NUM)
GEN_DIR=$(abspath ../../4_deploy)
SHARED_DIR=$(abspath ../shared)
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
COMMON_SCRIPTS_DIR=$(UNIBONE_DIR)/90_common/scripts
SUPPORTPACKAGE_DIR := $(UNIBONE_DIR)/91_3rd_party/pru-c-compile/pru-software-support-package
LINKER_COMMAND_FILE=./AM335x_PRU.cmd
LIBS=--library=$(SUPPORTPACKAGE_DIR)/lib/rpmsg_lib.lib
INCLUDE=--include_path=$(SUPPORTPACKAGE_DIR)/include --include_path=$(SUPPORTPACKAGE_DIR)/include/am335x \
	--include_path=$(SHARED_DIR)
STACK_SIZE=0x100
HEAP_SIZE=0x100

# fiddeling with the optimizer options does not really speed up UNIBUS cycle performance
# do not use -c_src_interlist: "negative effect on performance"? clpru v2.2
#CFLAGS_OPTIMIZER=--opt_level=3 --auto_inline --optimizer_interlist --gen_opt_info=2
CFLAGS_OPTIMIZER=--opt_level=3 --opt_for_speed=5 --auto_inline   --c_src_interlist --optimizer_interlist --gen_opt_info=2
#CFLAGS_OPTIMIZER=--opt_level=3 --auto_inline   --c_src_interlist --optimizer_interlist --gen_opt_info=2
#Common compiler and linker flags (Defined in 'PRU Optimizing C/C++ Compiler User's Guide)
CFLAGS=-v3 $(CFLAGS_OPTIMIZER) \
	--display_error_number --endian=little --hardware_mac=on --obj_directory=$(GEN_DIR) --pp_directory=$(GEN_DIR) -ppd -ppa

#Linker flags (Defined in 'PRU Optimizing C/C++ Compiler User's Guide)
LFLAGS=--reread_libs --warn_sections --stack_size=$(STACK_SIZE) --heap_size=$(HEAP_SIZE)

PRU_CODE=pru1_config.c
TARGET=$(GEN_DIR)/$(PROJ_NAME).out
MAP=$(GEN_DIR)/$(PROJ_NAME).map
#
SOURCES=$(wildcard *.c)
HEADERS=$(wildcard *.h)
# extension is ".asmsrc", not ".asm", do distinguish from compiler-generated .asm files.
SOURCES_ASM=$(wildcard *.asmsrc)
#Using .object instead of .obj in order to not conflict with the CCS build process
OBJECTS=$(patsubst %,$(GEN_DIR)/%,$(SOURCES:.c=.object))
OBJECTS_ASM=$(patsubst %,$(GEN_DIR)/%,$(SOURCES_ASM:.asmsrc=.asmobject))

#all: $(TARGET)
# only interested on the image as C-array
all: $(GEN_DIR)/$(PRU_CODE)


# Invokes the linker (-z flag) to make the .out file
$(TARGET): $(OBJECTS) $(OBJECTS_ASM) $(LINKER_COMMAND_FILE)
	@echo ''
	@echo 'Building target: $@'
	@echo 'Invoking: PRU Linker'
	$(PRU_CGT)/bin/clpru $(CFLAGS) -z -i$(PRU_CGT)/lib -i$(PRU_CGT)/include $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJECTS_ASM) -m$(MAP) $(LINKER_COMMAND_FILE) --library=libc.a $(LIBS)
	@echo 'Finished building target: $@'

#        --outfile=$(GEN_DIR)/$(PROJ_NAME)_imagearrays.c

# the rule for .out file generates the C-array too.
$(GEN_DIR)/$(PRU_CODE): $(TARGET)
	@echo 'Generating C-arrays containing binary images with PRU code.'
	$(PRU_CGT)/bin/hexpru --array $(TARGET)
	@echo 'Adding entry addresses to PRU config C source file'
	$(SHARED_DIR)/update_pru_config.sh $(PRU_NUM) $(PROJ_NAME)_array.c $(GEN_DIR)/$(PROJ_NAME)_config $(GEN_DIR)/$(PROJ_NAME).map
	@rm $(PROJ_NAME)_array.c

# Invokes the compiler on all c files in the directory to create the object files
$(GEN_DIR)/%.object: %.c
	@mkdir -p $(GEN_DIR)
	@echo ''
	@echo 'Building file: $<'
	@echo 'Invoking: PRU Compiler'
	$(PRU_CGT)/bin/clpru --include_path=$(PRU_CGT)/include $(INCLUDE) $(CFLAGS) --output_file=$@ $<
	@echo Produce assembler listing
	$(PRU_CGT)/bin/clpru --include_path=$(PRU_CGT)/include $(INCLUDE) $(CFLAGS) --absolute_listing --output_file=$@ $<
	-mv *.asm $(GEN_DIR)

# Invokes the compiler on all asm files in the directory to create the object files
$(GEN_DIR)/%.asmobject: %.asmsrc
	@mkdir -p $(GEN_DIR)
	@echo ''
	@echo 'Building file: $<'
	@echo 'Invoking: PRU Compiler'
	$(PRU_CGT)/bin/clpru --asm_listing --asm_file=$^ --output_file=$@
	-mv *.lst $(GEN_DIR)



.PHONY: all clean

# Remove the $(GEN_DIR) directory
clean:
	@echo Removing $(PROJ_NAME)'*.*' files in the "$(GEN_DIR)" directory
	@rm -f $(GEN_DIR)/$(PROJ_NAME)*.*

# Includes the dependencies that the compiler creates (-ppd and -ppa flags)
-include $(OBJECTS:%.object=%.pp)

