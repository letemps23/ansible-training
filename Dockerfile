FROM ubuntu:latest

# Installer OpenSSH
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Configurer SSH pour permettre la connexion avec un mot de passe
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Exposer le port SSH
EXPOSE 22

# Commande pour démarrer le service SSH
CMD ["/usr/sbin/sshd", "-D"]

