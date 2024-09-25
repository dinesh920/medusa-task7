# Use the official Node.js 16 image as the base
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy only package.json first
COPY package.json ./

# Copy package-lock.json if it exists, otherwise ignore it
# The Dockerfile doesn't attempt to copy a missing file
COPY . .

# Install dependencies using npm, checking if package-lock.json exists
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi

# Copy the rest of the application code
COPY . .

# Build the application (if needed)
RUN npm run build

# Expose the port that the app runs on
EXPOSE 9000

# Start the app
CMD ["npm", "start"]
