#!/data/data/com.termux/files/usr/bin/bash

clear

echo "========================================"
echo "      OLHO DE DEUS PREMIUM"
echo "========================================"
echo

TOTAL=0

for modulo in modulos/*.sh
do
    nome=$(basename "$modulo")

    case "$nome" in
        mod40_olho_de_deus_premium.sh)
            continue
        ;;
    esac

    TOTAL=$((TOTAL+1))

    echo
    echo "Executando: $nome"
    echo "--------------------------------"

    bash "$modulo"

    echo
done

echo
echo "========================================"
echo "MÓDULOS EXECUTADOS: $TOTAL"
echo "ANÁLISE FINALIZADA"
echo "========================================"
