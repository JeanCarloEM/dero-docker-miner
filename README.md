# Build

```console
docker build . -t ghcr.io/jeancarloem/derohe:latest
```

# Run

### In production

```console
docker run -v ghcr.io/jeancarloem/derohe:latest \
  path-to-data:/data \
  WALLET="<you-wallet>" \
  DAEMON="<daemon-url-and-port>" \
  CORES="4"
```

### In debug

```console
docker -D run -v ghcr.io/jeancarloem/derohe:latest \
  path-to-data:/data \
  WALLET="<you-wallet>" \
  DAEMON="<daemon-url-and-port>" \
  CORES="4"
```
### Important

Change wallet address on run
