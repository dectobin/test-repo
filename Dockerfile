FROM python:3.12-alpine

RUN pip install --no-cache-dir glances bottle

EXPOSE 61208

ENTRYPOINT ["glances", "-w"]
