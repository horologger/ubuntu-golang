# Ubuntu for go

To build this image run this command and replace <version> with the go version:

```shell
docker build --build-arg GO_VERSION=<version> -t ubuntu-go .
```

# Build and push to docker hub
```
docker buildx build --build-arg GO_VERSION=1.16 --platform linux/arm64,linux/amd64 --tag horologger/ubuntu-go:v1.16 --output "type=registry" .
```

```
BUILDPLATFORM — matches the current machine. (e.g. linux/amd64)

BUILDOS — os component of BUILDPLATFORM, e.g. linux

BUILDARCH — e.g. amd64, arm64, riscv64

BUILDVARIANT — used to set ARM variant, e.g. v7

TARGETPLATFORM — The value set with --platform flag on build

TARGETOS - OS component from --platform, e.g. linux

TARGETARCH - Architecture from --platform, e.g. arm64

TARGETVARIANT
```
