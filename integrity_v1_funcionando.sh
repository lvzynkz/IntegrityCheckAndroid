#!/data/data/com.termux/files/usr/bin/bash

while true
do
    clear

    echo "========================================"
    echo "      SCAN BLACKOUT CAPIVARA"
    echo "========================================"
    echo
    echo "[00] Olho de Deus"
    echo "[01] Executar Tudo"
    echo
    echo "[02] Sistema"
    echo "[03] USB"
    echo "[04] Root"
    echo "[05] ADB"
    echo "[06] VPN"
    echo "[07] Apps"
    echo
    echo "[0] Sair"
    echo

    read -p "Escolha uma opção: " op

    case "$op" in

        00)
            bash modulos/mod00_olho_de_deus.sh
            ;;

        01)
            echo
            echo "[*] Executando todos os módulos..."
            echo

            for arq in modulos/mod*.sh
            do
                echo "Executando: $(basename "$arq")"
                bash "$arq"
                echo
            done

            read -p "Pressione ENTER para continuar..."
            ;;

        02)
            bash modulos/mod01_sistema.sh
            ;;

        03)
            bash modulos/mod01_usb.sh
            ;;

        04)
            bash modulos/mod02_root.sh
            ;;

        05)
            bash modulos/mod03_adb.sh
            ;;

        06)
            bash modulos/mod04_vpn.sh
            ;;

        07)
            bash modulos/mod05_apps.sh
            ;;

        0)
            echo "Saindo..."
            exit 0
            ;;

        *)
            echo
            echo "Opção inválida!"
            sleep 2
            ;;
    esac

    echo
    read -p "Pressione ENTER para voltar ao menu..."
done
