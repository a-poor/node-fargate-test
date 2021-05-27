FROM node:latest
WORKDIR /app
RUN npm i
CMD [ "npm", "start" ]