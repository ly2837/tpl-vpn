docker run \
    --name ipsec-vpn-server \
    --env-file ./vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server

docker logs ipsec-vpn-server


https://github.com/hwdsl2/docker-ipsec-vpn-server/blob/master/README-zh.md
