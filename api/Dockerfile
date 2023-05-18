# Utilisez une image de base avec Python
FROM python:3.9

# Définition du répertoire de travail
WORKDIR /usr/src/worker

ENV CELERY_BROKER_URL=<amqp://queue.internal.100do.se:5672/montagne-verte>
ENV S3_ENDPOINT_URL=https://s3.100do.se/
ENV S3_ACCESS_KEY_ID=montagne-verte
ENV AWS_SECRET_ACCESS_KEY=KRAkHnC65Cn7fwOBinzl

# Copiez le contenu du répertoire actuel dans le répertoire de travail
COPY . .

RUN apt-get update \
    && apt-get install -y curl\
    && pip install --upgrade pip

RUN pip install poetry \
    && poetry install
#   && pip install . \
#   && pip install gunicorn \
#   && gunicorn --workers 4 --bind 0.0.0.0:8080 image_api.web:app



# Exposez le port sur lequel l'application s'exécute
EXPOSE 3000

# Démarrez l'application
CMD ["poetry", "run", "celery", "worker", "--app", "image_api.worker"]
