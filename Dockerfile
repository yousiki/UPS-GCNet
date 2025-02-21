FROM nvidia/cuda:12.8.0-cudnn-runtime-ubuntu24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    libglib2.0-0 \
    curl

COPY . /ups-gcnet

# Install dependencies
WORKDIR /ups-gcnet
ADD https://rye.astral.sh/get /tmp/rye-install.sh
RUN RYE_INSTALL_OPTION="--yes" bash /tmp/rye-install.sh
ENV PATH="$PATH:/root/.rye/shims"
RUN --mount=target=/root/.cache/uv,type=cache,sharing=locked \
    rye sync --no-lock --no-dev

WORKDIR /workspace

VOLUME [ "/workspace" ]