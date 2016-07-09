#!/bin/bash

read -p "Ingrese el USER  a buscar en /etc/passwd: " USER;

if grep $USER /etc/passwd > /dev/null
then
        echo "El user exite"
else
        echo "EL user no existe"
fi

