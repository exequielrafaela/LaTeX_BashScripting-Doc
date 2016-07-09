#!/bin/bash

#Realizar un script que dado una lista de directorios, cree un archivo tar
#comprimido con gzip con nombre igual a la fecha en formato yyyy-mm-dd.tar.gz.
#Además se debe generar un fichero yyyy-mm-dd.lst con los nombres de los di-
#rectorios contenidos en el archivo tar, uno por linea usando un bucle. Si el
#fichero lst existe, mostrar un error y terminar el programa. Si alguno de los
#elementos no es un directorio, mostrar un error y finalizar el programa.

# 1386  ls -d /home/curso/*
# 1387  ls -x /home/curso/* | grep '^d'
# 1388  ls -x -R /home/curso/
read -p "Input absolute path DIR to get a List of
subdirs in a .txt and compress this file list: " Dir

echo "####################################"
echo "# List of Dirs to Compress: $Dir   #"
echo "####################################"

Dir_name=$(echo "$Dir" | tr '/' '-')
echo "####################################"
echo "## The dir name replazing / for - is: $Dir_name       "
echo "####################################"

#curso@ubuntu:~/tema10$ ls -lR /home/curso/ | grep '^d' | cut -d' '  -f9-13 | cut -d':' -f2
ls -ld $Dir* | cut -d' ' -f12-16 | cut -d'/' -f2-6 | sed '/^$/d' > Dir_list.txt

Date=$(date +"%Y-%m-%d")
echo "####################################"
echo "######### Date: $Date #########"
echo "####################################"

tar -zcvf $Date.tar.gz Dir_list.txt
compress_f=$(ls -la | grep tar.gz | cut -d' ' -f8-12)
echo "####################################"
echo "########## Your backups: ###########"
echo "$Backup List                        "
echo "####################################"


if [ test -f ./ext/Dir_list_ext.lst ]   
then
	echo "El fichero .lst YA EXISTE"
else
	mkdir ext
	tar -xzvf $Date.tar.gz -C ./ext
	echo -e "Se creará fichero lst en base a la lista de Dirs del file en \n archivo /ext/Dir_list_ext.lst"
	while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "$line," >> ./ext/Dir_list_ext.lst
	done < Dir_list.txt
fi


