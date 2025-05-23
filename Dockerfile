FROM        almir/webhook:2.8.2 AS builder

FROM        golang:alpine
COPY        --from=builder /usr/local/bin/webhook /usr/local/bin/webhook

RUN : \
    && apk add --update --no-cache -t build-deps \
    ansible \
    git \
    openssh \
    && :

COPY        ./deploy.sh /opt/configurator/deploy.sh
COPY        ./start_webhook.sh /etc/webhook/start_webhook.sh

EXPOSE      9000
ENTRYPOINT  ["/etc/webhook/start_webhook.sh"]
