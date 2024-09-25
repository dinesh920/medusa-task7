# Use the official Node.js 16 image as the base
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json if available
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install

# Copy the rest of your Medusa project files into the container
COPY . .

# Build the Medusa app (optional for production builds)
RUN npm run build

# Expose the port that Medusa will run on
EXPOSE 9000

# Start the Medusa server
CMD ["npm", "start"]

