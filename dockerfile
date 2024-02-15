FROM alpine:latest

WORKDIR /app

ENV FLASK_APP="main.py"

RUN apk add py3-pip
RUN apk add git
RUN git clone https://github.com/Benjamin-htr/tp_05_devops_ISEN
RUN python -m pip install -r tp_05_devops_ISEN/requirements.txt --break-system-packages

EXPOSE 5001

WORKDIR /app/tp_05_devops_ISEN

# ENTRYPOINT FLASK_APP=main.py flask run --host=0.0.0.0
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5001"]