# build the image with
#
#     docker build -t netstats-client .
#

FROM node:10-jessie as builder
COPY . /src
WORKDIR /src
RUN npm install

FROM node:10-jessie-slim
COPY --from=builder /src /src

ENV WS_SECRET=trustlines
ENV VERBOSITY=2
ENV RPC_HOST=parity
ENV RPC_PORT=8545
ENV HIDE_VALIDATOR_STATUS=true

WORKDIR /src
CMD ["./start.sh"]
