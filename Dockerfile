# Use the official Node.js 16 image as the base
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json first to install dependencies
COPY package.json ./

# Copy package-lock.json if it exists (optional)
# This command is ignored if package-lock.json doesn't exist
COPY package-lock.json ./ || true

# Install dependencies using npm
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application (if needed)
RUN npm run build

# Expose the port that the app runs on
EXPOSE 9000

# Start the app
CMD ["npm", "start"]
