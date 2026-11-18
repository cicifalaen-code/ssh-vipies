FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y openssh-server curl git nano sudo ca-certificates procps figlet neofetch lolcat \
 && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs \
 && mkdir -p /run/sshd && rm -rf /var/lib/apt/lists/*
RUN sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
COPY banner.sh /usr/local/bin/vps
RUN chmod +x /usr/local/bin/vps \
 && echo '[ -t 1 ] && /usr/local/bin/vps' > /etc/profile.d/banner.sh
EXPOSE 22
CMD ["/bin/bash","-c","echo root:$ROOT_PASSWORD | chpasswd && exec /usr/sbin/sshd -D -e"]