# ---- builder: download + extract Bitcoin Core into /opt/bitcoin ----
FROM debian:bookworm-slim AS builder

ARG BITCOIN_VERSION=28.3
ARG BITCOIN_PLATFORM=x86_64-linux-gnu

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl tar gzip \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/bitcoin
RUN curl -fsSL \
    "https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-${BITCOIN_PLATFORM}.tar.gz" \
    -o /tmp/bitcoin.tar.gz \
  && tar -xzf /tmp/bitcoin.tar.gz -C /opt/bitcoin --no-same-owner --no-same-permissions \
  && rm -f /tmp/bitcoin.tar.gz


# ---- runtime: lightweight image with only /opt/bitcoin copied in ----
FROM debian:bookworm-slim

ARG BITCOIN_VERSION=28.3

# Create non-root user
RUN useradd -r -m -u 10001 -s /usr/sbin/nologin bitcoind \
  && mkdir -p /home/bitcoind/.bitcoin \
  && chown -R bitcoind:bitcoind /home/bitcoind

# Copy only /opt/bitcoin from builder stage
COPY --from=builder /opt/bitcoin /opt/bitcoin

# Make bitcoind available on PATH
ENV PATH="/opt/bitcoin/bitcoin-${BITCOIN_VERSION}/bin:${PATH}"

# Optional: persist chain/data
VOLUME ["/home/bitcoind/.bitcoin"]

USER bitcoind
WORKDIR /home/bitcoind

ENTRYPOINT ["bitcoind"]
