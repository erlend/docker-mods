FROM --platform=$BUILDPLATFORM alpine:latest AS buildstage

ARG TARGETARCH
ARG TS_VERSION
RUN DOWNLOAD="tailscale_${TS_VERSION}_${TARGETARCH}" && \
    wget -cO- "https://pkgs.tailscale.com/stable/$DOWNLOAD.tgz" | tar zx && \
    mkdir -p /root-layer/usr/sbin && \
    install -v "$DOWNLOAD/tailscale"  /root-layer/usr/sbin/ && \
    install -v "$DOWNLOAD/tailscaled" /root-layer/usr/sbin/

COPY root/ root-layer/

FROM --platform=$TARGETPLATFORM scratch
COPY --from=buildstage /root-layer/ /
