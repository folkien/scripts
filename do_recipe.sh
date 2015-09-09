#!/bin/bash
NAME=$1

mkdir -p $NAME/files
echo "DESCRIPTION = \"Recepta z plikami \"" 				>> $NAME/${NAME}_1.0.bb
echo "FILESEXTRAPATHS_prepend := \"${THISDIR}/files:\"" 	>> $NAME/${NAME}_1.0.bb
echo "LICENSE = \"CLOSED\" " 								>> $NAME/${NAME}_1.0.bb
echo "SRC_URI = \"file://file1 \ " 							>> $NAME/${NAME}_1.0.bb
echo "           file://file2 \ " 							>> $NAME/${NAME}_1.0.bb
echo "          \"" 										>> $NAME/${NAME}_1.0.bb
echo "" >> $NAME/${NAME}_1.0.bb
echo "do_install() {" 													>> $NAME/${NAME}_1.0.bb
echo "    mkdir -p ${D}/${sysconfdir}/sonel" 							>> $NAME/${NAME}_1.0.bb
echo "    install -m 0644 ${WORKDIR}/file1 ${D}/${sysconfdir}/sonel/" 	>> $NAME/${NAME}_1.0.bb
echo "    install -m 0644 ${WORKDIR}/file2 ${D}/${sysconfdir}/sonel/" 	>> $NAME/${NAME}_1.0.bb
echo "}" 																>> $NAME/${NAME}_1.0.bb
