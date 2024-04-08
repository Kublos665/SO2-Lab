#!/bin/bash -eu

if [[ $# -eq 0 ]]; then
    echo "Blad: Nie podano parametrow."
    exit 1
fi

FIRST_DIR=${1}
SECOND_DIR=${2}

if [[ ! -d "$FIRST_DIR" ]]; then
    echo "Blad: Plik nie istnieje."
    exit 1
fi

if [[ ! -d "$SECOND_DIR" ]]; then
    echo "Blad: Plik nie istnieje."
    exit 1
fi

for item in "$FIRST_DIR"/*
do 
    filename=$(basename "$item")

    if [[ -f "$FIRST_DIR"/$filename ]]
    then
        echo "$filename - plik regularny"
        ln -s "../$FIRST_DIR"/$filename "$SECOND_DIR"/${filename%.*}_ln.${filename#*.}
    elif [[ -d "$FIRST_DIR"/$filename ]]
    then
        echo "$filename - katalog"
        ln -s "../$FIRST_DIR"/$filename "$SECOND_DIR"/${filename%.*}_ln.${filename#*.}
    elif [[ -L "$FIRST_DIR"/$filename ]]
    then
        echo "$filename - dowiazanie symboliczne"
    fi
done