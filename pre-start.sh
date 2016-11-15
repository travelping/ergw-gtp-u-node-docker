#!/bin/sh

ifup() {
    /sbin/ip link add $1 type vrf table $2
    /sbin/ip link set dev $1 up
    /sbin/ip rule add oif $1 table $2
    /sbin/ip rule add iif $1 table $2

    /sbin/ip link set dev $3 master $1
    /sbin/ip link set dev $3 up
    /sbin/ip addr flush dev $3
    /sbin/ip addr add $4 dev $3
    /sbin/ip route add table $2 default via $5
}

ifup upstream $GTP_U_UPSTREAM_TABLE $GTP_U_UPSTREAM_DEV $GTP_U_UPSTREAM_IP4 $GTP_U_UPSTREAM_IP4_ROUTE
ifup grx $GTP_U_GRX_TABLE $GTP_U_GRX_DEV $GTP_U_GRX_IP4 $GTP_U_GRX_IP4_ROUTE

/sbin/sysctl -w net.ipv4.ip_forward=1

exit 0
