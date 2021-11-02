# ourboard required node-15
FROM node:15-alpine

WORKDIR /opt/ourboard
RUN apk add --no-cache git libc6-compat && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2 && \
    git clone https://github.com/raimohanska/ourboard.git . && \
    yarn install && yarn build
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
