FROM centos:7
LABEL maintainer="Yo mismo"

RUN yum update -y && \
    yum install -y wget && \
    yum install -y epel-release && \
    yum install -y  httpd php php-mysql redis && \
    wget https://wordpress.org/latest.tar.gz && \
    tar xvzf /latest.tar.gz -C /var/www/html && \
    mv /var/www/html/wordpress/* /var/www/html/ && \
    ln -sf /dev/stderr /var/log/httpd/error.log && \
    yum clean all 
#ENTRYPOINT ["/usr/sbin/apachectl","-D","FOREGROUND"]
#CMD ["-DFOREGROUND"]
ENTRYPOINT ["/bin/bash"]
EXPOSE 80
