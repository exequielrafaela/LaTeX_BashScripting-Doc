#!/bin/bash

#Este script muestra en el STDOUT el calendario anual del anio actual y 
#ademas guarda en un archivo de texto, llamado calendario.log, el resultado y la fecha
# y hora en que se lo ejecuto
#Para practicar, ud podria agregar los comentarios entre cada linea de ejecucion 
#explicando que es lo que hace
touch /home/curso/Desktop/bash_scripts/calendario.log
echo "Fecha de ejecucion" > calendario.log
date >> calendario.log
echo "Calendario del anio actual" >> calendario.log
# guardamos el año, se utiliza como delimitador un espacio en blanco ' ' y el field 7
# es decir la palabra que se presenta inmediatamente antes del delimiter en su 7ma repetición.
ANIOACTUAL=`date | cut -d' ' -f7`
cal $ANIOACTUAL | tee -a calendario.log

echo "for i in {1..7}; do date | cut -d' ' -f$i; done => Output below:"
for i in {1..7}; do date | cut -d' ' -f$i; done