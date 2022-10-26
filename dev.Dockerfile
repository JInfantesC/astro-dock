# Imagen base
FROM node:19

# Establecemos el working directory
WORKDIR /home/node

# Copiamos los archivos de dependencias para a continuación, instalar
COPY ["package.json", "."]

# Instalamos dependencias
RUN npm install

# Copiamos el código fuente
COPY [".", "."]

USER node

# Ejecutamos el Main Process
CMD ["npm", "run", "dev"]