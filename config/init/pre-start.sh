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

ifup upstream 10 ens5 10.102.1.4/16 10.102.1.1
ifup grx 20 ens4 10.101.1.4/16 10.101.1.1

/sbin/sysctl -w net.ipv4.ip_forward=1

exit 0
