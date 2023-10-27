# UDEMY-DOCKER



# COMANDOS
- docker build --tag (name-imagen) . //construye la imagen con el tag name, el punto al final es el docker file como solo
- docker images //lista las imagenes creadas 
- docker history -H (name-imagen:version) //permite ver el historial de ejecució que ah tenido la imagen
- docker rmi (name-imagen)//elimina imagene
- docker rm (name-imagen) //elimina contenedor
- docker ps //lista contenedores 
- docker ps -a //lista todo contenedores imagenes
- docker run -d --name (name-conteiner) -p 80:80 (name-imagen) // ejecuta un contenedor apartir de la imagen, d corra por debajo, --name nombre del contenedor, -p puerto

