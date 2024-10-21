FROM node:18-alpine3.18
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /app
COPY package.json ./
RUN npm install -g node-gyp
RUN npm install

COPY . .

RUN ["npm", "run", "build"]
EXPOSE 1337
CMD ["npm", "run", "develop"]