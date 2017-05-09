FROM scratch

WORKDIR /src
COPY registry /src
COPY config-example.yml /etc/docker/registry/config.yml

VOLUME ["/var/lib/registry"]

EXPOSE 5000

ENTRYPOINT ["/src/registry"]

CMD ["serve", "/etc/docker/registry/config.yml"]

