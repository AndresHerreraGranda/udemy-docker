FROM centos:7
ENV container docker

#Instalar apache
RUN yum install httpd -y; 

VOLUME [ "/sys/fs/cgroup" ]

#ejecutar apache en primer plano
CMD apachectl -DFOREGROUND 
#["/usr/sbin/init"]