FROM node:6.3.1

# Update date to rebuild cached image
ENV REFRESHED_AT 2016-08-02

# File Author / Maintainer
MAINTAINER Jeff Deskins


# Logging
RUN npm install -g bunyan

RUN mkdir /src

WORKDIR /src

# Provides cached layer for node_modules
COPY package.json /src/package.json
RUN npm install

COPY . /src

EXPOSE  8080

# Run app
CMD ["node", "index.js"]
