FROM node:24-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache git zlib

COPY package.json package-lock.json ./

RUN npm install --production

COPY . .

EXPOSE 4000

CMD ["node", "graphserver.js"]
