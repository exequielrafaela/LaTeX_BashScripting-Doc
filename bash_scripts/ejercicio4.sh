#!/bin/bash

#Realice un script que permita ingresar mediante el teclado 4 palabras. En cada iteración usted
#debe convertir a mayúsculas solo aquellas palabras cuya segunda letra sean vocales. Si el
#número de palabras que cumplen dicha condición es mayor que 3, guarde todas esas palabras
#en un archivo llamado diccionario.txt y ordene al mismo alfabéticamente de manera inversa.
#Recuerde que el archivo debe quedar ordenado, no basta con ordenar la salida.
#Ayuda: Utilizar comandos read, grep, if, let, tr, for, sort

COUNTER=0
echo "" > diccionario.txt
echo "" > temp.txt
echo "" > temp1.txt

for i in {1..4}
do
   read -p "Ingrese palabra $i: " WORD
   echo $WORD > temp.txt
   OCURRENCIA=$(cat temp.txt | cut -c 2 | egrep -i -c 'a|e|i|o|u')
   echo ""
	if [ $OCURRENCIA -gt 0 ]
	then
		echo $WORD | tr a-z A-Z 
		((COUNTER++))
		echo "$COUNTER"
		echo $WORD >> temp1.txt

		if [ $COUNTER -gt 3 ]
			then
    		echo ""
    		echo "###########"
    		echo "DICCIONARIO"
    		echo "###########"
    		cat temp1.txt > diccionario.txt
    		sort -d -r diccionario.txt
    	fi
	else
		echo "Ingrese otra palabra"
	fi
	OCURRENCIA=0
done



