FROM centos:7
ENV container docker

#agregar metadata
LABEL version=1.0
LABEL description="This is an apache imagen"
LABEL vendor="andres"

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

#Colocar data persistente en el contenedor, para que cuando se elimine permanezca
VOLUME [ "/var/www/html" ]
VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 8080

#guardar usuario actual en html
RUN echo "$(whoami)" > ./user1.html
#crear nuevo usuario en la imagen 
RUN useradd andres
#dar permisos de admin
RUN chown andres .
#establecer usuario en la imagen 
USER andres
#guardar usuario actual en html
RUN echo "$(whoami)" > /tmp/user2.html
#establecer usuario root nuevamente para poder escribir como administrador
USER root
#ya que es si puede copiar como administrador agregarlo en la ruta apache www
RUN cp /tmp/user2.html /var/www/html/user2.html

#ejecutar apache en primer plano
CMD apachectl -DFOREGROUND 
#["/usr/sbin/init"]