FROM node:8

WORKDIR /usr/src/devsguide

COPY package.json package-lock.json ./

RUN npm install

COPY . ./

EXPOSE 8080

CMD [ "npm", "start" ]