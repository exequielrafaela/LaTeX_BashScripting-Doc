#!/bin/bash

#Cree un script llamado script1_T7.sh que sea interpretado por bash. Al
#ejecutarse debe buscar en el directorio HOME/CURSO todos los archivos y
#ordenelos por nombres alfabéticamente. Redireccione el contenido en un ar-
#chivo llamado salida_script1_T7.txt. Ayuda: Puede emplear la opción -R del
#Comando ls para listar subdirectorios, y la opción -u del comando sort.

ls -R /home/curso | sort -u > salida_script1_T7.txt


#######################

#!/bin/bash

#Haciendo uso de la sentencia repetitiva FOR , realice un script que genere
#un fichero llamado lista.txt que contenga el nombre de los archivos que haya
#en el directorio /etc. RECUERDE: Debe hacer uso de la expresión repetitiva
#for.

for F in /etc/*
do
echo $F >> lista.txt
done

#######################

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

###############################################

#!/bin/bash

#Realizar un script que, dado un número, indique si es o no divisible por 2.
#Si no se ingresa un número debe decir como usar el programa.

divisor=2

read -t 3 -p "Input a Number to check if it's divisible by 2 : " Number || echo -e "\nPlase enter a number during the 1st 3 secs"
#echo $(($Number / $divisor)) 
#expr $Number / $divisor  
#if [$(($number % 5)) -eq 0 ]

# Use the && (and) and || (or) operators:
#if [[ expression ]] && [[ expression ]] || [[ expression ]] ; then

#They can also be used within a single [[ ]]:
#if [[ expression && expression || expression ]] ; then

#And, finally, you can group them to ensure order of evaluation:
#if [[ expression && ( expression || expression ) ]] ; then

if [[ "$Number" -ne 0 ]] && [[ -n $Number ]]
then
	if (($Number % $divisor == 0))
	then
    echo "Your number is divisible by 2"
	else
    echo "Your number is not divisible by 2"
	fi
else
	echo "You must enter a number dif from 0 (cero) to check if it's divisible by 2"
fi

###################################

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

###################

#!/bin/bash

if test -d /var
then
	echo "El dir exsite"
else
	echo "el dir no existe"
fi

##################

#!/bin/bash

read -p "Ingrese el USER  a buscar en /etc/passwd: " USER;

if grep $USER /etc/passwd > /dev/null
then
        echo "El user exite"
else
        echo "EL user no existe"
fi

###################

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


##################

#!/bin/bash
echo “Contar hasta diez”
for VARIABLE in 1 2 3 4 5 6 7 8 9 10
do
 CONTADOR="Numero $VARIABLE"
 echo $CONTADOR
done

# For example 2
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done

# For example 3
for i in {1..5}
do
   echo "Welcome $i times"
done

# For example 4
echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
  do
     echo "Welcome $i times"
 done

# Hello world using variables
 STR="Hello World!"
 echo $STR

 ######################

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

#######################

#!/bin/bash

#Leer y tratar de predecir que es lo que hace este script
#Probar y determinar que es lo que hace este script

echo "i in hola 1 * 2 adios"
for i in hola 1 * 2 adios
do
echo "Iterando ... i tiene el valor $i"
done

echo "for i in hola 1 \* 2 adios"
for i in hola 1 \* 2 adios
do
echo "Iterando ... i tiene el valor $i"
done

######################

nombre=juan 
grep "$nombre" /etc/passwd || echo "$nombre no se encontro en el archivo"

read -p "Type url to test: " Web
ping -c1 "$Web" &> /dev/null && echo "Servicio Dns Funcionando" || echo "Servicio DNS No Funciona"
exit 1
