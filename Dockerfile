FROM python:3.9.10-slim-bullseye

RUN apt update && apt install --no-install-recommends git build-essential pkgconf libglib2.0-dev libglib2.0-0 -y\
    && pip3 install 'git+https://github.com/keton/etrv2mqtt.git'\
    && rm -rf /var/lib/apt/lists/*\
    && apt purge git build-essential pkgconf libglib2.0-dev -y\
    && apt autoremove -y

WORKDIR /app

CMD [ "etrv2mqtt", "/data/options.json" ]