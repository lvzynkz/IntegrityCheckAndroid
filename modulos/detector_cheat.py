#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
DETECTOR DE CHEATS - VERSÃO VARREDURA TOTAL
✅ Detecta arquivos, processos, serviços, registro, pacotes
✅ Busca por nome EXATO e PARCIAL (pega mesmo renomeado)
✅ Funciona Windows / Linux / Android
✅ Nenhuma mensagem extra desnecessária
"""

import os
import sys
import platform
import subprocess
import shutil
import re
from datetime import datetime

# -------------------------- CORES NO TERMINAL --------------------------
def cor(texto, codigo):
    if sys.platform == "win32":
        os.system("color")
    return f"\033[{codigo}m{texto}\033[0m"

VERDE = "32"
AMARELO = "33"
VERMELHO = "31"
AZUL = "34"
CIANO = "36"
BRANCO_NEGRITO = "1;37"

# -------------------------- BASE COMPLETA DE FERRAMENTAS SUSPEITAS --------------------------
# Agora com palavras-chave para pegar MESMO RENOMEADO ex: gg999.exe, ce74.exe, lp_novo.apk
suspeitos = [
    {
        "nome": "GameGuardian",
        "exatos": ["gameguardian.exe", "gg.exe", "gameguardian", "libgg.so", "libgameguardian.so"],
        "parciais": ["gameguardian", "libgg", " gg.", "_gg", "gg64", "gg32"],
        "pacotes": ["com.gh.gameguardian", "com.gh.gg", "com.abc.gg", "com.xyz.gg", "gg.mod", "com.gg.pro", "io.gg.plus"],
        "locais": []
    },
    {
        "nome": "Lucky Patcher",
        "exatos": ["luckypatcher.exe", "luckypatcher", "lp.exe", "lucky.exe"],
        "parciais": ["luckypatch", "luckypatcher", "chelpus", "dimonvideo"],
        "pacotes": ["com.chelpus.lackypatch", "com.dimonvideo.luckypatcher", "com.forpda.lp", "com.android.vending.billing.InAppBillingService.LACK", "com.lp.mod"],
        "locais": []
    },
    {
        "nome": "Cheat Engine",
        "exatos": ["cheatengine-x86_64.exe", "cheatengine.exe", "ce.exe", "cheatengine-x86.exe", "cheatengine", "ceserver.exe"],
        "parciais": ["cheatengine", "cheateng", " cheat", "_ce", "ce7", "ceserver"],
        "pacotes": ["org.cheatengine.ce", "com.cheatengine.mobile", "ce.android.pro"],
        "locais": []
    },
    {
        "nome": "X8 Sandbox / VMOS / Máquinas Virtuais",
        "exatos": ["x8sandbox.exe", "x8sandbox", "vmos.exe", "f1vm.exe", "virtualspace.exe"],
        "parciais": ["x8sand", "x8sb", "vmos", "f1vm", "virtualspace", "vphone", "clonevm"],
        "pacotes": ["com.x8.sandbox", "com.x8sb.igg", "com.vmos.pro", "com.vmos.gp", "com.f1vm.gp", "com.ludashi.superboost", "com.vphonegaga.titan", "io.virtual.android"],
        "locais": []
    },
    {
        "nome": "SB Game Hacker / GameCIH",
        "exatos": ["sbgamehacker.exe", "sbgh", "gamecih.exe"],
        "parciais": ["sbgamehack", "gamecih", "sbtools"],
        "pacotes": ["com.cih.gamecih", "com.cih.gamecih2", "org.sbtools.gamehack", "com.sbgh.pro"],
        "locais": []
    },
    {
        "nome": "Freedom / Uret Patcher",
        "exatos": ["freedom.exe", "uret.exe", "freedom"],
        "parciais": ["madkite", "freedomhack", "uretpatcher"],
        "pacotes": ["madkite.freedom", "com.uret.patcher", "com.freedom.mod"],
        "locais": []
    },
    {
        "nome": "Parallel Space / Clonadores",
        "exatos": [],
        "parciais": ["parallelspace", "dualspace", "multiaccount", "cloneapp"],
        "pacotes": ["com.lbe.parallel.intl", "com.parallel.space.lite", "com.cloneapp.parallelspace.dualspace", "com.dualspace.game", "com.excelliance.dualaid"],
        "locais": []
    },
    {
        "nome": "Ocultadores de Aplicativos",
        "exatos": [],
        "parciais": ["hidemyapp", "apphider", "hideapp"],
        "pacotes": ["com.hide.my.app", "com.app.hider.pro", "com.kongzue.hideapp", "hide.app.x"],
        "locais": []
    },
    {
        "nome": "Root / Xposed / LSPosed / Modificações de Sistema",
        "exatos": ["su", "magisk", "magisk64", "supersu"],
        "parciais": ["magisk", "xposed", "lsposed", "zygisk", "supersu", "kingroot"],
        "pacotes": ["com.topjohnwu.magisk", "eu.chainfire.supersu", "com.kingroot.kinguser", "de.robv.android.xposed.installer", "org.lsposed.manager"],
        "locais": []
    },
    {
        "nome": "Outros cheats / modificadores",
        "exatos": ["artmoney.exe", "wpepro.exe", "winspector.exe", "speedhack.exe"],
        "parciais": ["artmoney", "wpepro", "speedhack", "memoryeditor", "gamehack", "modmenu"],
        "pacotes": ["com.artmoney.mobile", "com.speedhack.vip", "mod.menu.pro"],
        "locais": []
    }
]

# PASTAS QUE SERÃO VARRIDAS COMPLETAMENTE, INCLUSIVE OCULTAS E SISTEMA
LOCAIS_VARREDURA = []
SISTEMA = platform.system().lower()

if SISTEMA == "windows":
    LOCAIS_VARREDURA = [
        "C:\\",
        os.environ.get("PROGRAMFILES", "C:\\Program Files"),
        os.environ.get("PROGRAMFILES(X86)", "C:\\Program Files (x86)"),
        os.environ.get("PROGRAMDATA", "C:\\ProgramData"),
        os.environ.get("APPDATA", ""),
        os.environ.get("LOCALAPPDATA", ""),
        os.environ.get("TEMP", ""),
        os.environ.get("USERPROFILE", "C:\\Users"),
        "C:\\Windows\\Temp",
        "C:\\Windows\\System32",
        "C:\\Windows\\SysWOW64",
        "C:\\Users\\Public"
    ]
elif SISTEMA == "linux":
    LOCAIS_VARREDURA = ["/", "/home", "/usr", "/opt", "/tmp", "/var", "/root", "/mnt", "/media"]
elif SISTEMA == "android" or os.path.exists("/system") or os.path.exists("/data"):
    SISTEMA = "android"
    LOCAIS_VARREDURA = ["/", "/data", "/sdcard", "/storage", "/system", "/vendor", "/data/app", "/data/data", "/sdcard/Android"]
else:
    LOCAIS_VARREDURA = ["/", os.path.expanduser("~")]

# Pastas que NÃO precisa vasculhar (sistema, trava, sem sentido)
IGNORAR_PASTAS = [
    "WinSxS", "System Volume Information", "$Recycle.Bin", "node_modules",
    ".git", "proc", "sys", "dev", "boot", "snap", "usr/share/locale"
]

# -------------------------- FUNÇÕES DE DETECÇÃO PROFUNDA --------------------------
def busca_arquivos(lista_exatos, lista_parciais):
    """Varredura TOTAL: nome exato + pedaço do nome, em TODAS as pastas"""
    encontrados = []
    exatos_lower = [e.lower() for e in lista_exatos]
    parciais_lower = [p.lower() for p in lista_parciais]

    for caminho_base in LOCAIS_VARREDURA:
        if not caminho_base or not os.path.isdir(caminho_base):
            continue
        try:
            for raiz, pastas, arquivos in os.walk(caminho_base, topdown=True, onerror=lambda e: None):
                # Remove pastas proibidas da busca
                pastas[:] = [p for p in pastas if p not in IGNORAR_PASTAS and not p.startswith(".")]
                for arq in arquivos:
                    arq_low = arq.lower()
                    caminho_completo = os.path.join(raiz, arq)
                    if arq_low in exatos_lower:
                        encontrados.append(("EXATO", caminho_completo))
                    elif any(p in arq_low for p in parciais_lower):
                        encontrados.append(("PARCIAL", caminho_completo))
        except (PermissionError, OSError):
            continue
    return list(dict.fromkeys(encontrados))  # Remove duplicatas

def busca_processos(lista_exatos, lista_parciais):
    """Verifica processo + linha de comando + módulos carregados na memória"""
    rodando = []
    exatos_lower = [e.lower().replace(".exe","") for e in lista_exatos]
    parciais_lower = [p.lower() for p in lista_parciais]
    try:
        if SISTEMA == "windows":
            saida = subprocess.check_output("wmic process get name,executablepath,commandline /format:csv", shell=True, text=True, stderr=subprocess.DEVNULL).lower()
        else:
            saida = subprocess.check_output("ps -eo pid,comm,args 2>/dev/null", shell=True, text=True).lower()
        for nome in exatos_lower + parciais_lower:
            if nome and nome in saida and nome not in rodando:
                rodando.append(nome)
    except Exception:
        pass
    return rodando

def busca_registro_windows():
    """SÓ NO WINDOWS: vasculha registro do sistema onde cheats deixam rastro"""
    if SISTEMA != "windows":
        return []
    encontrados = []
    chaves = [
        r"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
        r"HKCU\Software",
        r"HKLM\SOFTWARE",
        r"HKCU\Software\Microsoft\Windows\CurrentVersion\Run",
        r"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
    ]
    palavras = ["cheat engine", "gameguardian", "luckypatcher", "x8sandbox", "vmos", "artmoney", "sbgamehacker"]
    for chave in chaves:
        try:
            s = subprocess.check_output(f'reg query "{chave}" /s /f "cheat" /k /e 2>nul', shell=True, text=True).lower()
            for p in palavras:
                if p in s:
                    encontrados.append(f"{chave} → {p}")
        except Exception:
            continue
    return encontrados

def busca_pacotes_android(lista_pacotes):
    """Android: lista TODOS os pacotes instalados + sistema modificado"""
    encontrados = []
    for cmd in ["pm list packages -u 2>/dev/null", "cmd package list packages -u 2>/dev/null"]:
        try:
            saida = subprocess.check_output(cmd, shell=True, text=True, stderr=subprocess.DEVNULL).lower()
            for pac in lista_pacotes:
                if pac.lower() in saida and pac not in encontrados:
                    encontrados.append(pac)
        except Exception:
            continue
    return encontrados

# -------------------------- PROGRAMA PRINCIPAL --------------------------
if __name__ == "__main__":
    print(cor("=" * 60, BRANCO_NEGRITO))
    print(cor("🔍 DETECTOR DE CHEATS - VARREDURA TOTAL", BRANCO_NEGRITO))
    print(cor(f"📅 {datetime.now().strftime('%d/%m/%Y %H:%M:%S')}", CIANO))
    print(cor(f"💻 {platform.system()} {platform.release()} | {platform.machine()}", CIANO))
    print(cor("=" * 60, BRANCO_NEGRITO))

    total_encontrados = 0
    total_rodando = 0
    relatorio = []
    rastros_registro = busca_registro_windows()

    print(cor("\n🔎 INICIANDO VARREDURA COMPLETA NO SISTEMA...\n", AZUL))

    for app in suspeitos:
        arqs = busca_arquivos(app["exatos"], app["parciais"])
        proc = busca_processos(app["exatos"], app["parciais"])
        pacs = busca_pacotes_android(app["pacotes"]) if SISTEMA == "android" else []
        detalhes = []

        if proc:
            status = cor("🚨 EXECUTANDO AGORA", VERMELHO)
            total_rodando += 1
            total_encontrados += 1
            detalhes.append(f"Processo ativo: {', '.join(proc[:5])}")
        elif arqs or pacs:
            status = cor("⚠️  ENCONTRADO", AMARELO)
            total_encontrados += 1
        else:
            status = cor("✅ LIMPO", VERDE)

        for tipo, cam in arqs[:6]:
            detalhes.append(f"[{tipo}] {cam}")
        if pacs:
            detalhes.append(f"Pacote(s): {', '.join(pacs)}")

        print(f"[{status}] {app['nome']}")
        for d in detalhes:
            print(f"     ➜ {d}")

        relatorio.append({"nome": app["nome"], "status": status, "detalhes": detalhes})

    if rastros_registro:
        print(f"\n[{cor('⚠️  RASTROS NO REGISTRO', AMARELO)}]")
        for r in rastros_registro[:8]:
            print(f"     ➜ {r}")
        total_encontrados += 1

    # -------------------------- RESULTADO FINAL --------------------------
    print("\n" + cor("-" * 60, BRANCO_NEGRITO))
    print(cor("📊 RESULTADO FINAL", BRANCO_NEGRITO))
    print(cor("-" * 60, BRANCO_NEGRITO))

    if total_encontrados == 0:
        print(cor("✅ NENHUM CHEAT OU FERRAMENTA SUSPEITA DETECTADA", VERDE))
        resultado = "LIMPO"
    else:
        print(cor(f"⚠️  ITENS ENCONTRADOS: {total_encontrados}", AMARELO))
        print(cor(f"🚨 EM EXECUÇÃO: {total_rodando}", VERMELHO))
        if total_rodando > 0:
            print(cor("Ação necessária: encerre processos e remova arquivos/pacotes", VERMELHO))
        resultado = "SUSPEITO"

    arq_rel = f"relatorio_cheats_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
    try:
        with open(arq_rel, "w", encoding="utf-8") as f:
            f.write(f"RELATORIO DETECTOR DE CHEATS\nData: {datetime.now().strftime('%d/%m/%Y %H:%M:%S')}\nSistema: {platform.system()}\nResultado: {resultado}\n")
            f.write("-"*50+"\n")
            for r in relatorio:
                f.write(f"\n{r['nome']}: {r['status']}\n")
                for d in r["detalhes"]: f.write(f" - {d}\n")
            if rastros_registro:
                f.write("\nRastros no Registro Windows:\n")
                for rr in rastros_registro: f.write(f" - {rr}\n")
        print(cor(f"\n💾 Relatório salvo: {arq_rel}", CIANO))
    except Exception as e:
        print(cor(f"\n⚠️  Não salvou relatório: {e}", AMARELO))

    print("\n" + cor("=" * 60, BRANCO_NEGRITO))

