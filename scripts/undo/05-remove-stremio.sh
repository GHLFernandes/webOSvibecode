#!/bin/sh
# [UNDO] Remove Stremio instalado via developer/ares
set -u
if command -v ares-install >/dev/null 2>&1; then
	ares-install -r org.balazs.stremio-wrapper -d lgtv 2>/dev/null || true
fi
rm -rf /media/developer/apps/usr/palm/applications/org.balazs.stremio-wrapper
rm -rf /media/developer/apps/usr/palm/packages/org.balazs.stremio-wrapper
rm -f /media/developer/apps/usr/lib/opkg/info/org.balazs.stremio-wrapper.*
echo "Stremio removido (reboot se o ícone persistir)."
exit 0
