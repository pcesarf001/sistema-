<?php
    include_once '../function/autoloader.php';
    $user = new User;
    $user->setUser($_POST('txtEmail'));
    $user->setPassword(sha1(md5('12345678')));
    var_dump($user->auth());
?>