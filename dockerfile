FROM alpine:latest

WORKDIR /app

ENV FLASK_APP="main.py"

RUN apk add py3-pip
RUN apk add git
RUN git clone https://gitlab.com/isen5910803/tp02-mock-frontend
RUN python -m pip install -r tp02-mock-frontend/requirements.txt --break-system-packages

EXPOSE 5000

WORKDIR /app/tp02-mock-frontend

# ENTRYPOINT FLASK_APP=main.py flask run --host=0.0.0.0
CMD ["flask", "run", "--host", "0.0.0.0"]