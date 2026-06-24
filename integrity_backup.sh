#!/data/data/com.termux/files/usr/bin/bash

clear

DATA=$(date +%Y-%m-%d_%H-%M-%S)
RELATORIO="relatorios/relatorio_$DATA.txt"

{
echo "=================================="
echo "    INTEGRITY CHECK ANDROID"
echo "=================================="

for modulo in modulos/*.sh
do
    [ -f "$modulo" ] && bash "$modulo"
done

echo
echo "Verificação concluída."
} | tee "$RELATORIO"

echo
echo "Relatório salvo em:"
echo "$RELATORIO"
