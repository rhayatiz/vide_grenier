<?php
//fonction de débuggage de variable
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

    // $matrice = matrice des places, chaque entrée dans le tableau multi-dimensionnel
    //           contient un objet Place (table places en bdd)
    //  $matrice[0][0] = place(1_1)  $matrice[0][1] = place(1_2) $matrice[0][2] = place(1_3)
    //  $matrice[1][0] = place(1_1)  $matrice[1][1] = place(2_2) $matrice[1][2] = place(2_3)
    //  $matrice[2][0] = place(1_1)  $matrice[2][1] = place(3_2) $matrice[2][2] = place(3_3)
    $matrice = array();
    while ($place = $resultat->fetchObject()) {
        $x = explode("_", $place->coords)[0];
        $y = explode("_", $place->coords)[1];
        $matrice[$x-1][$y-1] = $place;
    }

    
    //Séléctionner l'ID des places réservées
    $id_vg = $_GET['idVG'];
    $reservations = 'SELECT place_id FROM reservation_vg, reservation_place
    where ID_VG = :id_vg
    AND reservation_place.reservation_id = reservation_vg.ID_RESA';
    $resultat = $base->prepare($reservations);
    $resultat->bindParam(':id_vg', $id_vg);
    $resultat->execute();
    $places_indisponibles = array();
    while ($place_id = $resultat->fetch()){
        $places_indisponibles[$place_id['place_id']] = true;
    };


    // $api_map_array contient la map qui sera envoyée à seatCharts dans reservation.php
    $api_map_array = array();
    $i = 0;
    foreach($matrice as $ligne){
        $api_map_array[$i] = '';
        foreach($ligne as $place){
            //Si l'id de la place est présent dans le tableau $places_indisponibles
            //C'est que la place a déjà été réservée et validée par l'administrateur
            if(isset($places_indisponibles[$place->id])){
                $api_map_array[$i] .= 'x';
            }else{
                $api_map_array[$i] .= $place->type;
            }
        }
        $i++;
    }


    /******************************************
     *  DEBUG : visiter la page php/api_map.php
     */
    // header('Content-Type: application/json');
    // echo json_encode($api_map_array);


} catch (Exception $e) {

    die('Erreur : ' . $e->getMessage());
} finally {

    $base = null; //fermeture de la connexion
}
?>