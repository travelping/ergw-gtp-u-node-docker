#!/bin/sh

set -e

/etc/ergw-gtp-u-node/pre-start.sh
ergw-gtp-u-node foreground
