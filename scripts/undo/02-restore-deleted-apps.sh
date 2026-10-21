#!/bin/sh
# [UNDO] Restaura deletedSystemAppList.json
set -u
SRC="${1:-/home/root/backup/deletedSystemAppList.json}"
DEST=/var/preferences/com.webos.applicationManager/deletedSystemAppList.json
if [ ! -f "$SRC" ]; then
	echo "Backup não encontrado: $SRC" >&2
	exit 1
fi
cp "$SRC" "$DEST"
sync
echo "Restaurado $DEST"
exit 0
