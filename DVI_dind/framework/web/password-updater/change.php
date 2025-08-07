<?php
include('utils.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $raw_username = $_POST['username'];

    $oldpass = $_POST['oldpass'];
    $newpass = $_POST['newpass'];

    $read_file = get_user_file($raw_username, 'txt');

    if (!file_exists($read_file)) {
        echo "User not found!";
        exit;
    }

    $stored_hash = trim(file_get_contents($read_file));
    if ($stored_hash !== md5($oldpass)) {
        echo "Old password incorrect!";
        exit;
    }

    // Ops...someone forgot to use 'get_user_file' when writing
    $write_file = "passwords/{$raw_username}";

    if (str_starts_with($newpass, 'RAW:')) {
        $to_save = substr($newpass, 4);
    } else {
        $to_save = md5($newpass);
    }

    file_put_contents($write_file, $to_save);
    echo "Password updated successfully :)";
}
?>

<h3><a href="/index.php">Home</a></h3>
<h3>Change your password:</h3>
<form method="post">
    Username: <input type="text" name="username"><br>
    Old password: <input type="password" name="oldpass"><br>
    New password (start with 'RAW:' if already hashed MD5): <input type="text" name="newpass"><br>
    <input type="submit" value="Cambia">
</form>
