FROM node:14 AS build

WORKDIR DEVOPS-REACT-APP

COPY package*.json ./

RUN npm install

COPY ./ .
RUN npm run build

FROM nginx:alpine
COPY --from=build /DEVOPS-REACT-APP/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]