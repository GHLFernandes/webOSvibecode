#!/bin/sh
# [UNDO] Remove scripts custom de boot (hosts + preload)
rm -f /var/lib/webosbrew/init.d/10-hosts-block /var/lib/webosbrew/init.d/30-preload-off
echo "Removidos init.d custom. Reboot recomendado."
exit 0
