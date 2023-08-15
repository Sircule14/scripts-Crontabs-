#!/bin/bash

# Lista de directorios para limpiar
# Aqui puedes agregar los directorios que quieras que se eliminen al ejecutrar el script
directories_to_clean=(
    "/tmp"
    "/var/tmp"
    "/var/log"
    "~/.cache"
    "~/.thumbnails"
)

# Limpieza de archivos temporales
for dir_path in "${directories_to_clean[@]}"; do
    dir_path=$(eval echo "$dir_path")  # Expandir la tilde en la ruta del directorio
    if [ -d "$dir_path" ]; then
        echo "Limpiando: $dir_path"
        sudo rm -rf "$dir_path"/*  # Elimina todos los archivos en el directorio
    else
        echo "Directorio no encontrado: $dir_path"
    fi
done

echo "Limpieza completada."
