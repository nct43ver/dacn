#stage - 0
FROM node:16.17-alpine

# # #ENV NODE_ENV=production
WORKDIR /usr/app
# # #RUN npm install --global pm2
COPY ["package.json","package-lock.json", "./"]
RUN apk add --no-cache git openssh
RUN yarn install
COPY . .
RUN yarn run build
EXPOSE 80
# # #USER node
CMD ["yarn","start"]
# # #CMD ["pm2-runtime","yarn", "--", "dev"]

# #stage - 1
# FROM nginx:alpine

# # Remove any existing config files
# RUN rm /etc/nginx/conf.d/*

# # Copy config files
# # *.conf files in "conf.d/" dir get included in main config
# COPY ./nginx.conf /etc/nginx/conf.d/

# # Expose the listening port
# EXPOSE 80

# # Launch NGINX
# CMD [ "nginx", "-g", "daemon off;" ]

# #FROM node:alpine

# # Set working directory
# WORKDIR /usr/app

# # Install PM2 globally
# #RUN npm install --global pm2

# # Copy "package.json" and "package-lock.json" before other files
# # Utilise Docker cache to save re-installing dependencies if unchanged
# COPY ./package*.json ./
# RUN apk add --no-cache git openssh
# # Install dependencies
# RUN yarn install

# # Copy all files
# COPY ./ ./

# # Build app
# #RUN yarn run build

# # Expose the listening port
# EXPOSE 3000

# # Run container as non-root (unprivileged) user
# # The "node" user is provided in the Node.js Alpine base image
# #USER node

# CMD ["yarn","dev"]
# # Launch app with PM2
# #CMD [ "pm2-runtime", "start", "yarn", "--", "dev" ]
# #CMD [ "pm2-runtime", "start", ".next/server/pages/_app.js" ]


# # Stage 0 - Build Frontend Assets
# FROM node:16.17 as build

# WORKDIR /app
# COPY package*.json ./
# RUN yarn global add truffle
# RUN yarn global add ganache-cli
# #RUN apk add --no-cache git openssh
# #RUN ganache-cli -u 0 --gasLimit 6721975 --gasPrice 100000000000
# RUN yarn add -D web3
# RUN yarn install
# COPY . .
# #RUN truffle develop
# RUN truffle compile
# RUN truffle migrate --network development
# RUN yarn run build
# #CMD ["truffle", "migrate", "--network", "development"]
# #CMD ["yarn","dev"]

# # Stage 1 - Serve Frontend Assets
# FROM fholzer/nginx-brotli:v1.12.2

# WORKDIR /etc/nginx
# ADD nginx.conf /etc/nginx/nginx.conf

# COPY --from=build /app/build/contracts/ /usr/share/nginx/html
# #RUN truffle migrate --network development
# EXPOSE 443
# CMD ["nginx", "-g", "daemon off;"]

