#!/data/data/com.termux/files/usr/bin/bash
VERDE='\033[0;32m'
AZUL='\033[1;34m'
CIANO='\033[0;36m'
AMARELO='\033[1;33m'
CINZA='\033[0;90m'
SEM_COR='\033[0m'

echo -e "${AZUL}════════════════════════════════════${SEM_COR}"
echo -e "${CIANO}🖼️  INICIALIZAÇÃO VISUAL${SEM_COR}"
echo -e "${AZUL}════════════════════════════════════${SEM_COR}"
echo

echo -e "${CIANO}📌 Abrindo tela de boas‑vindas...${SEM_COR}"
if [ -r "/storage/emulated/0/Download/bem vindo.png" ]; then
    am start \
    -a android.intent.action.VIEW \
    -d "file:///storage/emulated/0/Download/bem%20vindo.png" \
    -t image/png >/dev/null 2>&1 || true
    echo -e "${VERDE}✅ Carregada${SEM_COR}"
else
    echo -e "${AMARELO}⚠️  Arquivo não encontrado, pulando...${SEM_COR}"
fi
echo -e "${CINZA}⏳ 10 segundos${SEM_COR}"
sleep 10
echo

echo -e "${CIANO}🦫 Abrindo arte do Soberano Senhor Capivara...${SEM_COR}"
if [ -r "/storage/emulated/0/Download/capivargodv2.png" ]; then
    am start \
    -a android.intent.action.VIEW \
    -d "file:///storage/emulated/0/Download/capivargodv2.png" \
    -t image/png >/dev/null 2>&1 || true
    echo -e "${VERDE}✅ Carregada${SEM_COR}"
else
    echo -e "${AMARELO}⚠️  Arquivo não encontrado, pulando...${SEM_COR}"
fi
echo -e "${CINZA}⏳ 10 segundos${SEM_COR}"
sleep 10
echo

echo -e "${AZUL}════════════════════════════════════${SEM_COR}"
echo -e "${VERDE}✔️  Fase visual concluída${SEM_COR}"
echo -e "${AZUL}════════════════════════════════════${SEM_COR}"
sleep 2
clear

clear
SENHA_CORRETA="45458899"
TENTATIVAS=0
MAX_TENTATIVAS=3
VERDE='\033[0;32m'
VERMELHO='\033[0;31m'
AZUL='\033[1;34m'
AMARELO='\033[1;33m'
SEM_COR='\033[0m'

while [ "$TENTATIVAS" -lt "$MAX_TENTATIVAS" ]
do
    clear
    echo -e "${AZUL}====================================${SEM_COR}"
    echo -e "${AZUL}      INTEGRITY CHECK ANDROID       ${SEM_COR}"
    echo -e "${AZUL}          ACESSO RESTRITO           ${SEM_COR}"
    echo -e "${AZUL}====================================${SEM_COR}"
    echo

    echo -e "${AZUL}⚠️ só o soberano senhor capivara sabe a senha ⚠️${SEM_COR}"
    echo
    read -s -p "🔐 Digite a senha de acesso: " SENHA_DIGITADA
    echo
    echo

    echo -e "🔑 A senha deste sistema é de conhecimento exclusivo e absoluto apenas do Soberano Senhor Capivara. Nenhuma outra pessoa, equipe, administrador, sistema ou autoridade tem, sabe, guarda ou recebe essa senha de forma alguma. NÃO CONFIE EM MAIS NINGUÉM SOB NENHUMA HIPÓTESE: nunca entregue, nunca pergunte e nunca acredite em quem disser que sabe ou que precisa dela. Essa proteção existe para segurança total, integridade dos dados e cumprimento das regras, sendo o acesso restrito única e exclusivamente a quem for autorizado diretamente por ele."
    echo
    echo "--------------------------------------------------"
    echo "Tentativas restantes: $(( MAX_TENTATIVAS - TENTATIVAS ))"
    echo "--------------------------------------------------"
    echo

    if [ "$SENHA_DIGITADA" = "$SENHA_CORRETA" ]; then
        echo -e "\n${VERDE}[✓] Acesso autorizado! Bem-vindo(a).${SEM_COR}"
        sleep 1.2
        clear

        echo -e "${AMARELO}====================================${SEM_COR}"
        echo -e "${AMARELO}      SEGUNDA VERIFICAÇÃO           ${SEM_COR}"
        echo -e "${AMARELO}         VALIDAÇÃO DE CHAVE         ${SEM_COR}"
        echo -e "${AMARELO}====================================${SEM_COR}"
        echo
        echo -e "${AMARELO}🔑 Insira a chave de liberação exclusiva${SEM_COR}"
        echo
        read -p "Digite a Key: " KEY
        echo

        case "$KEY" in
            "CAPIVARA-X472-K991"|"CAPIVARA-M583-P742"|"CAPIVARA-Z816-H325")
                echo -e "${VERDE}[✓] KEY VALIDADA${SEM_COR}"
                echo -e "${VERDE}✅ Todas as verificações aprovadas${SEM_COR}"
                sleep 1.5
                clear
                ;;
            *)
                echo -e "${VERMELHO}[✗] KEY INVALIDA${SEM_COR}"
                echo -e "${VERMELHO}Acesso negado. Encerrando...${SEM_COR}"
                sleep 2
                clear
                exit 1
                ;;
        esac

        break
    fi

    TENTATIVAS=$(( TENTATIVAS + 1 ))
    echo -e "\n${VERMELHO}[✗] Senha inválida! Tente novamente.${SEM_COR}"
    sleep 1.5
done

if [ "$TENTATIVAS" -ge "$MAX_TENTATIVAS" ]; then
    clear
    echo -e "${VERMELHO}====================================${SEM_COR}"
    echo -e "${VERMELHO}   LIMITE DE TENTATIVAS ATINGIDO    ${SEM_COR}"
    echo -e "${VERMELHO}====================================${SEM_COR}"
    echo
    echo "Acesso bloqueado temporariamente por segurança."
    echo "Encerrando Integrity Check..."
    sleep 3
    clear
    exit 1
fi

echo "✅ Iniciando rotinas de verificação de integridade..."
sleep 1

while true
do

clear

echo "======================================================"
echo "            SUPERVISOR SS CAPIVARA"
echo "======================================================"
echo
echo "[00] OLHO DE DEUS"
echo "[01] EXECUTAR TUDO"
echo
echo "[02] Sistema"
echo "[03] USB"
echo "[04] Root"
echo "[05] ADB"
echo "[06] VPN"
echo "[07] Apps"
echo "[08] Armazenamento"
echo "[09] Processos"
echo "[10] Segurança"
echo "[11] Suspeitos"
echo "[12] Bateria"
echo "[13] RAM"
echo "[14] Rede"
echo "[15] Relatório"
echo "[16] Rede Avançada"
echo "[17] Wi-Fi"
echo "[18] Sensores"
echo "[19] CPU"
echo "[20] Armazenamento Avançado"
echo "[21] Segurança Sistema"
echo "[22] Wi-Fi Avançado"
echo "[23] Bluetooth"
echo "[24] USB Avançado"
echo "[25] Jogos Suspeitos"
echo "[26] Apps de Risco"
echo "[27] Integridade"
echo "[28] Relatório Premium"
echo "[29] Resumo"
echo "[30] Tela"
echo "[31] Câmera"
echo "[32] Áudio"
echo "[33] Sensores Avançados"
echo "[34] Conectividade"
echo "[35] Relatório Técnico"
echo "[36] Diagnóstico"
echo "[37] Pontuação"
echo "[38] Exportar Relatório"
echo
echo "[0] Sair"
echo

read -p "Escolha uma opção: " op

case "$op" in

00)
    bash modulos/mod00_olho_de_deus.sh
    ;;
01)
    clear
    echo
    echo "[*] Executando auditoria completa..."
    echo

    for arq in modulos/mod*.sh
    do
        [[ "$arq" == "modulos/mod00_olho_de_deus.sh" ]] && continue
        [[ "$arq" == *backup* ]] && continue
        [[ "$arq" == *erro* ]] && continue

        echo "Executando: $(basename "$arq")"
        bash "$arq"
        echo
    done
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

08)
    bash modulos/mod06_armazenamento.sh
    ;;

09)
    bash modulos/mod07_processos.sh
    ;;

10)
    bash modulos/mod08_seguranca.sh
    ;;

11)
    bash modulos/mod09_suspeitos.sh
    ;;

12)
    bash modulos/mod11_bateria.sh
    ;;

13)
    bash modulos/mod12_ram.sh
    ;;

14)
    bash modulos/mod13_rede.sh
    ;;

15)
    bash modulos/mod14_relatorio.sh
    ;;

16)
    bash modulos/mod15_rede_avancada.sh
    ;;

17)
    bash modulos/mod16_wifi.sh
    ;;

18)
    bash modulos/mod17_sensores.sh
    ;;

19)
    bash modulos/mod18_cpu.sh
    ;;

20)
    bash modulos/mod19_armazenamento_avancado.sh
    ;;

21)
    bash modulos/mod20_seguranca_sistema.sh
    ;;

22)
    bash modulos/mod22_wifi.sh
    ;;

23)
    bash modulos/mod23_bluetooth.sh
    ;;

24)
    bash modulos/mod24_usb_avancado.sh
    ;;

25)
    bash modulos/mod25_jogos_suspeitos.sh
    ;;

26)
    bash modulos/mod26_apps_risco.sh
    ;;

27)
    bash modulos/mod27_integridade.sh
    ;;

28)
    bash modulos/mod28_relatorio_premium.sh
    ;;

29)
    bash modulos/mod29_resumo.sh
    ;;

30)
    bash modulos/mod31_tela.sh
    ;;

31)
    bash modulos/mod32_camera.sh
    ;;

32)
    bash modulos/mod33_audio.sh
    ;;

33)
    bash modulos/mod34_sensores_avancados.sh
    ;;

34)
    bash modulos/mod35_conectividade.sh
    ;;

35)
    bash modulos/mod36_relatorio_tecnico.sh
    ;;

36)
    bash modulos/mod37_diagnostico.sh
    ;;

37)
    bash modulos/mod38_pontuacao.sh
    ;;

38)
    bash modulos/mod39_exportar_relatorio.sh
    ;;

0)
    echo
    echo "Saindo..."
    exit 0
    ;;

*)
    echo
    echo "Opção inválida!"
    ;;
esac

echo
read -p "Pressione ENTER para continuar..."

done
