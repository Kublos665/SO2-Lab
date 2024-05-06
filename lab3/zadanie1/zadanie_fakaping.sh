#!/bin/bash -eu

set -x

while IFS= read -r line
do
    echo "$line" | grep "permission denied" > denied.log
done < <(./fakaping.sh 2>&1)
