FROM docker:latest

WORKDIR /usr/src/devsguide

COPY package.json package-lock.json ./

RUN npm install

COPY . ./

EXPOSE 8080

CMD [ "npm", "start" ]