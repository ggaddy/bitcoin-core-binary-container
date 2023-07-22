FROM registry.fedoraproject.org/fedora-minimal:latest

RUN microdnf -y update && microdnf -y upgrade
RUN microdnf -y install tar gzip
RUN mkdir -p /opt/bitcoin
RUN curl https://bitcoincore.org/bin/bitcoin-core-25.0/bitcoin-25.0.tar.gz -o /opt/bitcoin/bitcoin-25.0.tar.gz
RUN cd /opt/bitcoin && tar -xzf /opt/bitcoin/bitcoin-25.0.tar.gz
RUN rm -f /opt/bitcoin/bitcoin-25.0.tar.gz
RUN ln -s /opt/bitcoin/bitcoin-25.0/bin/bitcoind /usr/local/bin/bitcoind

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["bitcoind"]
