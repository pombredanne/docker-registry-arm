#!/bin/sh

# Copy over the registry repo
go get github.com/docker/distribution

# Build the registry for ARMv6
cd /go/src/github.com/docker/distribution/cmd/registry
GOOS=linux GOARCH=arm GOARM=6 go build

# Copy over the registry binary
cp registry /src/registry

# Copy over the most basic configuration
cp config-example.yml /src/config-example.yml

