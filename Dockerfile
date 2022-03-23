FROM debian:bullseye-slim

ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
 && apt-get install -y --no-install-recommends postfix bsd-mailx \ 
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY postfix.sh /

EXPOSE 25

CMD ["/bin/bash", "/postfix.sh"]
