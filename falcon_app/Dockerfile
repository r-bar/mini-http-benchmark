FROM python:3.7-alpine

RUN pip install gunicorn falcon

RUN mkdir /app

WORKDIR /app

CMD gunicorn --worker-connections 1000 --bind 0.0.0.0:80 main:app

COPY . .
