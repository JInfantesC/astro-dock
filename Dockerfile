# Define una "stage" o fase llamada builder accesible para la siguiente fase
FROM node:19 as builder

WORKDIR /home/node

# copiamos solo los archivos necesarios
COPY ["package.json", "."]

# Instalamos solo las dependencias para Pro definidas en package.json. Al hacer esto, podemos reusar las capas en la imagen productiva.
RUN npm install --only=production

COPY [".", "."]

USER node
# Build en ./dist
RUN npm run build


# Productive image
FROM nginx:1.23

# Copiar el directorio de la imagen anterior.
COPY --from=builder ["/home/node/dist/", "/usr/share/nginx/html"]
