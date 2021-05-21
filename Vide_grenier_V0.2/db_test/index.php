<?php
    function dd($var){
        echo "<pre>";
        $var ? print_r($var) : print_r('La variable est vide') ;
        echo "</pre>";
    }

    $base = new PDO('mysql:host=127.0.0.1; dbname=vide_grenier', 'root', '');
    $base->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $base->exec("SET NAMES utf8");


    echo "<h1>Tests Compte</h1>";
    echo "<hr>";
    echo "Création compte compte_test@mail.fr";
    $request = $base->prepare("INSERT INTO 
    utilisateur 
    (MAIL_UTIL, MDP_UTIL, NOM_UTIL, PRENOM_UTIL, TEL_UTIL, DESC_UTIL, ADMIN_UTIL)
     VALUES ('compte_test@mail.fr','123123','Polo','Narco', '0123456789', 'User description', 1)");
    $request->execute();

    echo "<hr>";
    echo "Select compte compte_test@mail.fr";
    $request = $base->prepare("SELECT * FROM utilisateur WHERE MAIL_UTIL = 'compte_test@mail.fr'");
    $request->execute();
    $result = $request->fetch();
    dd($result);


    echo "<hr>";
    echo "Suppression compte compte_test@mail.fr";
    $request = $base->prepare("DELETE FROM utilisateur WHERE MAIL_UTIL = 'compte_test@mail.fr'");
    $request->execute();

    echo "<br>Vérification avec select compte compte_test@mail.fr";
    $request = $base->prepare("SELECT * FROM utilisateur WHERE MAIL_UTIL = 'compte_test@mail.fr'");
    $request->execute();
    $result = $request->fetch();
    dd($result);


?>