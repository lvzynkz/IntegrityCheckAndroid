#!/data/data/com.termux/files/usr/bin/bash

# ==================================================
#  INSTALADOR OFICIAL - INTEGRITY CHECK ANDROID
#  Otimizado | Completo | Todas as permissões
# ==================================================

# --------------------------
# CONFIGURAÇÃO DE CORES
# --------------------------
VERDE="\033[1;32m"
VERMELHO="\033[1;31m"
AMARELO="\033[1;33m"
CIANO="\033[1;36m"
BRANCO="\033[1;37m"
RESET="\033[0m"

# --------------------------
# FUNÇÕES AUXILIARES
# --------------------------
sucesso() { echo -e "${VERDE}[✓] $1${RESET}"; }
aviso()   { echo -e "${AMARELO}[!] $1${RESET}"; }
erro()    { echo -e "${VERMELHO}[✗] ERRO: $1${RESET}"; }
linha()   { echo "========================================"; }

# --------------------------
# INÍCIO
# --------------------------
clear
linha
echo -e "${CIANO}     INSTALADOR INTEGRITY CHECK${RESET}"
linha
echo

# 🔍 VERIFICA SE ESTÁ NO TERMUX
if [ ! -d /data/data/com.termux ]; then
    erro "Este instalador funciona APENAS no Termux!"
    exit 1
fi
sucesso "Ambiente Termux confirmado"
sleep 0.5

# 📦 ATUALIZAR REPOSITÓRIOS E SISTEMA
echo
aviso "Atualizando pacotes do sistema... (aguarde)"
pkg update -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" > /dev/null 2>&1
pkg upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" > /dev/null 2>&1
sucesso "Sistema atualizado"

# ⚙️ INSTALAR PACOTES ESSENCIAIS
echo
aviso "Instalando ferramentas necessárias..."
for pacote in bash termux-tools coreutils findutils; do
    if ! pkg install -y "$pacote" > /dev/null 2>&1; then
        aviso "Pacote $pacote já instalado ou ignorado"
    fi
done
sucesso "Todas as ferramentas prontas"

# 📂 LIBERAR PERMISSÃO DE ARMAZENAMENTO
echo
aviso "Solicitando permissão de acesso aos arquivos..."
echo -e "${AMARELO}👉 Quando aparecer a janela, clique em PERMITIR${RESET}"
sleep 2
termux-setup-storage
sleep 3

if [ -d /sdcard ] && [ -r /sdcard ]; then
    sucesso "Permissão de armazenamento CONCEDIDA"
else
    aviso "Permissão NÃO foi concedida. Algumas funções podem não funcionar!"
    aviso "Para corrigir depois execute: termux-setup-storage"
fi

# 📁 CRIAR PASTA DE INSTALAÇÃO
DIR_INSTALACAO="$HOME/IntegrityCheck-Android"
echo
aviso "Preparando diretório de instalação..."
mkdir -p "$DIR_INSTALACAO"
sucesso "Pasta criada/atualizada em: $DIR_INSTALACAO"

# 📤 COPIAR TODOS OS ARQUIVOS (INCLUSIVE OCULTOS)
echo
aviso "Copiando todos os arquivos do projeto..."
shopt -s dotglob 2>/dev/null
cp -rf ./* "$DIR_INSTALACAO/" 2>/dev/null
cp -rf ./.[!.]* "$DIR_INSTALACAO/" 2>/dev/null
shopt -u dotglob 2>/dev/null
sucesso "Todos os arquivos copiados com sucesso"

# 🔐 👇 AQUI É ONDE APLICA TODAS AS PERMISSÕES DE VERDADE 👇
echo
aviso "Aplicando TODAS as permissões necessárias..."

# → Permissão total de leitura, gravação e execução para TUDO dentro da pasta
chmod -R 777 "$DIR_INSTALACAO"
# → Garante que todos os arquivos .sh sejam EXECUTÁVEIS obrigatoriamente
find "$DIR_INSTALACAO" -type f -name "*.sh" -exec chmod +x {} \;
# → Ajusta dono e grupo (evita bloqueios de permissão no Android)
chown -R "$(id -u):$(id -g)" "$DIR_INSTALACAO" 2>/dev/null
# → Corrige permissões de pastas e arquivos de forma separada e segura
find "$DIR_INSTALACAO" -type d -exec chmod 777 {} \;
find "$DIR_INSTALACAO" -type f -exec chmod 666 {} \;
find "$DIR_INSTALACAO" -type f -name "*.sh" -exec chmod 777 {} \;

sucesso "TODAS AS PERMISSÕES FORAM APLICADAS"
sleep 0.8

# ✅ FINALIZAÇÃO
clear
linha
echo -e "${VERDE}✅ INSTALAÇÃO CONCLUÍDA COM SUCESSO ✅${RESET}"
linha
echo
echo -e "${BRANCO}📂 Local da instalação:${RESET}"
echo "   $DIR_INSTALACAO"
echo
echo -e "${BRANCO}🚀 Para executar agora, digite os comandos abaixo:${RESET}"
echo
echo -e "${CIANO}cd $DIR_INSTALACAO${RESET}"
echo -e "${CIANO}bash integrity.sh${RESET}"
echo
echo -e "${AMARELO}💡 Dica: na próxima vez basta digitar só o comando acima${RESET}"
linha
echo
exit 0

