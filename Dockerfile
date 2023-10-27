FROM centos:7
ENV container docker

#Instalar apache
RUN yum install httpd -y; 

COPY web /var/www/html

VOLUME [ "/sys/fs/cgroup" ]

#ejecutar apache en primer plano
CMD apachectl -DFOREGROUND 
#["/usr/sbin/init"]