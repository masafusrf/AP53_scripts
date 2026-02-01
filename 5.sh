#! /bin/bash
# mostrar productos q tienen < 10uds
# calcular el valor total del inventario (cantidad x precio de cada prod y sumarlo todo)

valorTotalInvent=0

while read linea; do

    producto=$(echo "$linea" | awk '{print $1}')
    uds=$(echo "$linea" | awk '{print $2}')
    precioUnidad=$(echo "$linea" | awk '{print $3}')

    if [ "$uds" -lt 10 ]; then
        echo " $producto"
    fi

    valorProducto=$((uds * precioUnidad))
    valorTotalInvent=$((valorTotalInvent + valorProducto))

done < stock.txt

echo "Valor total inventario: $valorTotalInvent"
