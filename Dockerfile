FROM alpine:latest
MAINTAINER RedOracle

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$VERSION \
      org.label-schema.name='Py3Alpine' \
      org.label-schema.description='Alpine Linux + Python v3.latest docker image' \
      org.label-schema.usage='https://www.kali.org/news/official-kali-linux-docker-images/' \
      org.label-schema.url='https://alpinelinux.org/' \
      org.label-schema.vendor='Alpine' \
      org.label-schema.schema-version='1.0' \
      org.label-schema.docker.cmd='docker run --rm alpine:latest' \
      org.label-schema.docker.cmd.devel='docker run -i --rm --name AlpineCustom -t alpine:latest' \
      org.label-schema.docker.debug='docker logs $CONTAINER' \
      io.github.offensive-security.docker.dockerfile="Dockerfile" \
      io.github.offensive-security.license="GPLv3" \
      MAINTAINER="RedOracle <info@redoracle.com>"
RUN mkdir /datak 
RUN touch /datak/x
VOLUME /datak
RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev libxml2 libxml2-dev&& \
    apk add --no-cache --update python3 && \
    apk update && \
    apk upgrade && \
    pip3 install --upgrade pip setuptools
RUN pip3 install pendulum service_identity  
RUN pip3 install dnspython requests requests-xml lxml
RUN pip3 install scrapy Pillow SQLAlchemy pandas numpy scipy twisted[tls] beautifulsoup4 ipython 

CMD ["sh"]

EXPOSE 8080
