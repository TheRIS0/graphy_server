FROM node:24-bookworm-slim

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        zlib1g zlib1g-dev \
        libpam-modules libpam-modules-bin \
        python3 && \
    rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./

RUN npm install --production

COPY . .

EXPOSE 4000

CMD ["node", "graphserver.js"]
