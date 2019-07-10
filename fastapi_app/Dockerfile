FROM python:3.7

RUN pip install gunicorn fastapi uvicorn

RUN mkdir /app

WORKDIR /app

CMD gunicorn \
  --worker-connections 1000 \
  --worker-class uvicorn.workers.UvicornWorker \
  --bind 0.0.0.0:80 \
  main:app

COPY . .
