# Utilisez une image de base avec Python
FROM python:latest

# Définition du répertoire de travail
WORKDIR /usr/src/worker

ENV CELERY_BROKER_URL=<amqp://queue.internal.100do.se:5672/montagne-verte>
ENV S3_ENDPOINT_URL=https://s3.100do.se/
ENV AWS_ACCESS_KEY_ID=montagne-verte
ENV AWS_SECRET_ACCESS_KEY=KRAkHnC65Cn7fwOBinzl

# Copiez le contenu du répertoire actuel dans le répertoire de travail
COPY . .

RUN pip install . \
    && pip install celery

# Exposez le port sur lequel l'application s'exécute
EXPOSE 8080 
# Démarrez l'application
CMD ["/usr/local/bin/celery", "--app", "image_api.worker.app", "worker"]
