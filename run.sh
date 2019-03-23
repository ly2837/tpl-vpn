set -e

apt update
apt install -f docker.io
rm -rf vpn.tar
xz -d -k vpn.tar.xz
docker load -i vpn.tar
docker stop ipsec-vpn-server
docker rm ipsec-vpn-server
docker run \
    --name ipsec-vpn-server \
    --env-file ./vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server
