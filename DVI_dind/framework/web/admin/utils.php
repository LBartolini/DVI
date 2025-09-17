<?php
function sanitize_username($username) {
    $username = str_replace(['../', '..\\', '.php'], '', $username);
    return $username;
}
