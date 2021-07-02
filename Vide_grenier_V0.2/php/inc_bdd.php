<?php

    $base = new PDO('mysql:host=127.0.0.1; dbname=vide_grenier_v1_zr_hp', 'root', '');
    $base->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $base->exec("SET NAMES utf8");

?>