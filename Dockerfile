FROM skazuki/alpine

LABEL maintainer="S-Kazuki<contact@revoneo.com>"

COPY docker-entrypoint.sh /mongodb/
COPY ./db /data/db

RUN chmod +x /mongodb/docker-entrypoint.sh \
  && apk update \
  && apk add mongodb \
  && rm -rf /var/cache/apk/*

ENTRYPOINT [ "/mongodb/docker-entrypoint.sh" ]

CMD [ "mongod", "--bind_ip", "0.0.0.0" ]
