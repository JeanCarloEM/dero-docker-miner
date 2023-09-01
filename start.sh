#!/bin/bash

# CREATE DIR
[ -d "/data" ] || mkdir "/data"

echo "Lista de arquivos"
ls -la /app/

cd */

# RUN FULL NODE
if [[ "$DAEMON" =~ ^\s*((ftp|http)s?)?(localhost|127.0.0.1) ]]; then
  echo "Running SELF NODE"

  sudo bash ./derod-linux-amd64 --fastsync --data-dir=/data --integrator-address=$WALLE --rpc-bind=127.0.0.1:10100 &
fi

# RUN WALLET
sudo bash ./dero-miner-linux-amd64 --mining-threads=$CORES --daemon-rpc-address=$DAEMON --wallet-address $WALLET