FROM ghcr.io/astral-sh/uv:debian-slim

RUN --mount=type=cache,target=/var/lib/apt,sharing=locked \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update && apt-get install -y curl

RUN curl -fsSL https://install.qmk.fm | sh -s -- --confirm --skip-uv

WORKDIR /qmk_firmware

RUN qmk setup --home . --yes

ENTRYPOINT ["qmk"]