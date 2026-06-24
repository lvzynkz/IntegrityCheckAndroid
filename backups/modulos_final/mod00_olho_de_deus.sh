#!/data/data/com.termux/files/usr/bin/bash

clear

echo
echo "======================================="
echo "       OLHO DE DEUS 😉📂"
echo "======================================="
echo

MODULOS=(
modulos/mod01_sistema.sh
modulos/mod01_usb.sh
modulos/mod02_root.sh
modulos/mod03_adb.sh
modulos/mod04_vpn.sh
modulos/mod05_apps.sh
modulos/mod06_armazenamento.sh
modulos/mod07_processos.sh
modulos/mod08_seguranca.sh
modulos/mod09_suspeitos.sh
modulos/mod11_bateria.sh
modulos/mod12_ram.sh
modulos/mod13_rede.sh
modulos/mod15_rede_avancada.sh
modulos/mod16_wifi.sh
modulos/mod17_sensores.sh
modulos/mod18_cpu.sh
modulos/mod19_armazenamento_avancado.sh
modulos/mod20_seguranca_sistema.sh
modulos/mod22_wifi.sh
modulos/mod23_bluetooth.sh
modulos/mod24_usb_avancado.sh
modulos/mod25_jogos_suspeitos.sh
modulos/mod26_apps_risco.sh
modulos/mod27_integridade.sh
modulos/mod28_relatorio_premium.sh
modulos/mod29_resumo.sh
modulos/mod31_tela.sh
modulos/mod32_camera.sh
modulos/mod33_audio.sh
modulos/mod34_sensores_avancados.sh
modulos/mod35_conectividade.sh
modulos/mod36_relatorio_tecnico.sh
modulos/mod37_diagnostico.sh
modulos/mod38_pontuacao.sh
)

TOTAL=0

for modulo in "${MODULOS[@]}"
do
    if [ -f "$modulo" ]
    then
        TOTAL=$((TOTAL+1))

        echo
        echo "======================================="
        echo "Executando: $(basename "$modulo")"
        echo "======================================="

        bash "$modulo"
    fi
done

echo
echo "======================================="
echo "           RESUMO FINAL"
echo "======================================="

echo "Modelo: $(getprop ro.product.model)"
echo "Fabricante: $(getprop ro.product.manufacturer)"
echo "Android: $(getprop ro.build.version.release)"
echo "Kernel: $(uname -r)"

BOOT=$(getprop ro.boot.verifiedbootstate)

echo "Verified Boot: $BOOT"

if [ "$BOOT" = "green" ]
then
    STATUS="ÍNTEGRO"
else
    STATUS="ATENÇÃO"
fi

if getprop persist.sys.usb.config | grep -qi adb
then
    ADB="ATIVADO"
else
    ADB="DESATIVADO"
fi

echo "ADB: $ADB"
echo "Status Geral: $STATUS"

echo
echo "Módulos executados: $TOTAL"

echo
echo "======================================="
echo "     OLHO DE DEUS FINALIZADO 😉📂"
echo "======================================="
