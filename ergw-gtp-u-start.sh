#!/bin/sh

set -e

/etc/ergw-gtp-u-node/pre-start.sh
/root/ergw-gtp-u-node/_build/default/rel/ergw-gtp-u-node/releases/bin/ergw-gtp-u-node foreground
