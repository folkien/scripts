#!/bin/bash

while [ $(is-online) -ne 0 ]; do
    echo "Waiting till online.."
    sleep 5
done
