#!/usr/bin/env bash
# [CONFIG] Desliga Quick Start+ (quickStartMode) — requer power cycle para efeito pleno.
set -euo pipefail
SSH=(ssh -o BatchMode=yes -i "${HOME}/.ssh/lgtv" root@192.168.68.111)
"${SSH[@]}" 'mkdir -p /home/root/backup
cp /var/luna/preferences/option /home/root/backup/option.before-quickstart-off.$(date +%Y%m%d) 2>/dev/null || true
sed -i "s/\"quickStartMode\": \"on\"/\"quickStartMode\": \"off\"/" /var/luna/preferences/option
sync
grep quickStartMode /var/luna/preferences/option'
echo ""
echo "Próximo passo (recomendado pela LG): desligar da tomada ~10 min, ligar de novo."
echo "Undo: scripts/undo/08-enable-quick-start.sh"
