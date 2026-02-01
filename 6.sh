#! /bin/bash
# • Cuente cuántas veces se ha conectado un usuario específico que se le pida al
# script por parámetro (o mediante lectura de teclado).
# • Indique cuántos usuarios se conectaron antes de las 08:00 AM (considerando
# solo la parte de la hora).

fichero="accesos.txt"

read -p "Introduce tu usuario: " usuario

vecesConectado=$(grep "^$usuario" "$fichero" | wc -l)
conectadosAntes8=$(awk '$2 < "08:00" { print $1 }' "$fichero" | wc -l)

echo "'$usuario' se ha conectado $vecesConectado veces."
echo "Usuarios antes de las 8:00: $conectadosAntes8"
