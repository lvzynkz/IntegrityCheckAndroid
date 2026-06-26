#!/data/data/com.termux/files/usr/bin/bash

while true
do
    clear

    echo "========================================"
    echo "       OLHO DE DEUS CAPIVARA V2"
    echo "========================================"
    echo ""

    echo "[02] Root"
    echo "[03] ADB"
    echo "[04] VPN"
    echo "[05] Apps"
    echo "[06] Armazenamento"
    echo "[07] Processos"
    echo "[08] Segurança"
    echo "[09] Suspeitos"
    echo "[10] USB"
    echo "[11] Bateria"
    echo "[12] RAM"
    echo "[13] Rede"
    echo "[14] Relatório"
    echo "[15] Rede Avançada"
    echo "[16] Wi-Fi"
    echo "[17] Sensores"
    echo "[18] CPU"
    echo "[19] Armazenamento Avançado"
    echo "[20] Segurança Sistema"
    echo "[22] Wi-Fi Avançado"
    echo "[23] Bluetooth"
    echo "[24] USB Avançado"
    echo "[25] Jogos Suspeitos"
    echo "[26] Apps de Risco"
    echo "[27] Integridade"
    echo "[28] Relatório Premium"
    echo "[29] Resumo"
    echo "[31] Tela"
    echo "[32] Câmera"
    echo "[33] Áudio"
    echo "[34] Sensores Avançados"
    echo "[35] Conectividade"
    echo "[36] Relatório Técnico"
    echo "[37] Diagnóstico"
    echo "[38] Pontuação"
    echo "[39] Exportar Relatório"
    echo ""
    echo "[0] Sair"
    echo ""

    read -p "Escolha: " op

    case $op in

    2) bash modulos/mod02_root.sh ;;
    3) bash modulos/mod03_adb.sh ;;
    4) bash modulos/mod04_vpn.sh ;;
    5) bash modulos/mod05_apps.sh ;;
    6) bash modulos/mod06_armazenamento.sh ;;
    7) bash modulos/mod07_processos.sh ;;
    8) bash modulos/mod08_seguranca.sh ;;
    9) bash modulos/mod09_suspeitos.sh ;;
    10) bash modulos/mod10_usb.sh ;;
    11) bash modulos/mod11_bateria.sh ;;
    12) bash modulos/mod12_ram.sh ;;
    13) bash modulos/mod13_rede.sh ;;
    14) bash modulos/mod14_relatorio.sh ;;
    15) bash modulos/mod15_rede_avancada.sh ;;
    16) bash modulos/mod16_wifi.sh ;;
    17) bash modulos/mod17_sensores.sh ;;
    18) bash modulos/mod18_cpu.sh ;;
    19) bash modulos/mod19_armazenamento_avancado.sh ;;
    20) bash modulos/mod20_seguranca_sistema.sh ;;
    22) bash modulos/mod22_wifi.sh ;;
    23) bash modulos/mod23_bluetooth.sh ;;
    24) bash modulos/mod24_usb_avancado.sh ;;
    25) bash modulos/mod25_jogos_suspeitos.sh ;;
    26) bash modulos/mod26_apps_risco.sh ;;
    27) bash modulos/mod27_integridade.sh ;;
    28) bash modulos/mod28_relatorio_premium.sh ;;
    29) bash modulos/mod29_resumo.sh ;;
    31) bash modulos/mod31_tela.sh ;;
    32) bash modulos/mod32_camera.sh ;;
    33) bash modulos/mod33_audio.sh ;;
    34) bash modulos/mod34_sensores_avancados.sh ;;
    35) bash modulos/mod35_conectividade.sh ;;
    36) bash modulos/mod36_relatorio_tecnico.sh ;;
    37) bash modulos/mod37_diagnostico.sh ;;
    38) bash modulos/mod38_pontuacao.sh ;;
    39) bash modulos/mod39_exportar_relatorio.sh ;;

    0)
        clear
        echo "Saindo..."
        exit
        ;;

    *)
        echo "Opcao invalida"
        sleep 1
        ;;
    esac

done
