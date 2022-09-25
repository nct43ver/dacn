FROM node:16.17-alpine
# #ENV NODE_ENV=production
# WORKDIR /usr/app
# #RUN npm install --global pm2
# COPY ["package.json","package-lock.json","yarn.lock", "./"]
# #RUN apk add --no-cache git openssh
# RUN yarn install
# COPY . .
# RUN yarn run build
# #EXPOSE 3000
# #USER node
# CMD ["yarn","dev"]
# #CMD ["pm2-runtime","yarn", "--", "dev"]

# #FROM httpd:2.4
# #COPY --from=build /app /usr/local/apache2/htdocs/
# #EXPOSE 443

# # #FROM nginx:alpine
# # FROM fholzer/nginx-brotli:v1.12.2
# # #RUN rm /etc/nginx/conf.d/*

# # WORKDIR /etc/nginx
# # ADD /nginx/nginx.conf /etc/nginx/nginx.conf

# # COPY --from=build /usr/app/build /usr/share/nginx/html
# # EXPOSE 443
# # CMD ["nginx","-g","daemon off;"]

#FROM node:alpine

# Set working directory
WORKDIR /usr/app

# Install PM2 globally
#RUN npm install --global pm2

# Copy "package.json" and "package-lock.json" before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY ./package*.json ./
RUN apk update
RUN apk add git openssh
# Install dependencies
RUN yarn install

# Copy all files
COPY ./ ./

# Build app
#RUN yarn run build

# Expose the listening port
EXPOSE 3000

# Run container as non-root (unprivileged) user
# The "node" user is provided in the Node.js Alpine base image
#USER node

CMD ["yarn","dev"]
# Launch app with PM2
#CMD [ "pm2-runtime", "start", "yarn", "--", "dev" ]
#CMD [ "pm2-runtime", "start", ".next/server/pages/_app.js" ]
