FROM centos:latest
MAINTAINER Boro <docker@bo.ro>

# install crontabs
RUN yum -y update
RUN yum -y install crontabs nano git python

# Fix: "TERM environment variable not set." error when entering the container with bash
RUN echo "export TERM=xterm" >> /etc/bash.bashrc

# change timezone to JST
RUN cp /usr/share/zoneinfo/America/Toronto /etc/localtime

# comment out PAM
RUN sed -i -e '/pam_loginuid.so/s/^/#/' /etc/pam.d/crond

RUN chmod 0644 /etc/crontab

# Add crontab setting
# # RUN echo '* * * * * root /path/to/your/command' >> /etc/crontab

CMD /start.sh