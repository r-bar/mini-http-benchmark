FROM python:3.7

RUN pip install gunicorn[eventlet] gevent falcon

RUN mkdir /app

WORKDIR /app

CMD gunicorn --worker-class eventlet --worker-connections 1000 --bind 0.0.0.0:80 main:app

COPY . .
