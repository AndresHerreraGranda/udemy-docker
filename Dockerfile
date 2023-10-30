FROM centos:7
ENV container docker

#Instalar apache
RUN yum install httpd -y; 

#Directorio de trabajo, se configura por defecto el directorio inicial de la imagen
#en este caso se configura /var/www/html -> ya que es el directorio en apache para subir el contenido html
WORKDIR /var/www/html

#Copiar lo que este en la carpeta web dentro de la imagen en la ruta especificada, en esta caso es un punto ya que se configuro el WORKDIR
COPY web .

#variables de entorno
ENV variable "esto es una variable de entorno"
#crear un html con esta varible en el directorio especificado teniendo encuenta el WORKDIR
RUN echo "$variable" > ./variable.html

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 8080

#ejecutar apache en primer plano
CMD apachectl -DFOREGROUND 
#["/usr/sbin/init"]