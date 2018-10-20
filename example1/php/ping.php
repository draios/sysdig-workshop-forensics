<?php
$link = mysqli_connect("mysql", "root", "foobar", "employees");
?>

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

<?php
if ($_POST['s']) {
    $user = $_POST['user'];
    $passwd = $_POST['passwd'];     
    $ipaddr = $_POST['ipaddr'];     
    $re = mysqli_query($link, "select * from users where user_name = '$user' and password = '$passwd'");

    if (mysqli_num_rows($re) == 0) {
        echo 'Access denied.';
    } else {
        $cmd = shell_exec('ping -c 3 ' . $ipaddr); 
        echo "<pre>$cmd</pre>";
    }
}
?>
