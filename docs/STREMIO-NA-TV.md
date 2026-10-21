# Stremio na LG 43LJ5550 (webOS 3.5)

## Conclusão

**Stremio dentro da TV (wrapper `tv.strem.io`) não funciona de forma confiável neste modelo.**

- RAM total ~**664 MB**; com home + `WebAppMgr`, sobram dezenas de MB.
- O site **tv.strem.io** é pesado para o Chromium do webOS 3.5.
- Logs típicos: app em tela cheia → ~6 s → “restart for efficient memory use” / relaunch automático.

Patch “lite” (sem warmup, splash OK, 720p) **não resolve**: ao carregar o iframe, o uso de memória ainda estoura.

## Alternativa recomendada: Stremio no celular/PC + DLNA na TV

A TV LG funciona como **renderer DLNA**; você assiste pelo Stremio em outro dispositivo e manda o vídeo para a TV.

### No PC (Windows/Mac/Linux)

1. Instale [Stremio](https://www.stremio.com/) no computador (mesma rede Wi‑Fi/Ethernet que a TV).
2. Stremio → **Configurações** → **Streaming** → ative **DLNA** (ou “Cast to DLNA devices”).
3. Reproduza um filme/série no Stremio → ícone **DLNA / Cast** → escolha a TV (nome LG da rede).
4. A TV deve abrir o player de mídia e exibir o stream.

### No celular

O app Stremio mobile **nem sempre** oferece DLNA. Se não aparecer cast DLNA, use **Stremio no PC** na mesma rede ou um **Chromecast / stick** (fora do escopo deste repo).

### Se a TV não aparecer na lista DLNA

- Confirme que PC/TV estão na **mesma sub-rede** (ex.: 192.168.68.x).
- Na TV: **Configurações → Rede** — não use guest/isolamento de AP.
- Evite VPN no PC durante o teste.

## O que ficou na TV

- App `org.balazs.stremio-wrapper` pode permanecer instalado em `/media/developer`, mas foi **ocultado** do launcher para não reiniciar à toa.
- Para remover de vez: `ares-install -r org.balazs.stremio-wrapper -d lgtv`

## Desfazer ocultação (não recomendado)

`scripts/undo/07-unhide-stremio.sh` (se criado) ou editar `deletedSystemAppList.json`.
