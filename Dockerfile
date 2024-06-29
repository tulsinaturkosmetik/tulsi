# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Create the target directory
RUN mkdir -p /var/www/html

# Copy files from the current directory (context) to /var/www/html
COPY . /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Start the Apache web server
CMD ["apachectl", "-D", "FOREGROUND"]
