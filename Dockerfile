FROM centos:7
ENV container docker

#Instalar apache
RUN yum install httpd -y; 

#Copiar lo que este en la carpeta web dentro de la imagen en la ruta espacificada
COPY web /var/www/html

#variables de entorno
ENV variable "esto es una variable de entorno"
#crear un html con esta varible
RUN echo "$variable" > /var/www/html/variable.html

VOLUME [ "/sys/fs/cgroup" ]

#ejecutar apache en primer plano
CMD apachectl -DFOREGROUND 
#["/usr/sbin/init"]