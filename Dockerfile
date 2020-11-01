# build
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# run phase - nginx starts on its own
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html