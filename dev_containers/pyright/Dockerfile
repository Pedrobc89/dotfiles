FROM alpine

RUN apk add --no-cache \
  nodejs \
  npm \
  && npm install -g \
  pyright

WORKDIR /app

CMD [ "pyright-langserver", "--stdio" ]
