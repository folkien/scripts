#!/bin/sh
# Test script for disk testing.

testDirectory="."
testNumber=1
while [ 1 ]; do
    # Write test
    # 10 x 10MB creation
    echo "Writing!"
    for i in {0..9}; do
        dd if=/dev/urandom of=${testDirectory}/file${testNumber}_${i}.bin bs=1MB count=10
        # Check results
        if [ $? -ne 0  ]; then
            echo "Creation Failed!"
            exit -1
        fi
    done

    # Synchronize disc content
    sync
    
    # Read test
    # 10 x 10MB creation
    echo "Reading!"
    for i in {0..9}; do
        dd if=${testDirectory}/file${testNumber}_${i}.bin of=/dev/null bs=1MB count=10
        # Check results
        if [ $? -ne 0  ]; then
            echo "Read Failed!"
            exit -1
        fi
    done

    # 10 x 10MB removal
    for i in {0..9}; do
        rm -rfv ${testDirectory}/file${testNumber}_${i}.bin
        # Check results
        if [ $? -ne 0  ]; then
            echo "Removing Failed!"
            exit -1
        fi
    done
    
    # Synchronize disc content
    sync

    testNumber=$((${testNumber}+1))
    echo "Test ${testNumber}."
done
