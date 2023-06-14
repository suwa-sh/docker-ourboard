# ourboard required node-15
FROM node:15-alpine

WORKDIR /opt/ourboard
RUN apk add --no-cache git libc6-compat && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2 && \
    git clone https://github.com/suwa-sh/ourboard.git . && \
    git reset --hard v2023.01.03 && \
    yarn install && yarn build
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
