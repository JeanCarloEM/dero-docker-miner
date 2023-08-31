#!/bin/bash

# CREATE DIR
  [ -d "/data" ] || mkdir "/data"

# GET BINARIES
sudo wget -c $RELEASE  -O - | sudo tar -xz -C /app/

sudo chmod +x /app/dero_linux_amd64/dero-miner-linux-amd64
sudo chmod +x /app/dero_linux_amd64/derod-linux-amd64

cd dero_linux_amd64

# RUN FULL NODE
if [[ "$DAEMON" =~ ^\s*((ftp|http)s?)?(localhost|127.0.0.1) ]]; then
  echo "Running SELF NODE"

  sudo ./derod-linux-amd64 --fastsync --data-dir=/data --integrator-address=$WALLE --rpc-bind=127.0.0.1:10100 &
fi

# RUN WALLET
sudo ./dero-miner-linux-amd64 --mining-threads=$CORES --daemon-rpc-address=$DAEMON --wallet-address $WALLET