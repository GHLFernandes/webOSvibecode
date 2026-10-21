# CHANGELOG — TV LG 43LJ5550

## 2025-10-21 — Debloat inicial (YouTube/Stremio/Disney+)

### Aplicado na TV

- **Prefs `option`**: `watchedListCollection`, `webOSPromotionVideo`, `homelegalPopup`, `demoMode`, `ohtv`, `enableToastPopup` → `off` (backup em `/home/root/backup/option.20251021` e `backups/2025-10-21-option-pre-apply.json`).
- **`deletedSystemAppList.json`**: ocultados tiles de sport/today/loja/browser/etc. (backup prévio em `/home/root/backup/deletedSystemAppList.json`).
- **`init.d`**: `10-hosts-block`, `30-preload-off` em `/var/lib/webosbrew/init.d/`.
- **`/home/root/hosts/blocklist-extra.txt`**: domínios LG ads/telemetry (append em `/etc/hosts` após HBC).
- **Apps em `/media/developer`**: `org.balazs.stremio-wrapper`, `youtube.leanback.v4` (webosbrew v0.5.3 IPK).
- **Mantidos**: `com.disney.alch.prod.lrd.app`, HBC.

### Stremio

- **Instalação na TV:** tecnicamente ok via `ares-install`, mas **não usable** (OOM / relaunch ~6s). Ver `docs/STREMIO-NA-TV.md`.
- **Alternativa:** Stremio no PC + DLNA para a LG.
- App **oculto** no launcher (`org.balazs.stremio-wrapper` em `deletedSystemAppList.json`).
- Remover pacote: `scripts/undo/05-remove-stremio.sh`

### 2025-10-21 — Quick Start+ desligado

- **`quickStartMode`**: `on` → `off` em `/var/luna/preferences/option`
- Backup TV: `/home/root/backup/option.before-quickstart-off.20251021`
- Backup repo: `backups/2025-10-21-option-before-quickstart-off.json`
- **Efeito pleno:** desligar da tomada ~10 min após a mudança (LG webOS 3.5)
- Desfazer: `scripts/undo/08-enable-quick-start.sh`

### Pendente / manual

- Desinstalar apps em **`/media/cryptofs`** (Netflix, Prime, etc.): `luna-send`/`ares-install -r` não confirmaram remoção nesta sessão — usar **Homebrew Channel → Manage apps** ou reinstalar firmware de apps.
- **Reboot** recomendado para registrar apps developer e replay preload/hosts.
- **`luna-send` via SSH BatchMode** não retornou JSON nesta TV; prefs foram gravadas via arquivo `option` (SettingsService).

### Desfazer

| Mudança | Undo |
|---------|------|
| option | `scripts/undo/01-restore-option.sh` |
| launcher hide | `scripts/undo/02-restore-deleted-apps.sh` |
| init.d | `scripts/undo/03-remove-init.d-custom.sh` + reboot |
| Stremio/YouTube brew | `scripts/undo/04-remove-developer-apps.sh` |
