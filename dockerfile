# Use the official Node.js image as a base image to build the application
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application for production
RUN npm run build

# Production environment
FROM httpd:alpine

# Copy the build files from the previous stage to the Apache document root
COPY --from=build /app/dist/ /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80

# The default command to run Apache in the foreground
CMD ["httpd-foreground"]
