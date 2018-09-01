FROM ubuntu:18.04
LABEL org.label-schema.name="Tor Relay" \
      org.label-schema.description="Tor Relay Bootstrap" \
      org.label-schema.vcs-url="https://github.com/tigefa4u/tor-relay-bootstrap" \
      org.label-schema.vendor="Sugeng Tigefa" \
      org.label-schema.schema-version="1.0" \
      maintainer="tigefa@gmail.com"

COPY . /bd_build

RUN /bd_build/prepare.sh && \
	/bd_build/system_services.sh && \
	/bd_build/utilities.sh && \
	/bd_build/bootstrap.sh && \
	/bd_build/cleanup.sh

ENV DEBIAN_FRONTEND="teletype" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"

CMD ["/sbin/my_init"]
