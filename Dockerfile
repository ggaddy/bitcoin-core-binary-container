FROM docker.io/library/fedora:41

RUN dnf -y update && dnf -y upgrade
RUN dnf -y install tar gzip
RUN mkdir -p /opt/bitcoin
RUN mkdir -p /root/.bitcoin
RUN curl https://bitcoincore.org/bin/bitcoin-core-28.1/bitcoin-28.1-x86_64-linux-gnu.tar.gz -o /opt/bitcoin/bitcoin-28.1.tar.gz
RUN cd /opt/bitcoin && tar -xzf /opt/bitcoin/bitcoin-28.1.tar.gz
RUN rm -f /opt/bitcoin/bitcoin-28.1.tar.gz
RUN ln -s /opt/bitcoin/bitcoin-28.1/bin/bitcoind /usr/local/bin/bitcoind

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["bitcoind"]
