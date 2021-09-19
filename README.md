# bitcoin-core-binary-container
container image of bitcoin core

## build from Dockerfile
podman build -t bitcoin-binary-container:latest .

## tag specific version for recordkeeping
podman tag bitcoin-binary-container:latest bitcoin-binary-container:22.0

## run
podman run -dit --name=bitcoin bitcoin-binary-container

## watch logs from bitcoind
podman exec -it bitcoin bash -c "tail -f ~/.bitcoin/debug.log"
