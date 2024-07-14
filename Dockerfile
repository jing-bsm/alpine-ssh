# Use the official Debian base image
FROM debian:latest

# Update the package list and install sudo
RUN apt-get update && apt-get install -y sudo

# Create a new group and user with the specified GID and UID
RUN groupadd -g 1001350000 customgroup && \
    useradd -m -u 1001350000 -g 1001350000 -s /bin/bash user

# Add the user to the sudoers file with no password prompt for sudo
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the new user
USER user

# Set the default command to run when starting the container
CMD ["bash"]
