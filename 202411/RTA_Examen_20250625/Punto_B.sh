
if [ $# -ne 1 ]; then
  echo "Uso: $0 <ruta_del_archivo_Lista_Animales.txt>"
  exit 1
fi

archivo="$1"

if [ ! -f "$archivo" ]; then
  echo "El archivo '$archivo' no existe."
  exit 1
fi

mkdir -p /tmp/Animales/{Mamiferos,Oviparos,Agua}

> /tmp/animales.txt

while IFS=';' read -r fecha animal codigo; do
  linea="$fecha – Animal: $animal – Habitat: $codigo"
  echo "$linea" >> /tmp/animales.txt

  case "$codigo" in
    TM) carpeta="/tmp/Animales/Mamiferos" ;;
    TO) carpeta="/tmp/Animales/Oviparos" ;;
    AG) carpeta="/tmp/Animales/Agua" ;;
    *) continue ;;
  esac

  echo "$linea" > "$carpeta/${animal}.txt"
done < "$archivo"
