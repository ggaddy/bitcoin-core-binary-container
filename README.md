# bitcoin-core-binary-container
Container image of bitcoin core. Tested to work with podman on Fedora and docker on OSX.

## build from Dockerfile
`podman build -t bitcoin-binary-container:latest .`

## tag specific version for recordkeeping
`podman tag bitcoin-binary-container:latest bitcoin-binary-container:28.1`

## run
`podman run -dit -v /storage/bitcoin:/root/.bitcoin --name=bitcoin bitcoin-binary-container:latest`

## watch logs from bitcoind
`podman logs -f bitocin`
