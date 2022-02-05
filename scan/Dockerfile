ARG image

FROM $image
WORKDIR /app

COPY ./run.sh .
RUN chmod +x run.sh

CMD ["sh", "/app/run.sh"]