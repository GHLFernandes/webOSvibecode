#!/usr/bin/env bash
# Instala Stremio (Balazsmi wrapper) na TV rooteada via ares-cli.
# Requisitos: ~/.ssh/lgtv, host lgtv em ~/.ssh/config, ares-setup-device com device "lgtv".
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
IPK="${IPK:-/tmp/stremio.ipk}"
URL="${STREMIO_IPK_URL:-https://github.com/Balazsmi/Stremio-LG-TV/releases/download/v1.0.0/org.balazs.stremio-wrapper_1.0.0_all.ipk}"
DEVICE="${ARES_DEVICE:-lgtv}"

if ! ssh -o BatchMode=yes -o ConnectTimeout=5 -i "${HOME}/.ssh/lgtv" root@192.168.68.111 true 2>/dev/null; then
	echo "SSH para a TV falhou. Confira ~/.ssh/config (Host lgtv) e a chave ~/.ssh/lgtv." >&2
	exit 1
fi

if ! ares-setup-device --list 2>/dev/null | grep -q "$DEVICE"; then
	echo "Device ares '$DEVICE' não encontrado. Rode:" >&2
	echo "  ares-setup-device -a lgtv -i username=root -i privatekey=lgtv -i host=192.168.68.111 -i port=22" >&2
	exit 1
fi

if [ ! -f "$IPK" ]; then
	echo "Baixando IPK..."
	curl -fsSL -o "$IPK" "$URL"
fi

echo "AVISO: Stremio na TV 43LJ5550 (webOS 3.5) costuma falhar por falta de RAM."
echo "Leia docs/STREMIO-NA-TV.md (alternativa: Stremio no PC + DLNA)."
echo "Abortando instalação local. Use DLNA ou outro dispositivo."
exit 1
