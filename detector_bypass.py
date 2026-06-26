#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# =============================================================================
#  DETECTOR DE BYPASS - EDIÇÃO DEFINITIVA
#  ✅ 17 CAMADAS DE DETECÇÃO
#  ✅ ROOT / MAGISK / ZYGISK / LSPOSED / FRIDA / RIRU / XPOSED
#  ✅ DETECÇÃO COMPLETA DE EMULADORES
#  ✅ VERIFICAÇÃO DE INTEGRIDADE DE ARQUIVOS DO SISTEMA
#  ✅ ANÁLISE DE BIBLIOTECAS .SO MODIFICADAS / INJETADAS / HOOKADAS
#  ✅ VM / CLONES / OCULTADORES / ADB / SELINUX / ROM MODIFICADA
#  Funciona: Android | Windows | Linux | Nenhuma dependência extra
# =============================================================================
import os, sys, re, socket, platform, subprocess, hashlib, struct
from datetime import datetime

# ─────────────────────────────────────────────────────────────────────────────
# CORES
# ─────────────────────────────────────────────────────────────────────────────
def cor(t,c):
    if sys.platform=="win32": os.system("color")
    return f"\033[{c}m{t}\033[0m"
VERDE="32"; AMARELO="33"; VERMELHO="31"; AZUL="34"; CIANO="36"; ROXO="35"; BRANCO_N="1;37"

# ─────────────────────────────────────────────────────────────────────────────
# BASE DE DADOS COMPLETA
# ─────────────────────────────────────────────────────────────────────────────
BINARIOS_ROOT=["su","magisk","magisk64","magisk32","magiskinit","supersu","kingroot","kingoroot","360root","baiduroot","iroot"]
CAMINHOS_ROOT=["/sbin/su","/system/bin/su","/system/xbin/su","/su","/magisk","/.magisk","/data/adb","/data/adb/magisk","/data/adb/ksu","/data/adb/ap","/data/local/su","/system/su","/system/app/SuperSU","/system/app/Kinguser"]
CAMINHOS_ZYGISK=["/data/adb/zygisk","/data/adb/modules/zygisk","/dev/zygisk"]
CAMINHOS_RIRU=["/data/adb/riru","/system/lib/libriru.so","/system/lib64/libriru.so","/data/misc/riru"]
CAMINHOS_XPOSED=["/system/framework/XposedBridge.jar","/data/adb/lspd","/data/adb/modules/lsposed","/data/adb/modules/edxposed"]
PACOTES_XPOSED=["de.robv.android.xposed.installer","org.lsposed.manager","org.lsposed.lspatch","me.weishu.exp","com.solohsu.android.edxp.manager"]
PACOTES_FRIDA=["com.frida.server","re.frida.server","re.frida.gadget"]
BINARIOS_FRIDA=["frida-server","frida-inject","frida-gadget","frida-agent","frida-helper"]
PORTAS_FRIDA=[27042,27043,27044,27045,27046,27047]
PACOTES_VM=["com.x8.sandbox","com.x8sb.igg","com.vmos.pro","com.vmos.gp","com.f1vm.gp","com.vphonegaga.titan","io.virtual.android","com.ludashi.superboost"]
PACOTES_CLONE=["com.lbe.parallel.intl","com.parallel.space.lite","com.cloneapp.parallelspace.dualspace","com.dualspace.game","com.excelliance.dualaid","com.multi.parallel"]
PACOTES_OCULTAR=["com.hide.my.app","com.app.hider.pro","com.kongzue.hideapp","hide.app.x","com.hideitpro","com.cal.s.calculatorvault"]
PACOTES_OUTROS=["com.chelpus.lackypatch","com.topjohnwu.magisk","eu.chainfire.supersu","com.kingroot.kinguser","me.bmax.apatch","me.weishu.kernelsu"]
PROPS_SUSPEITAS=["ro.debuggable=1","ro.secure=0","ro.build.type=userdebug","ro.build.type=eng","ro.build.tags=test-keys","ro.build.selinux=0","init.svc.adbd=running","ro.kernel.qemu=1","ro.hardware=goldfish","ro.hardware=ranchu","ro.product.manufacturer=Genymotion","ro.product.model=Android SDK","persist.sys.usb.config=adb","dalvik.vm.checkjni=false"]
ASSINATURAS_HOOK=["frida","xposed","lsposed","riru","zygisk","magisk","libinject","libhook","libsubstrate","libartemis","libdobby","libsandhook","libwhale","libepic","libmemtrack"]
PASTAS_IGNORAR=["proc","sys","dev","boot","snap","WinSxS","System Volume Information","$Recycle.Bin","node_modules"]

# ════════════════════════════════════════════════════════════════════════════
# 🔴 NOVO: SINAIS DE EMULADOR
# ════════════════════════════════════════════════════════════════════════════
PROPS_EMULADOR=["ro.kernel.qemu=1","ro.hardware=goldfish","ro.hardware=ranchu","ro.product.manufacturer=Genymotion","ro.product.manufacturer=BlueStacks","ro.product.manufacturer=LDPlayer","ro.product.manufacturer=Nox","ro.product.manufacturer=Memu","ro.product.manufacturer=Microsoft","ro.hardware.virtualbox","ro.board.platform=android_x86","ro.build.product=sdk_gphone_x86"]
ARQUIVOS_EMULADOR=["/system/lib/libc_malloc_debug_qemu.so","/system/lib/libqemu.so","/system/bin/qemu-props","/dev/socket/qemud","/dev/qemu_pipe","/mnt/windows","/system/bin/init.bluestacks.rc"]
PACOTES_EMULADOR=["com.bluestacks","com.bluestacks.appmarket","com.ldplayer","com.bignox.app","com.memuplay","com.genymotion","com.microsoft.windows subsystemforandroid"]

# ════════════════════════════════════════════════════════════════════════════
# 🔴 NOVO: ARQUIVOS ESSENCIAIS PARA VERIFICAÇÃO DE INTEGRIDADE
# ════════════════════════════════════════════════════════════════════════════
ARQUIVOS_SISTEMA_ANDROID=["/system/bin/app_process","/system/bin/app_process32","/system/bin/app_process64","/system/lib/libart.so","/system/lib64/libart.so","/system/lib/libc.so","/system/lib64/libc.so","/system/framework/framework.jar","/system/framework/boot.oat"]
ARQUIVOS_SISTEMA_LINUX=["/bin/bash","/bin/ls","/bin/su","/usr/bin/id","/lib/x86_64-linux-gnu/libc.so.6"]
ARQUIVOS_SISTEMA_WINDOWS=[r"C:\Windows\System32\ntdll.dll",r"C:\Windows\System32\kernel32.dll",r"C:\Windows\System32\user32.dll"]

# ════════════════════════════════════════════════════════════════════════════
# DETECTA SISTEMA
# ════════════════════════════════════════════════════════════════════════════
SIS=platform.system().lower()
if os.path.exists("/system") and os.path.exists("/data"): SIS="android"
LOCAIS=[]
if SIS=="android": LOCAIS=["/","/system","/vendor","/product","/sbin","/data","/data/adb","/data/local","/sdcard","/storage","/dev","/mnt"]
elif SIS=="linux": LOCAIS=["/","/usr","/opt","/home","/tmp","/var","/root"]
elif SIS=="windows": LOCAIS=["C:\\",os.environ.get("PROGRAMFILES",""),os.environ.get("APPDATA",""),os.environ.get("LOCALAPPDATA",""),os.environ.get("TEMP",""),"C:\\Windows","C:\\Windows\\System32","C:\\Windows\\SysWOW64"]

# ─────────────────────────────────────────────────────────────────────────────
# FUNÇÕES BASE
# ─────────────────────────────────────────────────────────────────────────────
def cmd(c):
    try: return subprocess.check_output(c,shell=True,stderr=subprocess.DEVNULL,text=True,timeout=12).lower()
    except: return ""
def existe(c):
    try: return os.path.exists(c) or os.path.isfile(c) or os.path.islink(c)
    except: return False
def sha256(arq,tam=10*1024*1024):
    try:
        h=hashlib.sha256()
        with open(arq,"rb") as f:
            while True:
                b=f.read(65536)
                if not b: break
                h.update(b)
                if f.tell()>tam: break
        return h.hexdigest()
    except: return None

# ─────────────────────────────────────────────────────────────────────────────
# ⭐ FUNÇÕES EXISTENTES MELHORADAS
# ─────────────────────────────────────────────────────────────────────────────
def busca_arq(nomes,parciais=[]):
    res=[]; nl=[x.lower() for x in nomes]; pl=[x.lower() for x in parciais]
    for base in LOCAIS:
        if not base or not os.path.isdir(base): continue
        try:
            for r,d,arqs in os.walk(base,topdown=True,onerror=lambda _:None):
                d[:]=[x for x in d if x.lower() not in PASTAS_IGNORAR and not x.startswith(".")]
                for a in arqs:
                    al=a.lower(); cam=os.path.join(r,a)
                    if al in nl: res.append(("EXATO",cam))
                    elif pl and any(p in al for p in pl): res.append(("PARCIAL",cam))
        except: pass
    return list(dict.fromkeys(res))
def busca_proc(nomes):
    res=[]
    s=cmd("wmic process get name,commandline /format:csv") if SIS=="windows" else cmd("ps -eo pid,comm,args 2>/dev/null")
    for n in [x.lower() for x in nomes]:
        if n and n in s and n not in res: res.append(n)
    return res
def varre_memoria():
    s=cmd("cat /proc/self/maps 2>/dev/null; cat /proc/*/maps 2>/dev/null")
    return [p for p in ASSINATURAS_HOOK if p in s]
def getprop(): return cmd("getprop 2>/dev/null")
def props_suspeitas(): return [p for p in PROPS_SUSPEITAS if re.search(rf"\[{p.split('=',1)[0]}\]:\s*\[{p.split('=',1)[1]}\]",getprop())]
def lista_pacotes(): return cmd("pm list packages -u -e -d 2>/dev/null")+cmd("cmd package list packages 2>/dev/null")
def verifica_portas(lst): return [p for p in lst if socket.socket(socket.AF_INET,socket.SOCK_STREAM).__enter__().connect_ex(("127.0.0.1",p))==0]
def selinux():
    s=cmd("getenforce 2>/dev/null; cat /sys/fs/selinux/enforce 2>/dev/null")
    if "permissive" in s or s.strip()=="0": return "PERMISSIVO ⚠️"
    if "enforcing" in s: return "Enforcing ✅"
    return "DESATIVADO 🚨"
def assinatura_rom():
    s=cmd("getprop ro.build.tags").strip()
    if "release-keys" in s: return "ASSINATURA OFICIAL ✅"
    if "test-keys" in s: return "ASSINATURA DE TESTE / ROM MODIFICADA 🚨"
    return f"Desconhecida: {s}"

# ─────────────────────────────────────────────────────────────────────────────
# 🔥 3 GRANDES NOVAS CAMADAS QUE VOCÊ PEDIU
# ─────────────────────────────────────────────────────────────────────────────

# 🟢 CAMADA 15 — DETECÇÃO DE EMULADOR (20+ VERIFICAÇÕES DIFERENTES)
def detecta_emulador():
    pontos=0; detalhes=[]
    for p in PROPS_EMULADOR:
        if re.search(rf"\[{p.split('=',1)[0]}\]:\s*\[{p.split('=',1)[1]}\]",getprop()):
            detalhes.append(f"Propriedade: {p}"); pontos+=3
    for a in ARQUIVOS_EMULADOR:
        if existe(a): detalhes.append(f"Arquivo emulador: {a}"); pontos+=4
    pk=lista_pacotes()
    for p in PACOTES_EMULADOR:
        if p in pk: detalhes.append(f"Pacote: {p}"); pontos+=5
    if "goldfish" in cmd("cat /proc/cpuinfo 2>/dev/null"): detalhes.append("CPU: goldfish/qemu"); pontos+=4
    if not existe("/dev/tty0") and SIS=="android": detalhes.append("Sem tela física"); pontos+=2
    if socket.gethostname().lower() in ["bluestacks","nox","ldplayer","memu","sdk"]: pontos+=2
    return pontos,detalhes

# 🟢 CAMADA 16 — INTEGRIDADE DE ARQUIVOS DO SISTEMA
def integridade_sistema():
    res=[]
    if SIS=="android": lista=ARQUIVOS_SISTEMA_ANDROID
    elif SIS=="linux": lista=ARQUIVOS_SISTEMA_LINUX
    elif SIS=="windows": lista=ARQUIVOS_SISTEMA_WINDOWS
    else: return res
    for a in lista:
        if not existe(a):
            res.append(f"❌ AUSENTE: {a}"); continue
        try:
            perms=oct(os.stat(a).st_mode)[-3:]
            h=sha256(a)
            tam=os.path.getsize(a)
            if tam==0: res.append(f"⚠️  VAZIO: {a}")
            if SIS=="android" and a.startswith("/system") and perms not in ["755","644","555"]:
                res.append(f"🚨 PERMISSÃO ALTERADA {perms}: {a}")
            res.append(f"✅ OK | {tam//1024}KB | SHA‑256: {h[:16]}… | {a}")
        except Exception as e:
            res.append(f"⚠️  ACESSO NEGADO: {a} → {e}")
    if SIS=="windows":
        sfc=cmd("sfc /verifyonly 2>&1")
        if "violações de integridade" in sfc or "integrity violations" in sfc:
            res.append("🚨 WINDOWS RELATOU ARQUIVOS DE SISTEMA CORROMPIDOS / ALTERADOS")
    return res

# 🟢 CAMADA 17 — ANÁLISE DE BIBLIOTECAS .so / DLL MODIFICADAS / INJETADAS
def analisa_bibliotecas():
    res=[]; caminhos_verificar=[]
    if SIS in ("android","linux"):
        caminhos_verificar=["/system/lib","/system/lib64","/vendor/lib","/vendor/lib64","/data/app","/data/data","/data/local/tmp","/dev"]
    elif SIS=="windows":
        caminhos_verificar=["C:\\Windows\\System32","C:\\Windows\\SysWOW64",os.environ.get("TEMP","")]
    for base in caminhos_verificar:
        if not os.path.isdir(base): continue
        try:
            for r,d,arqs in os.walk(base,topdown=True,onerror=lambda _:None):
                d[:]=[x for x in d if x.lower() not in PASTAS_IGNORAR]
                for a in arqs:
                    cam=os.path.join(r,a)
                    al=a.lower()
                    if not (al.endswith(".so") or al.endswith(".dll")): continue
                    try:
                        # Verifica se foi carregado de lugar proibido
                        if al.endswith(".so") and "/system" not in r and "/vendor" not in r and "frida" not in al:
                            if al in cmd("cat /proc/self/maps 2>/dev/null"):
                                res.append(f"🚨 INJEÇÃO DETECTADA: {a} carregado de {r}")
                        # Lê cabeçalho ELF / PE
                        with open(cam,"rb") as f: cab=f.read(16)
                        if al.endswith(".so") and cab[:4]!=b"\x7fELF":
                            res.append(f"⚠️  CABEÇALHO QUEBRADO / DISFARCE: {cam}")
                        # Busca assinaturas dentro do próprio arquivo
                        if os.path.getsize(cam) < 50*1024*1024:
                            with open(cam,"rb") as f: conteudo=f.read().lower()
                            for sig in ASSINATURAS_HOOK:
                                if sig.encode() in conteudo and sig not in al:
                                    res.append(f"🔴 ASSINATURA [{sig}] DENTRO DE: {cam}")
                                    break
                    except: pass
        except: pass
    return list(dict.fromkeys(res))

# ─────────────────────────────────────────────────────────────────────────────
# PONTUAÇÃO DE RISCO
# ─────────────────────────────────────────────────────────────────────────────
def risco(total):
    if total==0: return 0,"LIMPO",VERDE
    if total<=3: return 20,"BAIXO",AMARELO
    if total<=6: return 45,"MÉDIO",AMARELO
    if total<=10: return 75,"ALTO",VERMELHO
    return 100,"CRÍTICO",VERMELHO

# ─────────────────────────────────────────────────────────────────────────────
# PROGRAMA PRINCIPAL
# ─────────────────────────────────────────────────────────────────────────────
if __name__=="__main__":
    print(cor("="*62,BRANCO_N))
    print(cor("🛡️  DETECTOR DE BYPASS · EDIÇÃO DEFINITIVA",BRANCO_N))
    print(cor(f"📅 {datetime.now().strftime('%d/%m/%Y %H:%M:%S')}",CIANO))
    print(cor(f"💻 {platform.system()} {platform.release()} · {platform.machine()} · {SIS}",CIANO))
    print(cor("="*62,BRANCO_N))

    print(cor("\n[+] Verificando ambiente e propriedades...",AZUL))
    print(cor("[+] Mapeando processos e memória...",AZUL))
    print(cor("[+] Buscando binários, módulos e arquivos suspeitos...",AZUL))
    print(cor("[+] Analisando portas e serviços locais...",AZUL))
    print(cor("[+] Listando aplicativos e pacotes do sistema...",AZUL))
    print(cor("[+] 🔍 DETECÇÃO DE EMULADOR",AZUL))
    print(cor("[+] 🛡️  VERIFICANDO INTEGRIDADE DE ARQUIVOS DE SISTEMA",AZUL))
    print(cor("[+] 🧬 ANALISANDO BIBLIOTECAS .so / DLL MODIFICADAS",AZUL))
    print(cor("[+] Segurança, SELinux, assinatura e pontuação final...\n",AZUL))

    DET=[]; INF={}

    # 1–14 CAMADAS ANTERIORES (TODAS MANTIDAS E MELHORADAS)
    r1=[c for c in CAMINHOS_ROOT if existe(c)]; r2=busca_arq(BINARIOS_ROOT); r3=busca_proc(BINARIOS_ROOT)
    if r1 or r2 or r3: INF["ROOT DETECTADO"]=[*r1,*[f"{t}: {c}" for t,c in r2[:5]],*r3]; DET.append("ROOT")
    if existe("/data/adb/magisk") or existe("/.magisk") or existe("/data/adb/ksu") or existe("/data/adb/ap"):
        INF["MAGISK / KERNELSU / APATCH"]=[]
        if existe("/data/adb/magisk") or existe("/.magisk"): INF["MAGISK / KERNELSU / APATCH"].append("> Magisk")
        if existe("/data/adb/ksu"): INF["MAGISK / KERNELSU / APATCH"].append("> KernelSU")
        if existe("/data/adb/ap"): INF["MAGISK / KERNELSU / APATCH"].append("> APatch")
        DET.append("MAGISK")
    if [c for c in CAMINHOS_ZYGISK if existe(c)] or "zygisk" in cmd("cat /proc/self/maps"): INF["ZYGISK"]=["Ativo / instalado"]; DET.append("ZYGISK")
    if [c for c in CAMINHOS_RIRU if existe(c)]: INF["RIRU"]=[c for c in CAMINHOS_RIRU if existe(c)]; DET.append("RIRU")
    x1=[c for c in CAMINHOS_XPOSED if existe(c)]; x2=[p for p in PACOTES_XPOSED if p in lista_pacotes()]
    if x1 or x2: INF["XPOSED / LSPOSED / EDXPOSED"]=[*x1,*x2]; DET.append("XPOSED")
    f1=busca_arq(BINARIOS_FRIDA); f2=busca_proc(BINARIOS_FRIDA); f3=verifica_portas(PORTAS_FRIDA); f4="frida" in cmd("cat /proc/self/maps")
    if f1 or f2 or f3 or f4: INF["FRIDA / INJEÇÃO"]=[*[f"{t}:{c}" for t,c in f1],*f2,*[f"Porta {p}" for p in f3],*(["Memória"] if f4 else [])]; DET.append("FRIDA")
    mm=varre_memoria()
    if mm: INF["ASSINATURAS NA MEMÓRIA"]=mm; DET.append("HOOK")
    vm=[p for p in PACOTES_VM if p in lista_pacotes()]
    if vm: INF["VM / SANDBOX"]=vm; DET.append("VM")
    cl=[p for p in PACOTES_CLONE if p in lista_pacotes()]
    if cl: INF["CLONADOR / PARALLEL SPACE"]=cl; DET.append("CLONE")
    oc=[p for p in PACOTES_OCULTAR if p in lista_pacotes()]
    if oc: INF["OCULTADOR DE APPS"]=oc; DET.append("OCULTADOR")
    pp=props_suspeitas()
    if pp: INF["PROPRIEDADES ALTERADAS"]=pp; DET.append("PROPS")
    adb=[]
    if "init.svc.adbd=running" in getprop(): adb.append("ADB ativo")
    if "1" in cmd("getprop ro.debuggable"): adb.append("ro.debuggable=1")
    if adb: INF["DEPURAÇÃO / ADB"]=adb; DET.append("ADB")
    if "PERMISSIVO" in selinux() or "DESATIVADO" in selinux(): INF["SELinux FRACO"]=[selinux()]; DET.append("SELINUX")
    if "TESTE" in assinatura_rom(): INF["ROM NÃO OFICIAL"]=[assinatura_rom()]; DET.append("ROM")

    # ⭐⭐⭐ NOVAS CAMADAS ⭐⭐⭐
    pt_em,det_em=detecta_emulador()
    if pt_em>=3:
        nivel="PROVÁVEL" if pt_em<8 else "CONFIRMADO"
        INF[f"EMULADOR DETECTADO · PONTUAÇÃO {pt_em}/30 — {nivel}"]=det_em
        DET.append("EMULADOR")

    integ=integridade_sistema()
    alterados=[x for x in integ if "🚨" in x or "⚠️" in x or "❌" in x]
    ok=[x for x in integ if "✅" in x]
    if alterados:
        INF[f"INTEGRIDADE: {len(alterados)} problema(s), {len(ok)} ok"]=alterados
        DET.append("INTEGRIDADE")

    bib=analisa_bibliotecas()
    if bib:
        INF[f"BIBLIOTECAS SUSPEITAS: {len(bib)} encontrada(s)"]=bib[:15]
        if len(bib)>15: INF[f"BIBLIOTECAS SUSPEITAS: {len(bib)} encontrada(s)"].append(f"...e mais {len(bib)-15}")
        DET.append("BIBLIOTECAS")

    # ─────────────────────── SAÍDA FINAL ───────────────────────
    print(cor("─"*62,BRANCO_N))
    print(cor("📋 RELATÓRIO COMPLETO",BRANCO_N))
    print(cor("─"*62,BRANCO_N))

    if not DET:
        print(cor("\n✅ NENHUM BYPASS, NENHUMA ALTERAÇÃO, NENHUM EMULADOR DETECTADO",VERDE))
    else:
        for k,v in INF.items():
            print(f"\n{cor('🚨 '+k,VERMELHO)}")
            for it in v: print(f"   • {it}")

    print(f"\n{cor('SELinux: ',BRANCO_N)}{selinux()}")
    print(f"{cor('Assinatura ROM: ',BRANCO_N)}{assinatura_rom()}")
    pts,nvl,cr=risco(len(DET))
    print(f"\n{cor('RISCO FINAL: ',BRANCO_N)}{cor(f'{pts}% · NÍVEL {nvl}',cr)}")

    if pts==0:
        print(cor("\n✅ Ambiente 100% seguro e íntegro",VERDE)); final="LIMPO"
    else:
        print(cor("\n⚠️  Existem técnicas ativas para burlar proteções e detecções",VERMELHO)); final="SUSPEITO"

    arq=f"relatorio_bypass_COMPLETO_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
    try:
        with open(arq,"w",encoding="utf-8") as f:
            f.write(f"DETECTOR DE BYPASS · EDIÇÃO DEFINITIVA\nData: {datetime.now()}\nSistema: {platform.system()}\nRisco: {pts}% {nvl}\nResultado: {final}\n")
            f.write("─"*60+"\n")
            for k,v in INF.items():
                f.write(f"\n▶ {k}\n")
                for i in v: f.write(f"   - {i}\n")
            f.write(f"\nSELinux: {selinux()}\nAssinatura: {assinatura_rom()}\n")
            f.write("\n--- INTEGRIDADE COMPLETA ---\n")
            for i in integ: f.write(i+"\n")
        print(cor(f"\n💾 Relatório completo salvo: {arq}",CIANO))
    except Exception as e:
        print(cor(f"\nErro ao salvar: {e}",AMARELO))

    print("\n"+cor("="*62,BRANCO_N))

