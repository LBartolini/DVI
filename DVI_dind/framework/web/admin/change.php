<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campus DVI @ UniDV</title>
    <link rel="stylesheet" href="/static/base.css">
</head>

<body>
    <header>
        <div class="logo">
            <img src="/static/logo_unidv.png" alt="Logo">
            <h3 style="padding-left: 10px;"> Campus DVI</h3>
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
            $newpass = $_POST['newpass'];

            $sanitized_username = sanitize_username($raw_username);
            $write_file = "../passwords/{$sanitized_username}";

            if (str_starts_with($newpass, 'RAW:')) {                
                $to_save = $newpass;
            } else {
                $to_save = md5($newpass);
            }

            file_put_contents($write_file, $to_save);
            echo "Password updated successfully :)";
        }
        ?>


        <h3>Change your password:</h3>
        <form method="post">
            Username: <input type="text" name="username"><br><br>
            New password: <input type="text" name="newpass"><br><br>
            <input type="submit" value="Change">
        </form>
    </div>

</body>

</html>