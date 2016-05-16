# https://github.com/darinmorrison/docker-haskell/tree/docker-library
# FROM haskell:7.8


FROM node:6.1

RUN apt-get update && apt-get install -y \
	curl

RUN apt-get update && \
    apt-get install -y wget libgmp3-dev zlib1g-dev && \
    cd / && \
    wget https://haskell.org/platform/download/7.10.3/haskell-platform-7.10.3-unknown-posix-x86_64.tar.gz
RUN tar xf /haskell-platform-7.10.3-unknown-posix-x86_64.tar.gz
RUN sh /install-haskell-platform.sh && \
    rm /haskell-platform-7.10.3-unknown-posix-x86_64.tar.gz && \
    cabal update && cabal install --global cabal-install && \
    apt-get clean

RUN npm install -g gulp
RUN npm install -g jspm

CMD ["bash"]
