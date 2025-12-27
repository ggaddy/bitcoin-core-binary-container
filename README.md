# bitcoin-core-binary-container
Container image of bitcoin core. Tested to work with podman on Fedora and docker on OSX.

## build from Dockerfile
`podman build -t bitcoin-binary-container:28.3 .`

## run with a persistent volume

`mkdir -p ~/bitcoin && podman run -dit -v ~/bitcoin:/home/bitcoind/.bitcoin:Z,U --name=bitcoin localhost/bitcoin-binary-container:28.3`

## watch logs from bitcoind
`podman logs -f bitcoin`
