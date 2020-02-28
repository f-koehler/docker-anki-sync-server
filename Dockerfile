FROM python:alpine

RUN apk add --no-cache sqlite git build-base portaudio-dev bash

RUN mkdir -p /app/data
VOLUME /app/data
RUN git clone --depth=1 --recursive https://github.com/tsudoko/anki-sync-server.git /app/server

RUN cd /app/server/anki-bundled && pip install -r requirements.txt
RUN pip install webob
COPY ankisyncd.conf /app/server/ankisyncd.conf
COPY start.sh /app/start.sh
RUN ls -lah /app

CMD [ "sh", "/app/start.sh"]
EXPOSE 27701
