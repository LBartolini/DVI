<?php
function sanitize_username($username) {
    $username = str_replace(['../', '..\\', '.php'], '', $username);
    return $username;
}

function get_user_file($username, $ext = 'txt') {
    $username = sanitize_username($username);
    $filename = pathinfo($username, PATHINFO_FILENAME);  // removes .php, .txt, ...
    return "passwords/{$filename}.{$ext}";
}
