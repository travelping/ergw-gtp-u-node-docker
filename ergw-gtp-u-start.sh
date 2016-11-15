#!/bin/sh

set -e

. /etc/ergw-gtp-u-node/default-vars.sh
#/etc/ergw-gtp-u-node/pre-start.sh
cat /opt/rel/ergw-gtp-u-node/releases/0.1.0/sys.config.templ | \
    envsubst > /opt/rel/ergw-gtp-u-node/releases/0.1.0/sys.config
cat /opt/rel/ergw-gtp-u-node/releases/0.1.0/vm.args.templ | \
    envsubst > /opt/rel/ergw-gtp-u-node/releases/0.1.0/vm.args

/opt/rel/ergw-gtp-u-node/releases/bin/ergw-gtp-u-node foreground
