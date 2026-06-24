<?php

echo "\n";
echo "===== MODULO 01 - USB =====\n";

$usb = trim(shell_exec("getprop sys.usb.state 2>/dev/null"));

if (empty($usb)) {

    echo "[INFO] Estado USB nao identificado\n";

} else {

    echo "[INFO] Estado USB: $usb\n";

}
