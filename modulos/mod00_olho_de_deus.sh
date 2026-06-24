#!/data/data/com.termux/files/usr/bin/bash

while true
do
    clear

    echo "===================================="
    echo "         OLHO DE DEUS CAPIVARA"
    echo "===================================="
    echo ""
    echo "[001] Detector de Cheats"
    echo "[002] Detector de Bypass"
    echo "[003] Anticheat"
    echo ""
    echo "===================================="
    echo ""
    echo "[999999] EXECUTAR TUDO"
    echo ""
    echo "[0] SAIR"
    echo ""
    echo "===================================="
    echo ""

    read -p "Escolha: " op

    case "$op" in

        1|001)
            clear
            python modulos/detector_cheat.py
            ;;

        2|002)
            clear
            python modulos/detector_bypass.py
            ;;

        3|003)
            clear
            python modulos/anticheat.py
            ;;

        999999)
            clear

            echo "===================================="
            echo "         EXECUTAR TUDO"
            echo "===================================="
            echo ""

            if [ -f modulos/detector_cheat.py ]; then
                echo "[1/4] Detector de Cheats"
                python modulos/detector_cheat.py
            fi

            echo ""

            if [ -f modulos/detector_bypass.py ]; then
                echo "[2/4] Detector de Bypass"
                python modulos/detector_bypass.py
            fi

            echo ""

            if [ -f modulos/anticheat.py ]; then
                echo "[3/4] Anticheat"
                python modulos/anticheat.py
            fi

            echo ""

            if [ -f modulos/executar_tudo.py ]; then
                echo "[4/4] Rotina Completa"
                python modulos/executar_tudo.py
            fi

            echo ""
            echo "[✓] Varredura concluída!"
            read -p "Pressione ENTER para voltar..."
            ;;

        0)
            exit 0
            ;;

        *)
            echo ""
            echo "Opção inválida."
            sleep 1
            ;;

    esac
done
