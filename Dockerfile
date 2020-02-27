FROM python:alpine

RUN apk add --no-cache sqlite git build-base portaudio-dev bash

RUN mkdir /app
RUN git clone --depth=1 --recursive https://github.com/tsudoko/anki-sync-server.git /app/server
VOLUME /app/data

RUN cd /app/server/anki-bundled && pip install -r requirements.txt
RUN pip install webob
COPY ankisyncd.conf /app/data/ankisyncd.conf
COPY start.sh /app/start.sh
RUN ls -lah /app

CMD [ "sh", "/app/start.sh"]
EXPOSE 27701
