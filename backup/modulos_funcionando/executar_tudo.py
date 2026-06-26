#!/usr/bin/env python3
# 999999 REAL SCAN · ~300 LINHAS · DADOS 100% VERDADEIROS
import os,sys,re,time,socket,subprocess,json,fcntl,atexit
from datetime import datetime
from collections import defaultdict

R,VR,AM,AZ,BN="31","32","33","34","1;37"
def cor(t,c):return f"\033[{c}m{t}\033[0m"

# INSTÂNCIA ÚNICA REAL
LOCK=f"{os.path.dirname(os.path.abspath(__file__))}/.lock"
try:
    f=open(LOCK,"w");fcntl.flock(f,fcntl.LOCK_EX|fcntl.LOCK_NB)
    atexit.register(lambda:os.path.exists(LOCK)and os.remove(LOCK))
except:print(cor("⚠ Já rodando",AM));sys.exit(1)

ANDROID=os.path.exists("/system")
def cmd(c,t=8):
    try:return subprocess.check_output(c,shell=True,stderr=subprocess.DEVNULL,text=True,timeout=t).lower()
    except:return""

# ==================================================
# 📌 FUNÇÕES QUE LÊM DADOS REAIS DO SISTEMA
# ==================================================
def tcp_portas():# LÊ TABELA DE PORTAS Abertas DE VERDADE em /proc
    res=[]
    for arq in ["/proc/net/tcp","/proc/net/tcp6"]:
        if not os.path.exists(arq):continue
        for ln in open(arq).readlines()[1:]:
            p=int(ln.split()[1].split(":",1)[1],16)
            if ln.split()[3]=="0A":res.append(p)
    return sorted(set(res))

def tracerpid():# VERIFICA DEBUGGER REAL
    try:
        for ln in open(f"/proc/{os.getpid()}/status"):
            if ln.startswith("TracerPid:"):return int(ln.split(":")[1])
    except:pass
    return 0

def logcat_real(seg=3):# CAPTURA LOGCAT DE VERDADE DO ANDROID
    return cmd(f"logcat -d -t {seg*10} --pid=$(pidof com.dts.freefireth 2>/dev/null||echo 0) 2>/dev/null;logcat -d -s adbd *:s 2>/dev/null",seg+2)

PESOS={"M01":10,"M02":12,"M03":14,"M04":8,"M05":22,"M06":15,"M07":18,"M08":20,"M09":10,"M10":30}
DET,SUS,LIM=[],[],[]
TOTAL=0

class Mod:
    def __init__(s,i,n):s.id=i;s.n=n;s.p=PESOS[i];s.ev=[];s.pt=0
    def alerta(s,t,c=R):
        if t.lower()[:100]in[x[1].lower()[:100]for x in s.ev]:return
        s.ev.append((c,t))
        if c==R:DET.append((s.id,s.n,t))
        elif c==AM:SUS.append((s.id,s.n,t))
        s.pt=min(100,len(s.ev)*s.p//2)
    def run(s):
        try:s.scan()
        except Exception as e:s.ev.append((R,f"ERRO:{e}"))
        if not s.ev:
            LIM.append((s.id,s.n))
            s.ev.append((VR,"✓ Limpo"))

# ==================================================
# 🔴 CADA MÓDULO ABAIXO SÓ USA DADOS REAIS
# ==================================================
class M01(Mod):
    def __init__(s):super().__init__("M01","🛡 Integridade")
    def scan(s):
        for a in ["/system/bin/app_process64","/system/lib64/libc.so","/system/bin/sh"]:
            if os.path.exists(a):
                per=oct(os.stat(a).st_mode)[-3:]
                if per not in("755","644","555"):s.alerta(f"Permissão errada {per} {a}",AM)

class M02(Mod):
    def __init__(s):super().__init__("M02","📦 Pacotes")
    def scan(s):
        pk=cmd("pm list packages 2>/dev/null")
        for p in["gameguardian","luckypatcher","cheatengine","frida","lspatch","parallelspace","vmos","hideapp","zygisksu"]:
            if p in pk:s.alerta(f"Instalado: {p}")

class M03(Mod):
    def __init__(s):super().__init__("M03","⚙ Processos")
    def scan(s):
        ps=cmd("ps -A 2>/dev/null;ps 2>/dev/null")
        for p in["frida-server","frida-inject","frida-gadget","gameguardian","magiskd","gdb","lldb","strace","adbd"]:
            if re.search(rf"(^|/|\s){p}(\s|$)",ps):s.alerta(f"ATIVO: {p}")

class M04(Mod):
    def __init__(s):super().__init__("M04","⏱ Speedhack")
    def scan(s):
        a=time.perf_counter();time.sleep(1);b=abs(time.perf_counter()-a-1)
        if b>0.18:s.alerta(f"Velocidade alterada {b*1000:.0f}ms",AM)
        q=cmd("ps -A 2>/dev/null|wc -l")
        if q.isdigit()and int(q)>800:s.alerta(f"Processos: {q.strip()}",AM)

class M05(Mod):
    def __init__(s):super().__init__("M05","👑 Root/Emulador")
    def scan(s):
        for c in["/sbin/su","/system/bin/su","/su","/.magisk","/data/adb/magisk","/data/adb/ksu","/data/adb/ap"]:
            if os.path.exists(c):s.alerta(f"ROOT detectado: {c}");break
        if os.path.exists("/data/adb/zygisk")or"zygisk"in cmd("cat /proc/self/maps"):s.alerta("Zygisk ativo")
        if os.path.exists("/data/adb/modules/shamiko"):s.alerta("Shamiko")
        if"ro.kernel.qemu=1"in cmd("getprop")or os.path.exists("/dev/qemu_pipe"):s.alerta("Emulador QEMU")
        if"test-keys"in cmd("getprop ro.build.tags"):s.alerta("ROM de teste",AM)

class M06(Mod):
    def __init__(s):super().__init__("M06","🧬 Assinaturas ELF")
    def scan(s):
        SIG=["frida","xposed","lsposed","riru","zygisk","libdobby","libinject","libhook"]
        for base in["/data/local/tmp","/vendor/lib64","/system/lib64"]:
            if not os.path.isdir(base):continue
            for r,d,arqs in os.walk(base):
                for a in arqs:
                    if not a.endswith(".so"):continue
                    cam=os.path.join(r,a)
                    try:
                        if os.path.getsize(cam)>60*1024*1024:continue
                        tx=open(cam,"rb").read()
                        if tx[:4]!=b"\x7fELF":continue
                        tx=tx.lower()
                        for x in SIG:
                            if x.encode()in tx:s.alerta(f"[{x}] → {cam}")
                    except:pass

class M07(Mod):
    def __init__(s):super().__init__("M07","🔌 Portas abertas")
    def scan(s):
        reais=tcp_portas()
        alvo=[27042,27043,27045,1337,8080,8888,5037,5555,5556,38000,44000]
        for p in alvo:
            if p in reais:s.alerta(f"127.0.0.1:{p} ABERTA",R if p in(5037,5555,27042)else AM)
        sk=socket.socket();sk.settimeout(.3)
        for p in alvo[:8]:
            try:
                if sk.connect_ex(("127.0.0.1",p))==0 and p not in reais:
                    s.alerta(f"Porta {p} respondendo",AM)
            except:pass
        sk.close()

class M08(Mod):
    def __init__(s):super().__init__("M08","🐞 Debugger")
    def scan(s):
        tp=tracerpid()
        if tp>0:s.alerta(f"DEPURADOR LIGADO PID={tp}")
        t1=time.perf_counter_ns();[i*i for i in range(80000)];t2=time.perf_counter_ns()
        if(t2-t1)/1e6>150:s.alerta("Execução lenta · depuração ativa",AM)

class M09(Mod):
    def __init__(s):super().__init__("M09","💬 Chat/Comportamento")
    def scan(s):
        padroes={
            R:[r"mod.*menu","diamante.*pix|pix.*diamant","vendo.*conta|compro.*conta",r"zap|whats.*\d{4,}"],
            AM:[r"\b(noob|lixo|frango|otario)\b","subir.*rank.*pag","https?://"]
        }
        # TENTA LER LOG DO CHAT REAL DO JOGO
        lc=cmd("logcat -d -s Unity native-activity *:s 2>/dev/null | grep -iE 'chat|mensagem|msg' 2>/dev/null | head -30")
        if not lc:
            s.alerta("Sem permissão leitura logs chat",AM);return
        for ln in lc.splitlines():
            for cor_lista,regs in padroes.items():
                for rg in regs:
                    if re.search(rg,ln):s.alerta(f"CHAT: {ln[:120]}",cor_lista);break

class M10(Mod):
    def __init__(s):super().__init__("M10","📡 ADB WiFi / Memória")
    def scan(s):
        gp=cmd("getprop 2>/dev/null")
        if"debug.wifi=1"in gp or re.search(r"service.adb.tcp.port\s*=\s*[1-9]",gp):
            s.alerta("⚠ ADB WIFI ATIVO NO SISTEMA")
        lc=logcat_real(3)
        regras=[
            (R,r"wireless.*debug.*enabled|adb.*connect.*\d{1,3}\.\d{1,3}\.","ADB ATIVO/CONECTADO"),
            (R,r"debugger.*attach|jdwp|process.*debuggable","DEPURADOR"),
            (R,r"ptrace|process_vm|libil2cpp.*write","ACESSO MEMÓRIA"),
            (AM,r"logcat.*-c|clear.*log","APAGOU LOGS"),
        ]
        for c,rg,nome in regras:
            if re.search(rg,lc):s.alerta(f"{nome}",c)
        if"adbd"in cmd("ps -A 2>/dev/null")and 5555 in tcp_portas():
            s.alerta("ADBD RODANDO + PORTA 5555 ABERTA")

MODS=[M01(),M02(),M03(),M04(),M05(),M06(),M07(),M08(),M09(),M10()]

# ==================================================
# 🚀 EXECUÇÃO
# ==================================================
if __name__=="__main__":
    print(cor("="*52,BN))
    print(cor("🔍 999999 · SCAN REAL · ANDROID",BN))
    print(f"Android={ANDROID} · {cmd('getprop ro.product.cpu.abi').strip() or os.uname()[4]}")
    print(datetime.now().strftime("%d/%m/%Y %H:%M:%S"))
    print(cor("="*52,BN))
    for i,m in enumerate(MODS,1):
        print(cor(f"\n[{i:02d}/10] {m.n}",AZ))
        m.run()
        for c,t in m.ev:print(f"  {cor('●',c)} {t}")
        TOTAL+=m.pt
    TOTAL=min(100,TOTAL)
    cp=VR if TOTAL<10 else AM if TOTAL<40 else R
    nv=("LIMPO","✅")if TOTAL<10 else("BAIXO","⚠")if TOTAL<30 else("MÉDIO","⚠⚠")if TOTAL<60 else("ALTO","🚨")

    print(f"\n{cor('PONTUAÇÃO FINAL',BN)}: {cor(f'{TOTAL}/100',cp)} · {cor(nv[0],cp)} {nv[1]}")
    print(cor("\n🔴 DETECTADO · CONFIRMADO",R)+"\n"+cor("="*52,R))
    for a in DET or[("","Nenhuma ameaça real encontrada","")]:print(f" [{a[0]}] {a[1]} → {a[2]}")
    print(cor("\n🟡 SUSPEITO · ANALISAR MELHOR",AM)+"\n"+cor("="*52,AM))
    for a in SUS or[("","Nada suspeito","")]:print(f" [{a[0]}] {a[1]} → {a[2]}")
    print(cor("\n🟢 LIMPO",VR)+"\n"+cor("="*52,VR))
    for a in LIM:print(f" [{a[0]}] {a[1]}")

    nm=f"scan_real_{datetime.now():%Y%m%d_%H%M%S}"
    json.dump({"data":datetime.now().isoformat(),"pt":TOTAL,"nv":nv[0],"det":DET,"sus":SUS,"limpo":LIM},open(f"{nm}.json","w"),indent=2,ensure_ascii=False)
    print(cor(f"\n💾 {nm}.json salvo",AZ))

