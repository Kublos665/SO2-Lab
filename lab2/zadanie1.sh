#!/bin/bash -eu

if [[ $# -eq 0 ]]; then
    echo "Blad: Nie podano parametrow."
    exit 1
fi

SOURCE_DIR=${1}

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Blad: Plik nie istnieje."
    exit 1
fi

for item in "$SOURCE_DIR"/*
do 
    filename=$(basename "$item")

    if [[ -f "$SOURCE_DIR"/$filename ]]
    then
        if [[ $filename == *.bak ]]
        then
            chmod a-w "$SOURCE_DIR"/$filename
        fi
    elif [[ -d "$SOURCE_DIR"/$filename ]]
    then
        if [[ $filename == *.bak ]]
        then
            chmod 415 "$SOURCE_DIR"/$filename
        fi
    elif [[ -d "$SOURCE_DIR"/$filename ]]
    then
        if [[ $filename == *.tmp ]]
        then
            chmod 777 "$SOURCE_DIR"/$filename
        fi
    elif [[ -f "$SOURCE_DIR"/$filename ]]
    then
        if [[ $filename == *.txt ]]
        then
            chmod 241 "$SOURCE_DIR"/$filename
        fi
    elif [[ -f "$SOURCE_DIR"/$filename ]]
    then
        if [[ $filename == *.exe ]]
        then
            chmod u+x,o+x,g+x "$SOURCE_DIR"/$filename
        fi
    fi
done