#pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
ENV REACT_APP_GRAPHQL_API http://localhost:4000/graphql
ENV REACT_APP_ENV development

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# Exposed for other containers
EXPOSE 3000

# start app
# CMD ["npm", "run", "start-dev", "-p", "3003"]
CMD yarn start -p 3000
