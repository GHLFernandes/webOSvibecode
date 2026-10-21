#!/usr/bin/env bash
# Aplica patch lite no Stremio já instalado (sem warmup, splash + OK, 720p).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
APP="/media/developer/apps/usr/palm/applications/org.balazs.stremio-wrapper"
SSH=(ssh -o BatchMode=yes -i "${HOME}/.ssh/lgtv" root@192.168.68.111)

"${SSH[@]}" "mkdir -p /home/root/backup/stremio-original && cp -n $APP/index.html $APP/main.js /home/root/backup/stremio-original/ 2>/dev/null || true"

scp -i "${HOME}/.ssh/lgtv" \
  "$ROOT/apps/stremio-wrapper-lite/index.html" \
  "$ROOT/apps/stremio-wrapper-lite/main.js" \
  root@192.168.68.111:"$APP/"

"${SSH[@]}" "sed -i 's/\"version\": \"1.0.0\"/\"version\": \"1.0.1-lite\"/' $APP/appinfo.json; sed -i 's/1920x1080/1280x720/' $APP/appinfo.json || true"

echo "Patch lite aplicado em $APP"
