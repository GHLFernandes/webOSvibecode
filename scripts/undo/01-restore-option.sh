#!/bin/sh
# [UNDO] Restaura /var/luna/preferences/option a partir do backup na TV.
set -u
BACKUP="${1:-/home/root/backup/option.20251021}"
if [ ! -f "$BACKUP" ]; then
	echo "Backup não encontrado: $BACKUP" >&2
	exit 1
fi
cp "$BACKUP" /var/luna/preferences/option
sync
echo "option restaurado de $BACKUP"
exit 0
