#!/bin/bash -eu

while IFS= read -r line
do
    echo "$line" | grep -F "\$2.99" >&2
    echo "$line" | grep -F "\$5.99" >&2
    echo "$line" | grep -F "\$9.99" >&2
done < yolo.csv