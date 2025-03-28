FROM node:alpine

WORKDIR /sre

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3100

CMD ["node", "app.js"]