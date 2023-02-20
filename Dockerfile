# Base image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY ./ ./

# Install only production dependencies
RUN npm install

RUN npm run build

# Copy compiled files
COPY dist/ dist/

# Expose port
EXPOSE 3000

# Start the app
CMD ["node", "./dist/index.js"]