FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl make
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get update
RUN apt-get install -y nodejs
RUN npm install -g yarn
COPY package.json /opt/theia/package.json
WORKDIR /opt/theia
RUN yarn
RUN yarn theia build
CMD yarn theia start