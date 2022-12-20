FROM python:alpine3.17

EXPOSE 8000
ENV GUNICORN_CMD_ARGS="--bind=0.0.0.0 --worker-class=gevent -t 99999"

RUN mkdir /usr/app

COPY . /usr/app

WORKDIR /usr/app

RUN pip install -r requirements.txt
ENTRYPOINT ["gunicorn", "app:app"]
