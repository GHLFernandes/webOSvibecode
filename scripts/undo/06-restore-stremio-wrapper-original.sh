#!/bin/sh
# Restaura wrapper Stremio original (pré patch lite)
APP=/media/developer/apps/usr/palm/applications/org.balazs.stremio-wrapper
B=/home/root/backup/stremio-original
if [ ! -f "$B/index.html" ]; then
	echo "Backup não encontrado em $B" >&2
	exit 1
fi
cp "$B/index.html" "$B/main.js" "$APP/"
sed -i 's/\"version\": \"1.0.1-lite\"/\"version\": \"1.0.0\"/' "$APP/appinfo.json" 2>/dev/null || true
echo "Wrapper Stremio original restaurado."
exit 0
