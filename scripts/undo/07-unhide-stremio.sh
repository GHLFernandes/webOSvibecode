#!/bin/sh
# Remove org.balazs.stremio-wrapper da lista de apps ocultos (não recomendado em 664MB RAM)
P=/var/preferences/com.webos.applicationManager/deletedSystemAppList.json
[ -f "$P" ] || exit 0
python -c "
import json
p='$P'
with open(p) as f: d=json.load(f)
lst=[x for x in d.get('deletedList',[]) if x!='org.balazs.stremio-wrapper']
d['deletedList']=lst
with open(p,'w') as f: json.dump(d,f)
" 2>/dev/null || true
echo "Stremio visível no launcher novamente."
exit 0
