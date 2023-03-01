FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html



# docker build -t (image-name) .
#  docker run -d -p 8080:80 --name (con-name) (imag-name)

# go to the browser and use the below command,
# localhost:8080