#!/bin/bash

# Función para registrar la hora de entrada
registro_entrada() {
    echo "Registro de hora de entrada:"
    echo "$(date +%Y-%m-%d\ %H:%M:%S)" >> registros.txt
    echo "Hora de entrada registrada."
}

# Función para registrar la hora de salida y calcular las horas trabajadas
registro_salida() {
    echo "Registro de hora de salida:"
    echo "$(date +%Y-%m-%d\ %H:%M:%S)" >> registros.txt
    echo "Hora de salida registrada."

    # Calcular las horas trabajadas
    hora_entrada=$(head -n 1 registros.txt)
    hora_salida=$(tail -n 1 registros.txt)
    entrada_unix=$(date -d "$hora_entrada" +%s)
    salida_unix=$(date -d "$hora_salida" +%s)
    segundos_trabajados=$((salida_unix - entrada_unix))
    horas_trabajadas=$(echo "scale=2; $segundos_trabajados / 3600" | bc)
    echo "Horas trabajadas: $horas_trabajadas"
}

# Menú de opciones
echo "1. Registrar hora de entrada"
echo "2. Registrar hora de salida y calcular horas trabajadas"
read -p "Seleccione una opción: " opcion

case $opcion in
    1)
        registro_entrada
        ;;
    2)
        registro_salida
        ;;
    *)
        echo "Opción no válida"
        ;;
esac
