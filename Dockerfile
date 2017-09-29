FROM ubuntu:xenial


RUN apt-get update
RUN apt-get install -y \
curl \
xz-utils \
ca-certificates \
dirmngr \
--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN curl -SLO "https://nodejs.org/dist/v8.4.0/node-v8.4.0-linux-x64.tar.xz"
RUN tar -xJf "node-v8.4.0-linux-x64.tar.xz" -C /usr/local --strip-components=1
RUN rm "node-v8.4.0-linux-x64.tar.xz"
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update
RUN apt-get install -y mongodb-org

WORKDIR /usr/src/devsguide

COPY package.json package-lock.json ./

RUN npm install

COPY . ./

EXPOSE 8080

CMD [ "npm", "start" ]