#!/bin/bash

# Jakub Dostal, 263959
# PN/TN 9:15

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [[ -d "$TARGET_DIR" ]]
then
    echo "Plik istnieje"
else
    echo "Tworze plik"
    mkdir -p "$TARGET_DIR"
fi

for item in "$RM_LIST"/*
do
    filename=$(basename "$item")

    rm -rf "$SOURCE_DIR"/$filename
done

for item in "$SOURCE_DIR"/*
do 
    filename=$(basename "$item")

    if [[ -f "$SOURCE_DIR"/$filename ]]
    then
        mv "$SOURCE_DIR"/$filename "$TARGET_DIR"
    elif [[ -d "$SOURCE_DIR"/$filename ]]
    then
        cp -r "$SOURCE_DIR"/$filename "$TARGET_DIR"
    fi
done

if [[ -n $(ls -A "$SOURCE_DIR") ]]
then
    echo "Jeszcze cos zostalo"

    NUMBER_OF_FILES=$(ls -A "$SOURCE_DIR" | wc -l)

    if [[ "$NUMBER_OF_FILES" -ge 2 ]]
    then
        echo "Zostaly co najmniej 2 pliki"
    fi

    if [[ "$NUMBER_OF_FILES" -gt 4 ]]
    then
        echo "Zostaly wiecej niz 4 pliki"
    elif [[ "$NUMBER_OF_FILES" -le 4 ]]
    then
        echo "Zostaly nie wiecej niz 4, ale wiecej niz 2 pliki"
    fi
else
    echo "Tu byl Kononowicz, nie bedzie bandyctwa, zlodziejstwa, nic nie bedzie"
fi

DATE=$(date +"%Y-%m-%d")
ARCHIVE="bakap_${DATE}.zip"
zip -r "$ARCHIVE" "$TARGET_DIR"