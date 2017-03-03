source /etc/colors.sh
FILE=$(ls $STASHDIRECTORY | sort -r | head -n 1)
echo "Last patch file is ${FILE}. Applying."
cp ${STASHDIRECTORY}/${FILE} ./
git apply ./${FILE}
if [ $? -ne 0 ]; then
    echo -e "${Red}Patch failed.${Color_Off}"
else
    echo -e "${Green}Patching completed!${Color_Off}"
fi

