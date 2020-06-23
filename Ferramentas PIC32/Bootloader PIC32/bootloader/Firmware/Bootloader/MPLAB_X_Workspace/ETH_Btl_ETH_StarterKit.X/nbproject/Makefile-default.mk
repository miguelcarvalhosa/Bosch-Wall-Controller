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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf
endif
# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}
# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/590309052/UDP.o ${OBJECTDIR}/_ext/590309052/IP.o ${OBJECTDIR}/_ext/590309052/ARP.o ${OBJECTDIR}/_ext/590309052/Tick.o ${OBJECTDIR}/_ext/590309052/Helpers.o ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o ${OBJECTDIR}/_ext/590309052/ICMP.o ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o ${OBJECTDIR}/_ext/1094924598/Framework.o ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/_ext/1787047461/BootLoader.o ${OBJECTDIR}/_ext/1787047461/NVMem.o ${OBJECTDIR}/_ext/590309052/StackTsk.o


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script=../../linker_scripts/PIC32MX_3XX_to_7XX/eth_btl_eth_sk.ld
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/590309052/UDP.o: ../../Source/TCPIP\ Stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/UDP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/UDP.o.d -o ${OBJECTDIR}/_ext/590309052/UDP.o ../../Source/TCPIP\ Stack/UDP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/UDP.o.d > ${OBJECTDIR}/_ext/590309052/UDP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/UDP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/UDP.o.tmp ${OBJECTDIR}/_ext/590309052/UDP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/UDP.o.tmp
endif
${OBJECTDIR}/_ext/590309052/IP.o: ../../Source/TCPIP\ Stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/IP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/IP.o.d -o ${OBJECTDIR}/_ext/590309052/IP.o ../../Source/TCPIP\ Stack/IP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/IP.o.d > ${OBJECTDIR}/_ext/590309052/IP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/IP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/IP.o.tmp ${OBJECTDIR}/_ext/590309052/IP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/IP.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ARP.o: ../../Source/TCPIP\ Stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ARP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ARP.o.d -o ${OBJECTDIR}/_ext/590309052/ARP.o ../../Source/TCPIP\ Stack/ARP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ARP.o.d > ${OBJECTDIR}/_ext/590309052/ARP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ARP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ARP.o.tmp ${OBJECTDIR}/_ext/590309052/ARP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ARP.o.tmp
endif
${OBJECTDIR}/_ext/590309052/Tick.o: ../../Source/TCPIP\ Stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/Tick.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/Tick.o.d -o ${OBJECTDIR}/_ext/590309052/Tick.o ../../Source/TCPIP\ Stack/Tick.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/Tick.o.d > ${OBJECTDIR}/_ext/590309052/Tick.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/Tick.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/Tick.o.tmp ${OBJECTDIR}/_ext/590309052/Tick.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/Tick.o.tmp
endif
${OBJECTDIR}/_ext/590309052/Helpers.o: ../../Source/TCPIP\ Stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/Helpers.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/Helpers.o.d -o ${OBJECTDIR}/_ext/590309052/Helpers.o ../../Source/TCPIP\ Stack/Helpers.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/Helpers.o.d > ${OBJECTDIR}/_ext/590309052/Helpers.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/Helpers.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/Helpers.o.tmp ${OBJECTDIR}/_ext/590309052/Helpers.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/Helpers.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o: ../../Source/TCPIP\ Stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d -o ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o ../../Source/TCPIP\ Stack/ETHPIC32ExtPhy.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d > ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.tmp ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o: ../../Source/TCPIP\ Stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d -o ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o ../../Source/TCPIP\ Stack/ETHPIC32IntMac.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d > ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.tmp ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ICMP.o: ../../Source/TCPIP\ Stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ICMP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ICMP.o.d -o ${OBJECTDIR}/_ext/590309052/ICMP.o ../../Source/TCPIP\ Stack/ICMP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ICMP.o.d > ${OBJECTDIR}/_ext/590309052/ICMP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ICMP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ICMP.o.tmp ${OBJECTDIR}/_ext/590309052/ICMP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ICMP.o.tmp
endif
${OBJECTDIR}/_ext/1021585835/EthernetTasks.o: ../../Source/Ethernet/EthernetTasks.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1021585835 
	${RM} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d -o ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o ../../Source/Ethernet/EthernetTasks.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d > ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.tmp
	${RM} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d 
	${CP} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.tmp ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d 
	${RM} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.tmp
endif
${OBJECTDIR}/_ext/1094924598/Framework.o: ../../Source/FrameWork/Framework.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1094924598 
	${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1094924598/Framework.o.d -o ${OBJECTDIR}/_ext/1094924598/Framework.o ../../Source/FrameWork/Framework.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1094924598/Framework.o.d > ${OBJECTDIR}/_ext/1094924598/Framework.o.tmp
	${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	${CP} ${OBJECTDIR}/_ext/1094924598/Framework.o.tmp ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o: ../../Source/TCPIP\ Stack/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d -o ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o ../../Source/TCPIP\ Stack/ETHPIC32ExtPhyDP83848.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d > ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.tmp ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.tmp
endif
${OBJECTDIR}/_ext/1787047461/BootLoader.o: ../../Source/BootLoader.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1787047461 
	${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d -o ${OBJECTDIR}/_ext/1787047461/BootLoader.o ../../Source/BootLoader.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d > ${OBJECTDIR}/_ext/1787047461/BootLoader.o.tmp
	${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	${CP} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.tmp ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.tmp
endif
${OBJECTDIR}/_ext/1787047461/NVMem.o: ../../Source/NVMem.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1787047461 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1787047461/NVMem.o.d -o ${OBJECTDIR}/_ext/1787047461/NVMem.o ../../Source/NVMem.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1787047461/NVMem.o.d > ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${CP} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
endif
${OBJECTDIR}/_ext/590309052/StackTsk.o: ../../Source/TCPIP\ Stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/StackTsk.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/StackTsk.o.d -o ${OBJECTDIR}/_ext/590309052/StackTsk.o ../../Source/TCPIP\ Stack/StackTsk.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/StackTsk.o.d > ${OBJECTDIR}/_ext/590309052/StackTsk.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/StackTsk.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/StackTsk.o.tmp ${OBJECTDIR}/_ext/590309052/StackTsk.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/StackTsk.o.tmp
endif
else
${OBJECTDIR}/_ext/590309052/UDP.o: ../../Source/TCPIP\ Stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/UDP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/UDP.o.d -o ${OBJECTDIR}/_ext/590309052/UDP.o ../../Source/TCPIP\ Stack/UDP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/UDP.o.d > ${OBJECTDIR}/_ext/590309052/UDP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/UDP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/UDP.o.tmp ${OBJECTDIR}/_ext/590309052/UDP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/UDP.o.tmp
endif
${OBJECTDIR}/_ext/590309052/IP.o: ../../Source/TCPIP\ Stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/IP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/IP.o.d -o ${OBJECTDIR}/_ext/590309052/IP.o ../../Source/TCPIP\ Stack/IP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/IP.o.d > ${OBJECTDIR}/_ext/590309052/IP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/IP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/IP.o.tmp ${OBJECTDIR}/_ext/590309052/IP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/IP.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ARP.o: ../../Source/TCPIP\ Stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ARP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ARP.o.d -o ${OBJECTDIR}/_ext/590309052/ARP.o ../../Source/TCPIP\ Stack/ARP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ARP.o.d > ${OBJECTDIR}/_ext/590309052/ARP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ARP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ARP.o.tmp ${OBJECTDIR}/_ext/590309052/ARP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ARP.o.tmp
endif
${OBJECTDIR}/_ext/590309052/Tick.o: ../../Source/TCPIP\ Stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/Tick.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/Tick.o.d -o ${OBJECTDIR}/_ext/590309052/Tick.o ../../Source/TCPIP\ Stack/Tick.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/Tick.o.d > ${OBJECTDIR}/_ext/590309052/Tick.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/Tick.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/Tick.o.tmp ${OBJECTDIR}/_ext/590309052/Tick.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/Tick.o.tmp
endif
${OBJECTDIR}/_ext/590309052/Helpers.o: ../../Source/TCPIP\ Stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/Helpers.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/Helpers.o.d -o ${OBJECTDIR}/_ext/590309052/Helpers.o ../../Source/TCPIP\ Stack/Helpers.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/Helpers.o.d > ${OBJECTDIR}/_ext/590309052/Helpers.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/Helpers.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/Helpers.o.tmp ${OBJECTDIR}/_ext/590309052/Helpers.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/Helpers.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o: ../../Source/TCPIP\ Stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d -o ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o ../../Source/TCPIP\ Stack/ETHPIC32ExtPhy.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d > ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.tmp ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhy.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o: ../../Source/TCPIP\ Stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d -o ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o ../../Source/TCPIP\ Stack/ETHPIC32IntMac.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d > ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.tmp ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32IntMac.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ICMP.o: ../../Source/TCPIP\ Stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ICMP.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ICMP.o.d -o ${OBJECTDIR}/_ext/590309052/ICMP.o ../../Source/TCPIP\ Stack/ICMP.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ICMP.o.d > ${OBJECTDIR}/_ext/590309052/ICMP.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ICMP.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ICMP.o.tmp ${OBJECTDIR}/_ext/590309052/ICMP.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ICMP.o.tmp
endif
${OBJECTDIR}/_ext/1021585835/EthernetTasks.o: ../../Source/Ethernet/EthernetTasks.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1021585835 
	${RM} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d -o ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o ../../Source/Ethernet/EthernetTasks.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d > ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.tmp
	${RM} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d 
	${CP} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.tmp ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.d 
	${RM} ${OBJECTDIR}/_ext/1021585835/EthernetTasks.o.tmp
endif
${OBJECTDIR}/_ext/1094924598/Framework.o: ../../Source/FrameWork/Framework.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1094924598 
	${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1094924598/Framework.o.d -o ${OBJECTDIR}/_ext/1094924598/Framework.o ../../Source/FrameWork/Framework.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1094924598/Framework.o.d > ${OBJECTDIR}/_ext/1094924598/Framework.o.tmp
	${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	${CP} ${OBJECTDIR}/_ext/1094924598/Framework.o.tmp ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.tmp
endif
${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o: ../../Source/TCPIP\ Stack/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d -o ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o ../../Source/TCPIP\ Stack/ETHPIC32ExtPhyDP83848.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d > ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.tmp ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/ETHPIC32ExtPhyDP83848.o.tmp
endif
${OBJECTDIR}/_ext/1787047461/BootLoader.o: ../../Source/BootLoader.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1787047461 
	${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d -o ${OBJECTDIR}/_ext/1787047461/BootLoader.o ../../Source/BootLoader.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d > ${OBJECTDIR}/_ext/1787047461/BootLoader.o.tmp
	${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	${CP} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.tmp ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.tmp
endif
${OBJECTDIR}/_ext/1787047461/NVMem.o: ../../Source/NVMem.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1787047461 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/1787047461/NVMem.o.d -o ${OBJECTDIR}/_ext/1787047461/NVMem.o ../../Source/NVMem.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1787047461/NVMem.o.d > ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${CP} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.tmp
endif
${OBJECTDIR}/_ext/590309052/StackTsk.o: ../../Source/TCPIP\ Stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/590309052 
	${RM} ${OBJECTDIR}/_ext/590309052/StackTsk.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -DTRANSPORT_LAYER_ETH -DDEMO_BOARD_ETH_STARTER_KIT -DETH_INTERNAL_MAC -I"../../Include/Ethernet" -I"../../Include/HardwareProfile" -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../.." -I"../../Include/Usb" -I"../../Include/TCPIP Stack" -I"../../Include/Framework" -Os -MMD -MF ${OBJECTDIR}/_ext/590309052/StackTsk.o.d -o ${OBJECTDIR}/_ext/590309052/StackTsk.o ../../Source/TCPIP\ Stack/StackTsk.c  
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/590309052/StackTsk.o.d > ${OBJECTDIR}/_ext/590309052/StackTsk.o.tmp
	${RM} ${OBJECTDIR}/_ext/590309052/StackTsk.o.d 
	${CP} ${OBJECTDIR}/_ext/590309052/StackTsk.o.tmp ${OBJECTDIR}/_ext/590309052/StackTsk.o.d 
	${RM} ${OBJECTDIR}/_ext/590309052/StackTsk.o.tmp
endif
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,--defsym=_min_heap_size=30000,--gc-sections,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map" 
else
dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=30000,--gc-sections,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map"
	${MP_CC_DIR}\\pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/ETH_Btl_ETH_StarterKit.X.${IMAGE_TYPE}.elf  
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
