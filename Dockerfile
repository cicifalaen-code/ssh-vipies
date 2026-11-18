FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y openssh-server curl git nano sudo ca-certificates \
 && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs \
 && mkdir -p /run/sshd && rm -rf /var/lib/apt/lists/*
RUN sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/bin/bash","-c","echo root:$ROOT_PASSWORD | chpasswd && exec /usr/sbin/sshd -D -e"]