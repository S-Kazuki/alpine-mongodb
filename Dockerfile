FROM alpine:edge

LABEL maintainer="S-Kazuki<contact@revoneo.com>"

COPY docker-entrypoint.sh /mongodb/
COPY ./db /data/db

RUN chmod +x /mongodb/docker-entrypoint.sh \
&& apk update \
&& apk add mongodb \
&& rm /usr/bin/mongoperf \
&& rm -rf /var/cache/apk/* \
\
&& apk update \
&& apk add tzdata \
&& TZ=${TZ:-Asia/Tokyo} \
&& cp /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ> /etc/timezone \
&& rm -rf /var/cache/apk/*

ENTRYPOINT [ "/mongodb/docker-entrypoint.sh" ]

CMD [ "mongod", "--bind_ip", "0.0.0.0" ]
