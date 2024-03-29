### STAGE 1: Build ####
FROM node:17-alpine

# Install build dependencies via apk
# apk update && apk add python g++ make && rm -rf /var/cache/apk/*
#install curl
#RUN apk update && apk add curl

WORKDIR /app

# Install node dependencies - done in a separate step so Docker can cache it
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9

# Copy project files into the image
COPY . /app


EXPOSE 8080
EXPOSE 4200

# Set the startup command to 'npm start'
CMD ["ng","serve","--host", "0.0.0.0","--disable-host-check"]

