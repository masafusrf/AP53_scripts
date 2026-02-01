#! /bin/bash

# • Muestre el día más caluroso (la temperatura máxima más alta).
# • Calcule la oscilación térmica de cada día (diferencia entre máxima y mínima) y
# la muestre por pantalla.

tempMax=0
diaMax=""

while read linea; do

    diaSemana=$(echo "$linea" | awk '{print $1}')
    tempsMinimas=$(echo "$linea" | awk '{print $2}')
    tempsMaximas=$(echo "$linea" | awk '{print $3}')

    if [ "$tempsMaximas" -gt "$tempMax" ]; then
        tempMax=$tempsMaximas
        diaMax=$diaSemana
    fi

    oscilacion=$((tempsMaximas - tempsMinimas))
    echo "La diferencia entre la max y min del $diaSemana es de $oscilacion grados."

done < temperaturas.txt

echo "Día más caluroso: $diaMax"