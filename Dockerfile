FROM docker.io/mgoltzsche/podman:rootless

RUN apk update && apk add --no-cache shadow
# Update the package list and install sudo
RUN mkdir -p /.config /podman/.local && chmod a+w -R /.config /podman/.local

# Create a new group and user with the specified GID and UID
RUN groupadd -g 1001350000 customgroup && \
    useradd -m -u 1001350000 -g 1001350000 -s /bin/bash user

RUN usermod -aG podman user && chmod a+w -R / || echo


# Switch to the new user
USER user

# Set the default command to run when starting the container
CMD ["bash"]
