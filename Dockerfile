### STAGE 1: Build ####
FROM node:13.5-alpine
WORKDIR /usr/src/app

# Install build dependencies via apk
RUN apk update && apk add python g++ make && rm -rf /var/cache/apk/*

# Install node dependencies - done in a separate step so Docker can cache it
COPY package*.json ./
RUN npm install

# Copy project files into the image
COPY . .

EXPOSE 8080
EXPOSE 4200

# Set the startup command to 'npm start'
CMD ["ng","serve","--host", "0.0.0.0"]

