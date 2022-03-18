# this file is production build
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# first block already success

FROM nginx
EXPOSE 80

# copy build folder into nginx html path
COPY --from=builder /app/build /usr/share/nginx/html



