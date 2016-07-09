#!/bin/bash

#Haciendo uso de la sentencia repetitiva FOR , realice un script que genere
#un fichero llamado lista.txt que contenga el nombre de los archivos que haya
#en el directorio /etc. RECUERDE: Debe hacer uso de la expresión repetitiva
#for.

for F in /etc/*
do
echo $F >> lista.txt
done