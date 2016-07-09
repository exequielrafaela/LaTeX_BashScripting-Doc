#!/bin/bash

#Realizar un script que dado un directorio, cree un archivo tar comprimido con
#gzip y con nombre igual a la fecha en formato #yyyy-mm-dd seguido del nombre del directorio.tar.gz
#Por ejemplo: aplicado al directorio tmp obtendríamos  2012-07-11tmp.tar.gz.

#tar -zcvf archive-name.tar.gz directory-name
#Where,
#-z : Compress archive using gzip program
#-c : Create archive
#-v : Verbose i.e display progress while creating archive
#-f : Archive File name

Date=$(date +"%Y-%m-%d")
echo "####################################"
echo "######### Date: $Date #########"
echo "####################################"

read -p "Input absolute path DIR to Comperss: " Dir
echo "####################################"
echo "# Directory to Compress: $Dir      #"
echo "####################################"

Dir_name=$(echo "$Dir" | tr '/' '-')
echo "####################################"
echo "## The dir name is: $Dir_name       "
echo "####################################"

tar -zcvf $Date$Dir_name.tar.gz "$Dir"
compress_f=$(ls -la | grep tar.gz | cut -d' ' -f8-12)
echo "####################################"
echo "########## Your backups: ###########"
echo "$compress_f                         "
echo "####################################"
