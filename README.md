# Erlend's Tailscale Docker Mod

Connect any Docker Mods compatible container to Tailscale.

## Example

```
docker run \
  --detach \
  --hostname=firefox \
  --env=DOCKER_MODS=erlend/mods:tailscale \
  --env=REDIRECT_TO_HTTPS=on \
  --env=TS_AUTHKEY=InsertYourAuthKeyHere \
  --env=TS_SERVE_PROXY_PORT=3000 \
  --volume=/path/to/config:/config \
  lscr.io/linuxserver/firefox:latest
```

## Configuration

| Variable            | Description                                           |
| ------------------- | ----------------------------------------------------- |
| TS_AUTHKEY          | Auth key generated in Tailscale settings **required** |
| TS_SERVE_FUNNEL     | Set this to enable funnel *invite only feature*       |
| TS_SERVE_PROXY_PORT | Proxy requests to a web server at this port           |
| TS_SERVE_CUSTOM     | Custom `tailscale serve` arguments                    |
| REDIRECT_TO_HTTPS   | Set this to redirect HTTP requests to HTTPS           |
