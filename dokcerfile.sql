FROM alpine:latest

RUN apk --no-cache add curl mailx

COPY check-server.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/check-server.sh

CMD ["/usr/local/bin/script.sh"]
