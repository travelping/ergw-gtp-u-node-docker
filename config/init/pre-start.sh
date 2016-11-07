#!/bin/sh

ip netns add upstream
ip link set dev ens5 netns upstream
ip -n upstream addr flush dev ens5
ip -n upstream link set dev ens5 up
ip -n upstream addr add 10.102.1.4/24 dev ens5
ip -n upstream route add default via 10.102.1.1
ip netns exec upstream iptables -t nat -F POSTROUTING
ip netns exec upstream iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
# ip netns exec upstream iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1300
ip netns exec upstream /sbin/sysctl -w net.ipv4.ip_forward=1

ip netns add grx
ip link set dev ens4 netns grx
ip -n grx addr flush dev ens4
ip -n grx link set dev ens4 up
ip -n grx addr add 10.101.1.4/24 dev ens4
ip -n grx route add default via 10.101.1.4

exit 0
