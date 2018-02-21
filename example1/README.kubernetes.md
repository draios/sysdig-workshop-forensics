To run this in Kubernetes configure your kubectl and just run `./create.sh`.

Since we don't want to expose vulnerable apps to the internet, for training we will run the attacker commands from a pod within the same namespace:

```
kubectl run -it --rm --image=tutum/curl client --namespace=ping --restart=Never
If you don't see a command prompt, try pressing enter.
root@client:/# curl -F "s=OK" -F "user=bob" -F "passwd=foobar" -F "ipaddr=localhost" -X POST http://ping/ping.php

<form action="" method="post">
<table width="50%">
    <tr>
        <td>User</td>
        <td><input type="text" name="user"></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><input type="text" name="passwd"></td>
    </tr>
    <tr>
        <td>Ping IP address</td>
        <td><input type="text" name="ipaddr"></td>
    </tr>
</table>
    <input type="submit" value="OK" name="s">
</form>

<pre>PING localhost (127.0.0.1): 56 data bytes
64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.037 ms
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.044 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.036 ms
--- localhost ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max/stddev = 0.036/0.039/0.044/0.000 ms
</pre>root@client:/# 
```
