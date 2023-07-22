FROM registry.fedoraproject.org/fedora-minimal:latest

RUN microdnf -y update && microdnf -y upgrade
RUN microdnf -y install tar gzip
RUN mkdir -p /opt/bitcoin
RUN curl https://bitcoincore.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz -o /opt/bitcoin/bitcoin-22.0-x86_64-linux-gnu.tar.gz
RUN cd /opt/bitcoin && tar -xzf /opt/bitcoin/bitcoin-22.0-x86_64-linux-gnu.tar.gz
RUN rm -f /opt/bitcoin/bitcoin-22.0-x86_64-linux-gnu.tar.gz
RUN ln -s /opt/bitcoin/bitcoin-22.0/bin/bitcoind /usr/local/bin/bitcoind

ENTRYPOINT [ "/usr/bin/bash" ]
CMD ["bitcoind"]
