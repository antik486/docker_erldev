FROM antik486/docker-erl
MAINTAINER antik486 <antik486@gmail.com>

RUN yum -y update; \
    yum -y install ruby ruby-devel rpm-build hostname; \
    yum clean all

RUN git clone https://github.com/basho/rebar.git /tmp/rebar
RUN cd /tmp/rebar; ./bootstrap
RUN mkdir -p /DATA/rebar/; \
    cp /tmp/rebar/rebar /DATA/rebar/; \
    chmod +x /DATA/rebar/rebar; \
    rm -Rf /tmp/rebar;

ENV PATH /DATA/rebar:$PATH

RUN gem install fpm

VOLUME ["/DATA/app"]

WORKDIR /DATA/app

ENTRYPOINT ["bash"]
