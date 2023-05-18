# Utilisez une image de base avec Node.js
FROM node:latest

# Définition du répertoire de travail
WORKDIR .

# Copiez les fichiers package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installez les dépendances du projet
RUN npm install

RUN npm ci
# Copiez le reste des fichiers du projet dans le répertoire de travail
COPY . .

RUN npm run build .
# Exposez le port sur lequel l'application s'exécute
EXPOSE 3000

# Démarrez l'application
CMD ["npm", "run", "start"]
