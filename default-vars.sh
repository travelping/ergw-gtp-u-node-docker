#!/bin/bash

# creates erlang notation of ip address without netmask
# 192.168.10.1/24 -> 192,168,10,1
ip_erlang() {
    echo $1 | sed 's/\./,/g' - | sed 's/\/.*$//g' -
}

# creates erlang notation of route
# 192.168.10.1/24 -> {192, 168, 10, 1}, 24
route_erlang() {
    echo $1 | sed -e 's/\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\/\([0-9]\{1,2\}\)/{\1, \2, \3, \4}, \5/' -
}

# start general config

export GTP_U_UPSTREAM_TABLE=${GTP_U_UPSTREAM_TABLE:-10}
export GTP_U_UPSTREAM_DEV=${GTP_U_UPSTREAM_DEV:-ens5}
export GTP_U_UPSTREAM_IP4=${GTP_U_UPSTREAM_IP4:-"10.102.1.4/16"}
export GTP_U_UPSTREAM_IP4_ROUTE=${GTP_U_UPSTREAM_IP4_ROUTE:-"10.102.1.1"}

export GTP_U_GRX_TABLE=${GTP_U_GRX_TABLE:-20}
export GTP_U_GRX_DEV=${GTP_U_GRX_DEV:-ens4}
export GTP_U_GRX_IP4=${GTP_U_GRX_IP4:-"10.101.1.4/16"}
export GTP_U_GRX_IP4_ROUTE=${GTP_U_GRX_IP4_ROUTE:-"10.101.1.1"}
export GTP_U_GRX_IP4_ROUTES=${GTP_U_GRX_IP4_ROUTES:-"10.180.0.0/16"}

# GTP-U Config
export GTP_U_GRX_IP4_ERLANG=`ip_erlang $GTP_U_GRX_IP4`
export GTP_U_GRX_IP4_ROUTES_ERLANG=`route_erlang $GTP_U_GRX_IP4_ROUTES`

export GTP_COOKIE="secret"
