#!/bin/bash

#Crear un script que, siendo ejecutado como usuario root
#1.- Cree un grupo llamado "info"
#2.- Solicite al usuario que ingrese los nombres de 3 nuevos usuarios separados por espacio.
#Debe descartar el resto de los usuarios. Debe chequear que los usuarios que el usuario ingresó
#NO existan en el sistema. En caso que los usuarios existan salir del script con un mensaje de
#error y valor de salida 1.
#3.- Crear los 3 nuevos usuarios. Asignarlos al grupo creado en el punto Nº 1.-

groupadd -g 1050 info

read -p "Ingrese 3 Nombres de USERS separados por espacio: " USERS

echo "Solo se tomarán los 3 1eros USERS de la lista $USERS"
USERS=$(echo "$USERS" | cut -d' ' -f1-3)
echo "Estós serán los siguientes 3:"
echo "$USERS"

USER1=$(echo "$USERS" | cut -d' ' -f1)
echo "USER1: $USER1"

USER2=$(echo "$USERS" | cut -d' ' -f2)
echo "USER2: $USER2"

USER3=$(echo "$USERS" | cut -d' ' -f3)
echo "USER3: $USER3"

OCURRENCIAS=`grep -c "$USER1" /etc/passwd`
OCURRENCIAS=`grep -c "$USER2" /etc/passwd`
OCURRENCIAS=`grep -c "$USER3" /etc/passwd`

if [ "$OCURRENCIAS" -gt 0 ] 
then
        echo "ERROR: Al menos uno de los USERS ya existe"
        exit 1
else
        echo "Los USERS no existen en el Sistema "
        echo "Y se procederá a crearlos perteneciendo al grupo info"
        echo "que se creó al comienzo del script"
        adduser $USER1  -gid 50 --home /home/$USER1
        adduser $USER2  -gid 50 --home /home/$USER2
        adduser $USER3  -gid 50 --home /home/$USER3
fi