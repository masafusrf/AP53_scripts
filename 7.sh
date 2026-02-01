#! /bin/bash
# • Cuántos archivos hay de cada tipo (por ejemplo: "Hay 3 archivos .jpg y 2
# archivos .pdf").
# • Si encuentra algún archivo sin extensión, debe mostrar un mensaje de
# advertencia indicando el nombre de ese archivo.

archivosjpg=0
archivospdf=0
archivostxt=0
archivoscsv=0

while read linea; do
# hago esto pq en el archivo cada linea termina con \r\n
# asi lo limpio pq si no no me da ningun resultado. dsps print
# coge la linea ya limpia

linea=$(echo "$linea" | awk '{sub(/\r$/,""); print}')

    if [[ "$linea" == *.jpg ]]; then
        archivosjpg=$((archivosjpg + 1))

    elif [[ "$linea" == *.pdf ]]; then
        archivospdf=$((archivospdf + 1))

    elif [[ "$linea" == *.txt ]]; then
        archivostxt=$((archivostxt + 1))

    elif [[ "$linea" == *.csv ]]; then
        archivoscsv=$((archivoscsv + 1))
        
    else
        echo "Los siguientes archivos no tienen extensión: $linea"
    fi
done < archivos.txt

echo "Archivos jpg: $archivosjpg"
echo "Archivos pdf: $archivospdf"
echo "Archivos txt: $archivostxt"
echo "Archivos csv: $archivoscsv"