# Inherited from
# http://mythopoeic.org/bbb-pru-minimal/
#
# modified for cross compile and remote debugging on BBB

PROG = demo
PRU0_CODE=pru0_config.c
PRU1_CODE=pru1_config.c
# UNIBONE_DIR from environment
UNIBONE_ROOT = $(UNIBONE_DIR)

PRU_PACKAGE_ROOT = $(UNIBONE_ROOT)/91_3rd_party/am335x_pru_package

COMMON_SRC_DIR= $(UNIBONE_ROOT)/90_common/src
SHARED_SRC_DIR= $(UNIBONE_ROOT)/10.01_base/2_src/shared
PRU0_BASE_SRC_DIR= $(UNIBONE_ROOT)/10.01_base/2_src/pru0
PRU1_BASE_SRC_DIR= $(UNIBONE_ROOT)/10.01_base/2_src/pru1
PRU_DEPLOY_DIR=$(UNIBONE_ROOT)/10.01_base/4_deploy
BASE_SRC_DIR= $(UNIBONE_ROOT)/10.01_base/2_src/arm
DEVICE_SRC_DIR= $(UNIBONE_ROOT)/10.02_devices/2_src
DEVEXER_SRC_DIR= $(UNIBONE_ROOT)/10.04_device_exerciser/2_src

# PRUSSDRV includes
PRUSS_INCLUDE_DIR = $(PRU_PACKAGE_ROOT)/include
# ARM LIBRARIES
PRUSS_DRV_LIB = $(PRU_PACKAGE_ROOT)/bin-bbb/libprussdrv.a

# -static: do not used shared libs, include all coide into the binary
# (big binary, but BBB neds no shared libs of certain verisons installed)
# Example: demo binary goes from 594K to 12.3MB !
LDFLAGS+= -static -lstdc++ -lpthread $(PRUSS_DRV_LIB)

# compiler flags and libraries
#CC_DBG_FLAGS = -O3 -Wall -Wextra -DDBG
CC_DBG_FLAGS = -ggdb3 -O0 -Wall -Wextra -DDBG

#ifeq ($(DBG),1)
#CC_DBG_FLAGS = -ggdb3 -O0 -Wall -Wextra -DDBG
#else
#CC_DBG_FLAGS = -O3 -Wall -Wextra -UDBG
#endif

ifeq ($(MAKE_TARGET_ARCH),BBB)
	# cross compile on x64 for BBB
	CC=$(BBB_CC)
	OS_CCDEFS = -DARM -U__STRICT_ANSI__
	OBJDIR=$(abspath ../4_deploy)
else
	# local compile on BBB
	OS_CCDEFS = -DARM -U__STRICT_ANSI__
	OBJDIR=$(abspath ../4_deploy)
endif



CCFLAGS= \
	-std=c++11     \
	-I$(PRUSS_INCLUDE_DIR)	\
	-I.	\
	-I$(SHARED_SRC_DIR)	\
	-I$(COMMON_SRC_DIR)	\
	-I$(BASE_SRC_DIR)	\
	-I$(PRU_DEPLOY_DIR)	\
	-I$(DEVICE_SRC_DIR)	\
	-I$(DEVEXER_SRC_DIR)	\
	-I$(OBJDIR)	\
	-c	\
	$(CCDEFS) $(CC_DBG_FLAGS) $(OS_CCDEFS)
# OBJDIR in includes because of $(PRU_CODE)
# no -std=c99


OBJECTS = $(OBJDIR)/application.o	\
	$(OBJDIR)/getopt2.o	\
	$(OBJDIR)/menus.o	\
	$(OBJDIR)/menu_gpio.o	\
	$(OBJDIR)/menu_panel.o	\
	$(OBJDIR)/menu_mailbox.o	\
	$(OBJDIR)/menu_buslatches.o	\
	$(OBJDIR)/menu_masterslave.o	\
	$(OBJDIR)/menu_interrupts.o	\
	$(OBJDIR)/menu_ddrmem_slave_only.o \
	$(OBJDIR)/menu_devices.o \
	$(OBJDIR)/menu_device_exercisers.o \
	$(OBJDIR)/devexer.o	\
	$(OBJDIR)/devexer_rl.o	\
	$(OBJDIR)/memoryimage.o	\
	$(OBJDIR)/cpu.o	\
	$(OBJDIR)/ka11.o	\
	$(OBJDIR)/rl0102.o	\
        $(OBJDIR)/rl11.o	\
        $(OBJDIR)/rk11.o        \
        $(OBJDIR)/rk05.o        \
        $(OBJDIR)/uda.o         \
        $(OBJDIR)/mscp_server.o \
        $(OBJDIR)/mscp_drive.o \
	$(OBJDIR)/storagedrive.o	\
        $(OBJDIR)/storagecontroller.o	\
        $(OBJDIR)/demo_io.o	\
        $(OBJDIR)/demo_regs.o	\
        $(OBJDIR)/unibusdevice.o	\
        $(OBJDIR)/device.o	\
        $(OBJDIR)/parameter.o	\
	$(OBJDIR)/panel.o	\
	$(OBJDIR)/unibusadapter.o	\
	$(OBJDIR)/unibus.o	\
	$(OBJDIR)/gpios.o	\
	$(OBJDIR)/stringgrid.o	\
	$(OBJDIR)/mcout.o	\
	$(OBJDIR)/inputline.o	\
	$(OBJDIR)/bitcalc.o	\
	$(OBJDIR)/pru.o \
	$(OBJDIR)/pru0_config.o \
	$(OBJDIR)/pru1_config.o \
	$(OBJDIR)/mailbox.o	\
	$(OBJDIR)/ddrmem.o	\
	$(OBJDIR)/iopageregister.o	\
	$(OBJDIR)/logsource.o	\
	$(OBJDIR)/logger.o	\
	$(OBJDIR)/utils.o	\
	$(OBJDIR)/compile_timestamp.o

# create needed directories
$(shell   mkdir -p $(PRU_DEPLOY_DIR) $(OBJDIR))


# executable depends on its objects AND the PRU objects
$(OBJDIR)/$(PROG) : $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	# force recompile
	rm -f $(OBJDIR)/compile_timestamp.o
	file $@

all:	$(OBJDIR)/$(PROG) $(PRU_DEPLOY_DIR)/$(PRU0_CODE) $(PRU_DEPLOY_DIR)/$(PRU1_CODE)

clean:
	rm -f $(OBJDIR)/$(PROG) $(OBJECTS) $(OBJDIR)/* $(PRU_DEPLOY_DIR)/*



$(OBJDIR)/application.o :  application.cpp $(PRU_DEPLOY_DIR)/$(PRU0_CODE) $(PRU_DEPLOY_DIR)/$(PRU1_CODE)
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menus.o :  menus.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_gpio.o :  menu_gpio.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_panel.o :  menu_panel.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_mailbox.o :  menu_mailbox.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_buslatches.o :  menu_buslatches.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_masterslave.o :  menu_masterslave.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_interrupts.o :  menu_interrupts.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_devices.o :  menu_devices.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@
	
$(OBJDIR)/menu_device_exercisers.o :  menu_device_exercisers.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/menu_ddrmem_slave_only.o :  menu_ddrmem_slave_only.cpp menus.hpp
	$(CC) $(CCFLAGS) $< -o $@
	
$(OBJDIR)/memoryimage.o :  $(BASE_SRC_DIR)/memoryimage.cpp $(BASE_SRC_DIR)/memoryimage.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/devexer.o :  $(DEVEXER_SRC_DIR)/devexer.cpp $(DEVEXER_SRC_DIR)/devexer.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/devexer_rl.o :  $(DEVEXER_SRC_DIR)/devexer_rl.cpp $(DEVEXER_SRC_DIR)/devexer_rl.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/cpu.o :  $(DEVICE_SRC_DIR)/cpu.cpp $(DEVICE_SRC_DIR)/cpu.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/ka11.o :  $(DEVICE_SRC_DIR)/cpu20/ka11.c $(DEVICE_SRC_DIR)/cpu20/ka11.h
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/rl0102.o :  $(DEVICE_SRC_DIR)/rl0102.cpp $(DEVICE_SRC_DIR)/rl0102.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/rl11.o :  $(DEVICE_SRC_DIR)/rl11.cpp $(DEVICE_SRC_DIR)/rl11.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/rk05.o :  $(DEVICE_SRC_DIR)/rk05.cpp $(DEVICE_SRC_DIR)/rk05.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/rk11.o :  $(DEVICE_SRC_DIR)/rk11.cpp $(DEVICE_SRC_DIR)/rk11.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/uda.o :   $(DEVICE_SRC_DIR)/uda.cpp $(DEVICE_SRC_DIR)/uda.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/mscp_server.o :   $(DEVICE_SRC_DIR)/mscp_server.cpp $(DEVICE_SRC_DIR)/mscp_server.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/mscp_drive.o :   $(DEVICE_SRC_DIR)/mscp_drive.cpp $(DEVICE_SRC_DIR)/mscp_drive.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/storagedrive.o :  $(BASE_SRC_DIR)/storagedrive.cpp $(BASE_SRC_DIR)/storagedrive.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/storagecontroller.o :  $(BASE_SRC_DIR)/storagecontroller.cpp $(BASE_SRC_DIR)/storagecontroller.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/demo_io.o :  $(DEVICE_SRC_DIR)/demo_io.cpp $(DEVICE_SRC_DIR)/demo_io.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/demo_regs.o :  $(DEVICE_SRC_DIR)/demo_regs.cpp $(DEVICE_SRC_DIR)/demo_regs.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/unibusdevice.o :  $(BASE_SRC_DIR)/unibusdevice.cpp $(BASE_SRC_DIR)/unibusdevice.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/device.o :  $(BASE_SRC_DIR)/device.cpp $(BASE_SRC_DIR)/device.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/parameter.o :  $(BASE_SRC_DIR)/parameter.cpp $(BASE_SRC_DIR)/parameter.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/panel.o :  $(DEVICE_SRC_DIR)/panel.cpp $(DEVICE_SRC_DIR)/panel.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/unibus.o :  $(BASE_SRC_DIR)/unibus.cpp $(SHARED_SRC_DIR)/unibus.h
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/getopt2.o :  $(COMMON_SRC_DIR)/getopt2.cpp $(COMMON_SRC_DIR)/getopt2.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/stringgrid.o :  $(COMMON_SRC_DIR)/stringgrid.cpp $(COMMON_SRC_DIR)/stringgrid.hpp
	$(CC) $(CCFLAGS) -xc++ $< -o $@

$(OBJDIR)/mcout.o :  $(COMMON_SRC_DIR)/mcout.c $(COMMON_SRC_DIR)/mcout.h
	$(CC) $(CCFLAGS) -xc++ $< -o $@

$(OBJDIR)/inputline.o :  $(COMMON_SRC_DIR)/inputline.c $(COMMON_SRC_DIR)/inputline.h
	$(CC) $(CCFLAGS) -xc++ $< -o $@

$(OBJDIR)/bitcalc.o :  $(COMMON_SRC_DIR)/bitcalc.cpp $(COMMON_SRC_DIR)/bitcalc.h
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/gpios.o :  $(BASE_SRC_DIR)/gpios.cpp $(BASE_SRC_DIR)/gpios.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/logsource.o :  $(COMMON_SRC_DIR)/logsource.cpp $(COMMON_SRC_DIR)/logsource.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/logger.o :  $(COMMON_SRC_DIR)/logger.cpp $(COMMON_SRC_DIR)/logger.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/utils.o :  $(BASE_SRC_DIR)/utils.cpp $(BASE_SRC_DIR)/utils.hpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/compile_timestamp.o :  $(COMMON_SRC_DIR)/compile_timestamp.cpp
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/pru.o :  $(BASE_SRC_DIR)/pru.cpp $(BASE_SRC_DIR)/pru.hpp
	$(CC) $(CCFLAGS) $< -o $@

# files with PRU code and addresses
$(OBJDIR)/pru0_config.o :  $(PRU_DEPLOY_DIR)/$(PRU0_CODE)
	$(CC) $(CCFLAGS) -xc++ $< -o $@

$(OBJDIR)/pru1_config.o :  $(PRU_DEPLOY_DIR)/$(PRU1_CODE)
	$(CC) $(CCFLAGS) -xc++ $< -o $@

$(OBJDIR)/mailbox.o :  $(BASE_SRC_DIR)/mailbox.cpp $(OBJDIR)/$(PRU_CODE) $(SHARED_SRC_DIR)/mailbox.h
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/ddrmem.o :  $(BASE_SRC_DIR)/ddrmem.cpp $(SHARED_SRC_DIR)/ddrmem.h
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/iopageregister.o :  $(BASE_SRC_DIR)/iopageregister.cpp $(SHARED_SRC_DIR)/iopageregister.h
	$(CC) $(CCFLAGS) $< -o $@

$(OBJDIR)/unibusadapter.o :  $(BASE_SRC_DIR)/unibusadapter.cpp $(BASE_SRC_DIR)/unibusadapter.hpp
	$(CC) $(CCFLAGS) $< -o $@

# the binary image for each of the 2 PRUs is generated with the clrpu compiler
# and converted to a C array source code
#
$(PRU_DEPLOY_DIR)/$(PRU0_CODE): $(PRU0_BASE_SRC_DIR)/*.c
	$(MAKE) -C $(PRU0_BASE_SRC_DIR) $(PRU_DEPLOY_DIR)/$(PRU0_CODE)
	echo PRU codefile $(PRU0_CODE) and *.h are create in $(PRU_DEPLOY_DIR)
#	cp $(PRU_DEPLOY_DIR)/$(PRU0_CODE).[hc]

$(PRU_DEPLOY_DIR)/$(PRU1_CODE): $(PRU1_BASE_SRC_DIR)/*.c
	$(MAKE) -C $(PRU1_BASE_SRC_DIR) $(PRU_DEPLOY_DIR)/$(PRU1_CODE)
	echo PRU codefile $(PRU1_CODE) and *.h are create in $(PRU_DEPLOY_DIR)

