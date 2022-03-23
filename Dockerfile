FROM debian:bullseye-slim

ARG DEBIAN_FRONTEND=noninteractive

COPY postfix.sh /

RUN apt-get update \
 && apt-get install -y --no-install-recommends postfix bsd-mailx \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /postfix.sh

EXPOSE 25

CMD ["/postfix.sh"]
