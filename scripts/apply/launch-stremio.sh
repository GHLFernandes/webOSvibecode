#!/usr/bin/env bash
# Fecha apps pesados e abre Stremio (use após patch lite).
set -euo pipefail
DEVICE="${ARES_DEVICE:-lgtv}"
SSH=(ssh -o BatchMode=yes -i "${HOME}/.ssh/lgtv" root@192.168.68.111)

echo "Fechando apps em background..."
"${SSH[@]}" 'for id in netflix amazon youtube.leanback.v4 com.webos.app.container com.webos.app.browser; do
  luna-send -n 1 luna://com.webos.applicationManager/closeByAppId "{\"id\":\"$id\"}" >/dev/null 2>&1 || true
done
sleep 2
free -m | head -2'

echo "Abrindo Stremio..."
ares-launch -d "$DEVICE" org.balazs.stremio-wrapper
