# railway-xray

Xray (VLESS + WebSocket) on Railway. Railway terminates TLS at its edge
(`*.up.railway.app`), xray listens plain WebSocket on `$PORT` internally.

## Deploy

1. Create a Railway project from this repo (Dockerfile is auto-detected).
2. Set variables: `UUID` = a random UUID (the VLESS client id).
3. Generate a public domain for the service (Settings → Networking →
   Generate Domain).
4. Client (Shadowrocket / v2rayNG / Streisand):

```
vless://<UUID>@<domain>:443?encryption=none&security=tls&sni=<domain>&type=ws&path=%2Fvless#railway-xray
```

## Files

- `Dockerfile` — Alpine + Xray-core v26.10.21
- `config.json` — VLESS inbound, WS path `/vless`, placeholders
  `__PORT__` / `__UUID__` filled by `entrypoint.sh` from env
- `entrypoint.sh` — substitutes env vars and starts xray
- `sub.txt` — subscription content (one vless:// link per line), filled
  in after the domain is known
