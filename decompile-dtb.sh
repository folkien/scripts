#!/bin/bash
DTBFILE=$@
dtc -i $DTBFILE -I dtb -o $DTBFILE.dts -O dts
