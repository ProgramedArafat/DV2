# Use a base image that supports systemd, for example, Ubuntu
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get install -y systemd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the root password (replace 'your_password' with your desired password)
RUN echo 'root:5689Arafat' | chpasswd

# Expose the SSH port (22)
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]
