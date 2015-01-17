FROM antik486/erl
MAINTAINER antik486 <antik486@gmail.com>

RUN yum -y update; yum clean all

RUN git clone https://github.com/basho/rebar.git /tmp/rebar
RUN cd /tmp/rebar; ./bootstrap
RUN mkdir -p /DATA/rebar/; \
    cp /tmp/rebar/rebar /DATA/rebar/; \
    chmod +x /DATA/rebar/rebar; \
    rm -Rf /tmp/rebar;

ENV PATH /DATA/rebar:$PATH

VOLUME ["/DATA/app"]

WORKDIR /DATA/app

ENTRYPOINT ["bash"]
