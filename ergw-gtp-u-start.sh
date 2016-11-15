#!/bin/sh

set -e

/etc/ergw-gtp-u-node/default-vars.sh
/etc/ergw-gtp-u-node/pre-start.sh
/opt/rel/ergw-gtp-u-node/releases/bin/ergw-gtp-u-node foreground
