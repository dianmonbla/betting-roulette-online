FROM node:12

# Install pm2 applicaction balance
RUN npm install pm2 -g

# Create app directory
WORKDIR /usr/src/app

# Environment variables
ENV NODE_ENV=null
ENV PORT=3000
ENV STRIP_TAGS_JSONP=")]}',\n"
ENV URL_DATABASE="mongodb://localhost:27017"
ENV NAME_DATABASE="betting-roulette"

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "pm2-runtime", "bin/www" ]