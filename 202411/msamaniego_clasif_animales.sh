archivo="$1"
if [ ! -f "$archivo" ]; then
  echo "El archivo $archivo no existe"
  exit 1
fi

mkdir -p ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/tmp/Animales/{Agua,Tierra/Mamiferos,Tierra/Oviparos}

while IFS=";" read -r nombre tipo clasificacion; do
  case "$tipo" in
    Agua)
      ruta="~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/tmp/Animales/Agua/$nombre.txt"
      ;;
    Tierra)
      if [ "$clasificacion" = "Mamifero" ]; then
        ruta="~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/tmp/Animales/Tierra/Mamiferos/$nombre.txt"
      elif [ "$clasificacion" = "Oviparo" ]; then
        ruta="~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/tmp/Animales/Tierra/Oviparos/$nombre.txt"
      fi
      ;;
  esac

  if [ -n "$ruta" ]; then
    ruta=$(eval echo "$ruta")
    echo "$nombre;$tipo;$clasificacion" > "$ruta"
  fi
done < "$archivo"
