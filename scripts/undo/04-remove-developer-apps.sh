#!/bin/sh
# [UNDO] Remove apps sideload em /media/developer (Stremio + YouTube brew)
rm -rf /media/developer/apps/usr/palm/applications/org.balazs.stremio-wrapper
rm -rf /media/developer/apps/usr/palm/applications/youtube.leanback.v4
echo "Apps developer removidos. Reinstale YouTube oficial pela loja se necessário."
exit 0
