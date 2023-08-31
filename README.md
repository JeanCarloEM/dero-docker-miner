# Build

```console
docker build . -t derohe:latest
```

# Run

### In production

```console
docker -D run -v path-to-data:/data derominer:latest
```

### Ind debug

```console
docker -D run -v path-to-data:/data --rm -i -t derominer:latest /bin/bash
```

# Environmentals and default values

* WALLET="dero1qyg62k4jx2yz775w3k4wh7gv3e68kf8vla702upgdskl6gr40wfggqqpck70r"
* DAEMON="127.0.0.1:10100"
* RELEASE="https://github.com/deroproject/derohe/releases/download/Release140/dero_linux_amd64.tar.gz"
* CORES="4"

### Important

Change wallet address on run