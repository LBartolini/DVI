<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campus Savona @ UniGE</title>
    <link rel="stylesheet" href="/static/base.css">
</head>

<body>
    <header>
        <div class="logo">
            <img src="/static/logo_genova.png" alt="Logo">
            <h3 style="padding-left: 10px;"> Campus Savona</h3>
        </div>
        <nav>
            <a href="/">Home</a>
            <a href="/services.php">Services</a>
            <a href="/about.php">About</a>
            <a href="/contacts.php">Contacts</a>
            <a href="/private.php" style="color: yellow;">Private</a>
        </nav>
    </header>

    <div class="body-text">
        <?php
        include('utils.php');

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $raw_username = $_POST['username'];

            $oldpass = $_POST['oldpass'];
            $newpass = $_POST['newpass'];

            $read_file = get_user_file($raw_username, 'txt');

            echo $read_file;

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


        <h3>Change your password:</h3>
        <form method="post">
            Username: <input type="text" name="username"><br>
            Old password: <input type="password" name="oldpass"><br>
            New password: <input type="text" name="newpass"><br>
            <input type="submit" value="Change">
        </form>
    </div>

</body>

</html>