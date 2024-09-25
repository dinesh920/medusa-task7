# Use the official Node.js 16 image as the base
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json (ignore package-lock.json if it doesn't exist)
COPY package.json ./

# Install dependencies, including devDependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port that the app runs on
EXPOSE 9000

# Start the app
CMD ["npm", "start"]
