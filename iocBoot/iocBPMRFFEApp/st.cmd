#!../../bin/linux-x86_64/BPMRFFE

## You may have to change BPMRFFE to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/BPMRFFE.dbd"
BPMRFFE_registerRecordDeviceDriver pdbbase

## Setup environment variables
epicsEnvSet("P", "${EPICS_PV_AREA_PREFIX}")
epicsEnvSet("R", "${EPICS_PV_DEVICE_PREFIX}")
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/BPMRFFEApp/Db")

## Set up address
drvAsynIPPortConfigure("BPMRFFE", "10.20.21.36:9001", 0, 0, 0)

## Load record instances
dbLoadRecords("$(TOP)/db/bpmrffe.db", "P=$(P), R=$(R), PORT=BPMRFFE")

cd "${TOP}/iocBoot/${IOC}"
iocInit
