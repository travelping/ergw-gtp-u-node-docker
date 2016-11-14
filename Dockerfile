FROM ubuntu:xenial

RUN echo "deb http://ppa.launchpad.net/ergw/xenial/ubuntu xenial main" > /etc/apt/sources.list.d/ergw-xenial-ppa.list
RUN echo "deb http://dl.bintray.com/roadrunnr/ergw xenial main" > /etc/apt/sources.list.d/ergw-xenial-bintray.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 58A14C3D
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 379CE192D401AB61

RUN apt-get update && apt-get -y install iproute2 erlang erlang-asn1 ergw-gtp-u-node nano iptables rebar3 make
WORKDIR /root/
RUN git clone https://github.com/travelping/ergw-gtp-u-node.git
WORKDIR ergw-gtp-u-node
RUN rebar3 compile && rebar3 release
COPY config/init/pre-start.sh /etc/ergw-gtp-u-node/
COPY ergw-gtp-u-start.sh /usr/bin/
COPY default-vars.sh /etc/ergw-gtp-u-node/
COPY config/sys.config /root/ergw-gtp-u-node/_build/default/rel/ergw-gtp-u-node/releases/0.1.0/
COPY config/vm.args /root/ergw-gtp-u-node/_build/default/rel/ergw-gtp-u-node/releases/0.1.0/

CMD ["ergw-gtp-u-start.sh"]
