# build stage
FROM node:9.11.1-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN yarn install
COPY . .
RUN yarn build

# production stage
FROM node:9.11.1-alpine as production-stage
WORKDIR /app
COPY --from=build-stage /app/package.json /app/package.json
RUN npm install --production

COPY --from=build-stage /app/dist /app/dist
COPY --from=build-stage /app/static/* /app/dist/
COPY --from=build-stage /app/server.js /app/server.js

EXPOSE 5000
CMD ["npm", "start"]
