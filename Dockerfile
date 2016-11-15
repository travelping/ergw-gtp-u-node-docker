FROM grundrausch3n/ergw-docker-base

WORKDIR /
COPY _build/prod/rel/ /opt/rel/
COPY pre-start.sh /etc/ergw-gtp-u-node/
COPY ergw-gtp-u-start.sh /usr/bin/
COPY default-vars.sh /etc/ergw-gtp-u-node/
COPY config/sys.config.templ /opt/rel/ergw-gtp-u-node/releases/0.1.0/
COPY config/vm.args.templ /opt/rel/ergw-gtp-u-node/releases/0.1.0/

CMD ["ergw-gtp-u-start.sh"]
