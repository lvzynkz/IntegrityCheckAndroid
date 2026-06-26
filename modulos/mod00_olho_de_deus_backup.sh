#!/data/data/com.termux/files/usr/bin/bash

while true
do
clear

echo "===================================="
echo "       OLHO DE DEUS CAPIVARA"
echo "===================================="
echo ""

echo "Abrindo tela de inicializacao..."
sleep 1

termux-open-url "https://lvzynkz.github.io/-integritycheck-android/"

echo ""
echo "Visualize a pagina e volte para o Termux."
read -p "Pressione ENTER para continuar..."

clear

echo "===================================="
echo "       SISTEMA CARREGANDO"
echo "===================================="
echo ""

for i in 10 20 30 40 50 60 70 80 90 100
do
    printf "\rCarregando: [%-10s] %d%%" "$(printf '#%.0s' $(seq 1 $((i/10))))" "$i"
    sleep 0.15
done

echo ""
echo ""
echo "SISTEMA OLHO DE DEUS CAPIVARA - ATIVO"
sleep 1

while true
do
    clear

    echo "===================================="
    echo "         OLHO DE DEUS"
    echo "===================================="
    echo ""
    echo "[001] Detector de Cheats"
    echo "[002] Detector de Bypass"
    echo "[003] Anticheat"
    echo ""
    echo "[999999] EXECUTAR TUDO"
    echo "[0] VOLTAR"
    echo ""

    read -p "Escolha: " op

    case "$op" in

        1|001)
            clear
            python modulos/detector_cheat.py
            read -p "ENTER para voltar..."
            ;;

        2|002)
            clear
            python modulos/detector_bypass.py
            read -p "ENTER para voltar..."
            ;;

        3|003)
            clear
            python modulos/anticheat.py
            read -p "ENTER para voltar..."
            ;;

        999999)
            clear

            echo "[1/4] Detector de Cheats"
            python modulos/detector_cheat.py

            echo ""
            echo "[2/4] Detector de Bypass"
            python modulos/detector_bypass.py

            echo ""
            echo "[3/4] Anticheat"
            python modulos/anticheat.py

            echo ""
            echo "[4/4] Rotina Completa"

            if [ -f modulos/executar_tudo.py ]; then
                python modulos/executar_tudo.py
            fi

            echo ""
            echo "[✓] Varredura concluida!"
read -p "⏎ Pressione ENTER para continuar..."

clear
echo "===================================================="
echo "🦫        SUPERVISOR SS CAPIVARA        🦫"
echo "===================================================="
echo
echo "📋 INFORMAÇÕES COMPLEMENTARES DO SISTEMA"
echo
echo "🔹 DESENVOLVIMENTO E EQUIPE"
echo "Este scanner foi totalmente desenvolvido pelo SPV SS CAPIVARA,"
echo "com apoio técnico, estrutura e colaboração integral da equipe"
echo "Scan Blackout. Todo o código, algoritmos e funcionalidades são"
echo "resultado de desenvolvimento próprio, exclusivo e contínuo."
echo
echo "🔹 STATUS DO PROJETO"
echo "Sistema em fase de desenvolvimento (versão BETA)."
echo "Estamos implementando melhorias constantes, ampliando tipos de"
echo "auditoria, aumentando a precisão e otimizando o desempenho para"
echo "entregar sempre resultados mais seguros, rápidos e completos."
echo
echo "🔹 DIRETRIZES DE USO E SEGURANÇA"
echo "• Uso restrito e autorizado apenas para finalidades definidas;"
echo "• Proibida engenharia reversa, alteração ou cópia do código fonte;"
echo "• Proibida redistribuição, compartilhamento ou reprodução sem permissão;"
echo "• Todos os dados analisados e resultados gerados são confidenciais;"
echo "• Qualquer uso fora do permitido deve ser comunicado previamente."
echo
echo "🔹 AUTORIA E PROPRIEDADE INTELECTUAL"
echo "Todo o conteúdo, estrutura, lógica e identidade visual pertencem"
echo "exclusivamente ao SPV SS CAPIVARA e à comunidade Scan Blackout."
echo "Nenhuma parte pode ser apropriada ou utilizada sem reconhecimento."
echo
echo "🔹 BASE LEGAL COMPLETA"
echo "• Lei nº 9.609/1998 – Proteção de programas de computador e direitos autorais;"
echo "• Lei nº 13.709/2018 (LGPD) – Tratamento seguro e lícito de dados;"
echo "• Lei nº 12.527/2011 – Regulamentação de acesso e sigilo de informações;"
echo "• Lei nº 11.638/2007 – Normas técnicas e responsabilidade em auditorias;"
echo "• Código Penal Brasileiro – Artigos 184, 187 e 325 – Sanções para violação"
echo "  de sigilo, propriedade intelectual e uso indevido de sistemas."
echo
echo "🔹 REGRAS DE AUTORIZAÇÃO"
echo "Se precisar utilizar o sistema para novas finalidades, compartilhar"
echo "ou realizar ajustes, **é obrigatório solicitar autorização formal"
echo "antes ao SPV SS CAPIVARA**. O uso sem aviso prévio configura infração"
echo "sujeita a medidas legais cabíveis."
echo
echo "🔹 SUPORTE E ATUALIZAÇÕES"
echo "Para dúvidas, relatar problemas, solicitar testes ou receber versões"
echo "mais recentes, entre em contato diretamente:"
echo "• Mensagem privada com o responsável: SPV SS CAPIVARA;"
echo "• Acesso ao servidor oficial da comunidade via Discord."
echo
echo "===================================================="
echo
read -p "⏎ Pressione ENTER para prosseguir..."

clear
echo "===================================================="
echo "🔥          RECOMENDAÇÃO ESPECIAL          🔥"
echo "===================================================="
echo
echo "💡 POR QUE ESCOLHER O SCAN BLACKOUT?"
echo
echo "✅ Auditorias completas e seguras"
echo "✅ Sistema em evolução constante"
echo "✅ Suporte direto com o desenvolvedor"
echo "✅ Ambiente organizado e confidencial"
echo "✅ Novas ferramentas sendo adicionadas sempre"
echo
echo "🚀 VEM FAZER PARTE DA NOSSA COMUNIDADE!"
echo "Aqui você encontra o que há de melhor em análise,"
echo "segurança e desempenho. Não fique de fora!"
echo
echo "👉 VEM PARA O SCAN BLACKOUT 👈"
echo "Juntos vamos chegar ainda mais longe!"
echo
echo "===================================================="
echo
echo "⏳ Carregando tela final em 10 segundos..."
sleep 10

am start \
-a android.intent.action.VIEW \
-d file:///storage/emulated/0/Download/scanblackout.png \
-t image/png >/dev/null 2>&1

sleep 5

am start \
-n com.termux/.HomeActivity >/dev/null 2>&1

clear
echo ""
echo "========================================"
echo "      SCAN BLACKOUT FINALIZADO"
echo "========================================"
echo ""
echo "🦫 Obrigado por utilizar o sistema."
echo "🔥 Comunidade Scan Blackout"
echo "🔒 Uso controlado e sigiloso"
echo ""
echo "✅ Sessão encerrada com segurança."
echo ""

sleep 3

clear

echo -e "\033[1;36m"
echo "=========================================================="
echo "              INTEGRITY CHECK ANDROID"
echo "=========================================================="
echo
echo "               OBRIGADO POR UTILIZAR"
echo
echo "Este sistema recebeu reestruturação, melhorias e ajustes"
echo "técnicos realizados pela equipe scanblackout."
echo
echo "Criador Oficial do Projeto: spv ss capivara"
echo
echo "Importante: Este trabalho consiste em melhoria, adaptação"
echo "e otimização de estrutura existente, não se configurando"
echo "como criação autoral original da equipe de ajustes,"
echo "respeitando‑se integralmente a origem e os direitos"
echo "pertencentes ao seu criador."
echo
echo "🔍 Sobre o scanblackout:"
echo "Para ter acesso e utilizar a funcionalidade, basta"
echo "solicitar diretamente no PV: spv ss capivara"
echo
echo "⚠️ AVISOS OBRIGATÓRIOS DE USO:"
echo "• Se for utilizar este sistema para cálculo de calorias"
echo "  ou qualquer outra finalidade específica, é obrigatório"
echo "  comunicar‑nos antecipadamente."
echo "• Se for aplicar, compartilhar ou usar este recurso com"
echo "  qualquer pessoa, também é obrigatório nos avisar com"
echo "  antecedência e obter a devida permissão."
echo
echo -e "\033[1;33m⚠️ Aviso importante: Todo o conteúdo deste sistema tem caráter apenas informativo e educativo, não constituindo qualquer tipo de aconselhamento profissional, técnico, jurídico, financeiro ou de saúde. O uso das informações aqui disponibilizadas é de responsabilidade exclusiva do usuário. Não nos responsabilizamos por eventuais danos, perdas ou consequências decorrentes deste uso.\033[0m"
echo
echo "=========================================================="
echo
echo -e "\033[1;31m⚠️  AVISO LEGAL — LEI DE DIREITOS AUTORAIS Nº 9.610/98\033[0m"
echo
echo "Todo o conteúdo, estrutura, lógica, funcionalidades e"
echo "linhas de código que compõem o Integrity Check Android"
echo "são protegidos por Lei Federal de Direitos Autorais e"
echo "normas de propriedade intelectual vigentes no Brasil."
echo
echo "É EXPRESSAMENTE PROIBIDO, sob pena das sanções legais"
echo "cabíveis: reproduzir, copiar, distribuir, compartilhar,"
echo "modificar, adaptar, revender ou utilizar este sistema"
echo "no todo ou em parte, sem a autorização formal, escrita"
echo "e emitida diretamente pelos responsáveis legais e pelo"
echo "seu criador oficial."
echo
echo "Qualquer cópia, divulgação ou uso indevido efetuado sem"
echo "a devida liberação será considerada infração legal, e"
echo "resultará imediatamente nas medidas judiciais cabíveis,"
echo "inclusive processo por danos morais e materiais, com"
echo "todas as consequências legais previstas em lei."
echo
echo "O respeito ao trabalho alheio e aos direitos autorais"
echo "não é só uma obrigação legal, mas um princípio ético"
echo "que garante o desenvolvimento seguro e justo de todo"
echo "e qualquer projeto."
echo
echo -e "\033[1;36m=========================================================="
echo
echo "Agradecemos sinceramente por utilizar e fazer parte"
echo "deste projeto. Nosso compromisso é sempre entregar"
echo "qualidade, segurança e seriedade em cada detalhe,"
echo "preservando o trabalho construído com dedicação e"
echo "respeitando todas as regras legais e éticas que regem"
echo "o desenvolvimento e a utilização de sistemas."
echo
echo "Contamos com a sua colaboração para manter este"
echo "espaço seguro, confiável e dentro da lei."
echo
echo "=========================================================="
echo -e "\033[0m"

echo
read -p "Pressione ENTER para finalizar..."

clear

echo
echo "Encerrando o Integrity Check Android..."
sleep 1
echo "Até a próxima!"
sleep 1
exit 0


esac

done

done

