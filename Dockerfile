FROM python:3.6-alpine
ADD . .

RUN apk add --no-cache supervisor && \

    pip install -r ./requirements.txt && \
    python manage.py collectstatic --noinput

ENV PYTHONUNBUFFERED 1

CMD ["/usr/bin/supervisord", "-c", "supervisord.conf"]
