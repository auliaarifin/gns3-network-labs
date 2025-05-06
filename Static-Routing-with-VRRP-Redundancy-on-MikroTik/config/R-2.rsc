# 2025-05-06 06:34:09 by RouterOS 7.16
# software id = 
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/interface vrrp
add interface=ether2 name=vrrp1 priority=89 vrid=80
/ip pool
add name=dhcp_pool0 ranges=172.0.0.1-172.0.0.124
/port
set 0 name=serial0
/ip address
add address=172.0.0.2/25 interface=ether2 network=172.0.0.0
add address=10.10.10.1/30 interface=ether8 network=10.10.10.0
add address=172.0.0.125/25 interface=vrrp1 network=172.0.0.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server
add address-pool=dhcp_pool0 interface=vrrp1 name=dhcp1
/ip dhcp-server network
add address=172.0.0.0/25 dns-server=1.1.1.1 gateway=172.0.0.125
/ip dns
set servers=1.1.1.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add disabled=no dst-address=172.1.0.0/24 gateway=10.10.10.2 routing-table=\
    main suppress-hw-offload=no
/system identity
set name=R-2
/system note
set show-at-login=no
