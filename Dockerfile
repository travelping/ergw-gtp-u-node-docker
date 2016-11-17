FROM grundrausch3n/ergw-docker-base

WORKDIR /
COPY _build/prod/rel/ /opt/rel/
COPY pre-start.sh /config/ergw-gtp-u-node/
COPY ergw-gtp-u-start.sh /usr/bin/
COPY default-vars.sh /config/ergw-gtp-u-node/
# Copy templates
COPY config/sys.config.templ /config/ergw-gtp-u-node/
COPY config/vm.args.templ /config/ergw-gtp-u-node/

CMD ["ergw-gtp-u-start.sh"]
