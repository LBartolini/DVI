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
        <h3>A new service for Students and Eployees at Campus DVI</h3>
        <p>The students of UniDV have developed this incredible functionality inside this website. 
            They developed the <b>Change your password</b> service inside the Private section.</p>
        <p>The password is stored using the MD5 hash inside a file. Each user has its own file inside the <b>/passwords</b> directory. Of course accessing <b>.txt</b> files inside is forbidden!</p>
        <p>Since many applications, linked to this one, already provide hashed passwords, the students have thought about a way of excluding the hashing process!</p>
        <!-- 
            TODO: 
            Remove this once you are done!
            Start the New password with 'RAW:' if already hashed with MD5
          -->
        <p>The students that worked on this task are very talented; but everyone can make mistakes. If you find any bug or <b>vulnerability</b> contact Alice.</p>
    </div>
</body>

</html>