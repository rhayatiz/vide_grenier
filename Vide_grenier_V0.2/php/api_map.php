<?php

function dd($a){
    echo "<pre>";
    $a != null ? print_r($a) : print_r('empty');
    echo "</pre>";
    exit();
}

try {
    include 'inc_bdd.php';
    //selection des places
    $places = 'SELECT * FROM places';
    $resultat = $base->prepare($places);

    $resultat->execute();


    $result = array();
    while ($place = $resultat->fetchObject()) {
        $x = explode("_", $place->coords)[0];
        $y = explode("_", $place->coords)[1];
        $result[$x-1][$y-1] = $place;
    }

    
    $api_map_array = array();

    $i = 0;
    foreach($result as $ligne){
        $api_map_array[$i] = '';
        foreach($ligne as $place){
            $api_map_array[$i] .= $place->type;
        }
        $i++;
    }



} catch (Exception $e) {

    die('Erreur : ' . $e->getMessage());
} finally {

    $base = null; //fermeture de la connexion
}

?>