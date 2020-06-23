#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 
# Macros
CND_CONF=default

ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf
endif
# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}
# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1382283020/FSIO.o ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o ${OBJECTDIR}/_ext/1787047461/NVMem.o ${OBJECTDIR}/_ext/1811228923/SD-SPI.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=C:\\Program\ Files\\Java\\jre6/bin/
OS_ORIGINAL="MINGW32_NT-5.1"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin\\pic32-gcc.exe
# MP_BC is not defined
MP_AS=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin\\pic32-as.exe
MP_LD=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin\\pic32-ld.exe
MP_AR=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin\\pic32-ar.exe
# MP_BC is not defined
MP_CC_DIR=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin
# MP_BC_DIR is not defined
MP_AS_DIR=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin
MP_LD_DIR=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin
MP_AR_DIR=C:\\Program\ Files\\Microchip\\mplabc32\\v2.01\\bin
# MP_BC_DIR is not defined
.build-conf: ${BUILD_SUBPROJECTS}
ifneq ($(OS_CURRENT),$(OS_ORIGINAL))
	@echo "***** WARNING: This make file contains OS dependent code. The OS this makefile is being run is different from the OS it was created in."
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script=../../linker_scripts/PIC32MX_3XX_to_7XX/sd_btl_ex16.ld
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1382283020/FSIO.o: ../../Source/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1382283020 
	${RM} ${OBJECTDIR}/_ext/1382283020/FSIO.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1382283020/FSIO.o.d -o ${OBJECTDIR}/_ext/1382283020/FSIO.o ../../Source/MDD\ File\ System/FSIO.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1382283020/FSIO.o.d > ${OBJECTDIR}/_ext/1382283020/FSIO.o.tmp
	${RM} ${OBJECTDIR}/_ext/1382283020/FSIO.o.d 
	${CP} ${OBJECTDIR}/_ext/1382283020/FSIO.o.tmp ${OBJECTDIR}/_ext/1382283020/FSIO.o.d 
	${RM} ${OBJECTDIR}/_ext/1382283020/FSIO.o.tmp
endif
${OBJECTDIR}/_ext/1811228923/sd_bootloader.o: ../../Source/SD/sd_bootloader.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1811228923 
	${RM} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d -o ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o ../../Source/SD/sd_bootloader.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d > ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.tmp
	${RM} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d 
	${CP} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.tmp ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d 
	${RM} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.tmp
endif
${OBJECTDIR}/_ext/1787047461/NVMem.o: ../../Source/NVMem.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1787047461 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1787047461/NVMem.o.d -o ${OBJECTDIR}/_ext/1787047461/NVMem.o ../../Source/NVMem.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1787047461/NVMem.o.d > ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${CP} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
endif
${OBJECTDIR}/_ext/1811228923/SD-SPI.o: ../../Source/SD/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1811228923 
	${RM} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d -o ${OBJECTDIR}/_ext/1811228923/SD-SPI.o ../../Source/SD/SD-SPI.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d > ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.tmp
	${RM} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d 
	${CP} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.tmp ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d 
	${RM} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.tmp
endif
else
${OBJECTDIR}/_ext/1382283020/FSIO.o: ../../Source/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1382283020 
	${RM} ${OBJECTDIR}/_ext/1382283020/FSIO.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1382283020/FSIO.o.d -o ${OBJECTDIR}/_ext/1382283020/FSIO.o ../../Source/MDD\ File\ System/FSIO.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1382283020/FSIO.o.d > ${OBJECTDIR}/_ext/1382283020/FSIO.o.tmp
	${RM} ${OBJECTDIR}/_ext/1382283020/FSIO.o.d 
	${CP} ${OBJECTDIR}/_ext/1382283020/FSIO.o.tmp ${OBJECTDIR}/_ext/1382283020/FSIO.o.d 
	${RM} ${OBJECTDIR}/_ext/1382283020/FSIO.o.tmp
endif
${OBJECTDIR}/_ext/1811228923/sd_bootloader.o: ../../Source/SD/sd_bootloader.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1811228923 
	${RM} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d -o ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o ../../Source/SD/sd_bootloader.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d > ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.tmp
	${RM} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d 
	${CP} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.tmp ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.d 
	${RM} ${OBJECTDIR}/_ext/1811228923/sd_bootloader.o.tmp
endif
${OBJECTDIR}/_ext/1787047461/NVMem.o: ../../Source/NVMem.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1787047461 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1787047461/NVMem.o.d -o ${OBJECTDIR}/_ext/1787047461/NVMem.o ../../Source/NVMem.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1787047461/NVMem.o.d > ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${CP} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
endif
${OBJECTDIR}/_ext/1811228923/SD-SPI.o: ../../Source/SD/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1811228923 
	${RM} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_SD_CARD -DDEMO_BOARD_EXPLORER_16 -I"../../MPLAB_Workspace" -I"../.." -I"../../Include" -I"../../Include/MDD File System" -I"../../Include/HardwareProfile" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -Os -MMD -MF ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d -o ${OBJECTDIR}/_ext/1811228923/SD-SPI.o ../../Source/SD/SD-SPI.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d > ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.tmp
	${RM} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d 
	${CP} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.tmp ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.d 
	${RM} ${OBJECTDIR}/_ext/1811228923/SD-SPI.o.tmp
endif
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_REAL_ICE=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1,--gc-sections,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map" 
else
dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map"
	${MP_CC_DIR}\\pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/SD_Card_Btl_Explorer16.X.${IMAGE_TYPE}.elf  
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
