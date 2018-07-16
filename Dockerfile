FROM alpine:3.8

# Patch filesystem
COPY patch /

# Do everything in one RUN command
RUN apk add --no-cache --virtual .build-deps \
    make \
    npm \
    python \
  && apk add --no-cache nodejs curl \
  && npm install -g --unsafe-perm verdaccio@3.2.0 verdaccio-s3-storage@0.0.4 \
  && apk del .build-deps \
  && adduser -D verdaccio \
  && chown -R verdaccio:verdaccio /home/verdaccio

# Set default user/dir
USER verdaccio
WORKDIR /home/verdaccio

# Define ports and health check
EXPOSE 4873
HEALTHCHECK --interval=5m --timeout=5s \
  CMD curl -f http://localhost:4873/ || exit 1

CMD ["verdaccio"]
