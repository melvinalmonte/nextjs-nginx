FROM node:alpine

# Set working directory
WORKDIR /app

COPY . .

# Install PM2 globally (PM2 is a daemon process manager that will help keep our node app running)
RUN npm install --global pm2 \
    # Install production dependencies
    && npm install --production \
    # Build the app
    && npm run build

# Expose the listening port
EXPOSE 3000

# Launch app with PM2
CMD [ "pm2-runtime", "start", "npm", "--", "start" ]
