FROM      debian:jessie

MAINTAINER Patrick White <whitep@vcu.edu>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.6-1~jessie

RUN apt-get update

# install deps
RUN apt-get install -y git golang ca-certificates nginx=${NGINX_VERSION} && \
rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# clone logstash-forwarder
RUN git clone https://github.com/elastic/logstash-forwarder.git /tmp/logstash-forwarder
RUN cd /tmp/logstash-forwarder && git checkout v0.3.1 && go build

RUN mkdir /opt/forwarder && cp /tmp/logstash-forwarder/logstash-forwarder /opt/forwarder/logstash-forwarder

ADD start_forwarder.sh /usr/local/bin/start_forwarder.sh
RUN chmod 755 /usr/local/bin/start_forwarder.sh

RUN rm -rf /tmp/*

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD /usr/local/bin/start_forwarder.sh ; ["nginx", "-g"]
