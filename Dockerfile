FROM registry.fedoraproject.org/fedora-minimal:latest

RUN mkdir -p /opt/bitcoin
RUN curl https://bitcoincore.org/bin/bitcoin-core-0.21.1/bitcoin-0.21.1-x86_64-linux-gnu.tar.gz -o /opt/bitcoin/bitcoin-0.21.1-x86_64-linux-gnu.tar.gz
RUN microdnf -y install tar
RUN cd /opt/bitcoin && tar -xzf /opt/bitcoin/bitcoin-0.21.1-x86_64-linux-gnu.tar.gz
RUN rm -f /opt/bitcoin/bitcoin-0.21.1-x86_64-linux-gnu.tar.gz
RUN ln -s /opt/bitcoin/bitcoin-0.21.1/bin/bitcoind /usr/local/bin/bitcoind

ENTRYPOINT ["bitcoind"]
