#!/bin/bash
DTBFILE=$@
dtc -I dtb -O dts  -o $DTBFILE.dts $DTBFILE

