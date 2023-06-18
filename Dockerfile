FROM alpine
RUN apk add --update sqlite bash && rm -rf /var/cache/apk/*
COPY dump.sh /
ENTRYPOINT ["/dump.sh"]
