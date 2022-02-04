FROM python:3.9.10 AS build-env
#-alpine3.15

#RUN pip3 install 'git+https://github.com/keton/etrv2mqtt.git'
RUN python -m pip wheel --wheel-dir=/tmp/wheelhouse 'git+https://github.com/keton/etrv2mqtt.git'

FROM python:3.9.10-alpine3.15
WORKDIR /app
COPY --from=build-env /tmp/ /tmp/

RUN apk add --no-cache git

RUN pip3 install pyrsistent
RUN python -m pip install --no-index --find-links=/tmp/wheelhouse 'git+https://github.com/keton/etrv2mqtt.git'

RUN apk del git
RUN rm -rf /tmp

CMD [ "etrv2mqtt", "/data/options.json" ]