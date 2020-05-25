# #pull official base image
# FROM node:13.12.0-alpine

# # ENV DEBIAN_FRONTEND noninteractive


# # set working directory
# WORKDIR /app

# # add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH
# ENV REACT_APP_GRAPHQL_API http://localhost:4000/graphql
# ENV REACT_APP_ENV development

# # install app dependencies
# COPY package.json ./
# COPY yarn.lock ./
# RUN npm install --silent
# RUN npm install react-scripts@3.4.1 -g --silent

# # add app
# COPY . ./

# # Exposed for other containers
# # EXPOSE 3000

# # start app
# CMD ["npm", "run", "start", "-p", "3000"]
# # CMD yarn start -b 0.0.0.0 -p 3000
# #
# # ENV DEBIAN_FRONTEND teletype
#----------------------------



# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY yarn.lock ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# start app
CMD ["yarn", "start", "-b", "0.0.0.0", "-p", "3001"]
