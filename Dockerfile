# Using a minimal base image for Node.js
ARG NODE_VERSION=current
FROM node:${NODE_VERSION}-alpine
WORKDIR /usr/src/app

# Docker cache
COPY package*.json ./
COPY yarn.lock ./
RUN yarn

# Copy the rest of the application code
COPY . .
RUN yarn postinstall

# Ports used by app, and commands to run app with re-seeded db
EXPOSE 3000
EXPOSE 3001
CMD ["sh", "-c", "yarn predev && yarn dev:docker"]


