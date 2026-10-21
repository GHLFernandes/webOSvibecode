#!/bin/sh
# [UNDO] Reativa Quick Start+ (quickStartMode on)
set -u
BACKUP="${1:-/home/root/backup/option.before-quickstart-off.20251021}"
if [ -f "$BACKUP" ]; then
	cp "$BACKUP" /var/luna/preferences/option
	sync
	echo "Restaurado de $BACKUP"
	exit 0
fi
sed -i 's/"quickStartMode": "off"/"quickStartMode": "on"/' /var/luna/preferences/option
sync
echo "quickStartMode -> on"
exit 0
