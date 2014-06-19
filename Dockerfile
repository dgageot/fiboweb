FROM google/debian:wheezy
MAINTAINER David Gageot <david@gageot.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get install -yqq python wget

EXPOSE 8000
ENTRYPOINT ["./fiboweb.sh"]
ADD fiboweb.sh /
