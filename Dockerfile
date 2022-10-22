# syntax=docker/dockerfile:experimental
FROM alpine
# install ssh client and git
RUN apk add --no-cache openssh-client git docker
# download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# clone our private repository
RUN --mount=type=ssh git clone git@github.com:kingachwaleba/simpleweb.git ~/simpleweb