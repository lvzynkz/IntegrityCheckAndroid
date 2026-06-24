<?php

echo "\n";
echo "====================================\n";
echo " IntegrityCheck Android\n";
echo "====================================\n";

$modulos = [
    "mod01_usb.php"
];

foreach ($modulos as $modulo) {

    $arquivo = __DIR__ . "/modulos/" . $modulo;

    if (file_exists($arquivo)) {
        require_once $arquivo;
    } else {
        echo "[ERRO] Modulo nao encontrado: $modulo\n";
    }
}

echo "\nFim da verificacao.\n";
