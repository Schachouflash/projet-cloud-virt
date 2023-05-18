# Utilisez une image de base avec Python
FROM python:3

# Définition du répertoire de travail
WORKDIR /usr/src/worker

ENV CELERY_BROKER_URL=<amqp://queue.internal.100do.se:5672/montagne-verte>
ENV S3_ENDPOINT_URL=https://s3.100do.se/
ENV AWS_ACCESS_KEY_ID=SYGfsmxDJjfK3qvT
ENV AWS_SECRET_ACCESS_KEY=271rXk6sh9di86BPlY5mylJlk9GmiwGf

# Copiez le contenu du répertoire actuel dans le répertoire de travail
COPY . .

RUN pip install poetry \
    && pip install . \
    && poetry install

# Exposez le port sur lequel l'application s'exécute
EXPOSE 8080 

# Démarrez l'application
CMD ["poetry", "run", "app"]
