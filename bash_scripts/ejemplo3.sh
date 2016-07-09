#!/bin/bash

read -p "Ingrese el USER a buscar en /etc/passwd: " USER

#grep -c para buscar la cantidad de veces que se repite una palabra
# NUMERO=`grep $USER /etc/passwd | wc -l` estaría buscando la cantidad de líneas donde se repite
#OCURRENCIAS=$(grep -c "$USER" /etc/passwd)
OCURRENCIAS=`grep -c "$USER" /etc/passwd`

#if test "$OCURRENCIAS" -gt 2
if [ "$OCURRENCIAS" -gt 2 ]
then
        echo ""$USER" se repite más que 2 veces, "$OCURRENCIAS" veces"
else
        echo ""$USER" se repite solo "$OCURRENCIAS" vez"
fi


############################################

#read -p "Ingrese la palabra a buscar: " PALABRA

#OCURRENCIAS=$(grep -c "$PALABRA" /etc/passwd)

#if [ $OCURRENCIAS -gt 2 ]
#then
#	echo "$PALABRA aparece mas de 2 veces"
#else
#	echo "$PALABRA aparece solo $OCURRENCIAS"
#fi

###########################################

#read -p "Ingrese la palabra a buscar: " PALABRA

#OCURRENCIAS=$(grep -c "$PALABRA" /etc/passwd)

#if [ $OCURRENCIAS -gt 2 ]
#then
#	echo "$PALABRA aparece mas de 2 veces"
#else
#	echo "$PALABRA aparece solo $OCURRENCIAS"
#fi