#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# CREATE DIR
[ -d "/data" ] || mkdir "/data"

echo -e "${YELLOW}Lista do diretório /app/${NC}" && ls -la /app/

cd */ && echo -e "${YELLOW}Lista do diretório /app/*/${NC}" && ls -la ./

[ -z "$WALLET" ] && { echo -e "${RED}Environment WALLET is empty${NC}" ; exit 1 ; }
[ -z "$DAEMON" ] && { echo -e "${RED}Environment DAEMON is empty${NC}" ; exit 2 ; }

echo -e "${YELLOW}Running miner...${NC}"

[[ -z "$DAEMON" ]] && { DAEMON="127.0.0.1:10100" }

# RUN FULL NODE
if [[ "$DAEMON" =~ ^\s*((ftp|http)s?)?(localhost|127.0.0.1) ]]; then
  echo -e "${YELLOW}Running SELF NODE${NC}"

  sudo ./derod-linux-amd64 --fastsync --data-dir=/data --integrator-address=$WALLE --rpc-bind=$DAEMON &

fi

# RUN WALLET
sudo ./dero-miner-linux-amd64 --mining-threads=$CORES --daemon-rpc-address=$DAEMON --wallet-address $WALLET