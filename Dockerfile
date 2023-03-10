FROM node:12.7-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17.1-alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html


# docker build -t (imageName) .

# docker run -d -p 4000:3000 --name (containerName) (imageName)