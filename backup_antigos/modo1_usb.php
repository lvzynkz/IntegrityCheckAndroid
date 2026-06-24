<?php

echo "\n";
echo "========================\n";
echo " MODULO 01 - USB\n";
echo "========================\n";

$usb = trim(shell_exec("getprop sys.usb.state 2>/dev/null"));
$config = trim(shell_exec("getprop persist.sys.usb.config 2>/dev/null"));

if(empty($usb)){
    echo "[INFO] Estado USB: desconhecido\n";
}else{
    echo "[INFO] Estado USB: $usb\n";
}

if(empty($config)){
    echo "[INFO] Configuracao USB: desconhecida\n";
}else{
    echo "[INFO] Configuracao USB: $config\n";
}

if(stripos($usb, "adb") !== false){
    echo "[ALERTA] ADB detectado via USB\n";
}else{
    echo "[OK] ADB nao detectado\n";
}
