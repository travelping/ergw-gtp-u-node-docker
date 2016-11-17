#!/bin/sh

set -e

. /config/ergw-gtp-u-node/default-vars.sh
#/etc/ergw-gtp-u-node/pre-start.sh
# variable substitution in configuration files
RELPATH=$(find /opt/rel/ergw-gtp-u-node/releases/ -mindepth 1 -maxdepth 1 -type d)
cat /config/ergw-gtp-u-node/sys.config.templ | \
    envsubst > $RELPATH/sys.config
cat /config/ergw-gtp-u-node/vm.args.templ | \
    envsubst > $RELPATH/vm.args

/opt/rel/ergw-gtp-u-node/bin/ergw-gtp-u-node foreground
