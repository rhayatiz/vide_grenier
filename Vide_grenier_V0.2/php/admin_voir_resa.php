<?php
session_start();

if (isset($_SESSION['id_util']) && $_SESSION["admin"] == 1 && isset($_GET["id_resa"])) {
?>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Voir demande en attente | CIL de la Gravière</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/monstyle.css">
        <link rel="stylesheet" href="../css/jquery.seat-charts.css">
    </head>

    <body>

        

        <?php
        include 'inc_header.php';

        
        try {
            include 'inc_bdd.php';

            // Récupérer la demande qu'on veut afficher
            $select_attente =  "SELECT * FROM reservation_vg JOIN videgrenier ON reservation_vg.id_vg = videgrenier.id_vg JOIN statuts ON reservation_vg.statu_resa = statuts.id_statuts WHERE ID_RESA = :id_resa";

            $resultat_select = $base->prepare($select_attente);
            $id_resa = htmlspecialchars($_GET["id_resa"]);
            $resultat_select->bindParam(':id_resa', $id_resa);
            $resultat_select->execute();
            $reservation = $resultat_select->fetchObject();

            
            include 'api/getDemandeReservationMap.php'; // récupérer $map pour le JS
            $api_map_array = getDemandeReservationMap($reservation->ID_VG);
            $placesReservees = getPlacesReservees($reservation->ID_RESA);
            // echo "<pre>";
            // print_r($placesReservees);
            // echo "</pre>";
            // exit();
        ?>

        <div class="container bg-light mt-5 rounded shadow-lg">
            <div id="demande-container" class="container p-3">
                <h4 class="mb-5">Modification de la demande N°<?= $reservation->ID_RESA ?></h4>
                <div class="row">
                    <!------------------- COL - 1 ----------------------->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="row  d-flex justify-content-between mb-2">
                            <div class="col text-secondary">Nom</div>
                            <div class="col">
                                <?= $reservation->NOM_RESA ?>
                            </div>
                        </div>
                        <div class="row  d-flex justify-content-between mb-2">
                            <div class="col text-secondary">Prénom</div>
                            <div class="col">
                                <?= $reservation->PRENOM_RESA ?>
                            </div>
                        </div>
                        <div class="row  d-flex justify-content-between mb-2">
                            <div class="col text-secondary">Immatriculation</div>
                            <div class="col">
                                <?= $reservation->IMMATRICULATION_RESA ?>
                            </div>
                        </div>
                        <div class="row  d-flex justify-content-between mb-2">
                            <div class="col text-secondary">Carte d'identité</div>
                            <div class="col">
                                <?= $reservation->CNI_RESA ?>
                                Délivrée par
                                <?= $reservation->PAR_CNI_RESA ?>
                                le
                                <?= $reservation->DELIVRE_CNI_RESA ?>
                            </div>
                        </div>
                    </div>
                    <!------------------- COL - 2 ----------------------->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="row  d-flex justify-content-between mb-2">
                            <div class="col text-secondary">Vide grenier</div>
                            <div class="col">
                                <?= $reservation->LABEL_VG ?>
                            </div>
                        </div>
                        <div class="row  d-flex justify-content-between mb-2">
                            <div class="col text-secondary">Date</div>
                            <div class="col">
                                <?= $reservation->DATE_VG ?>
                            </div>
                        </div>
                    </div>
                    <!------------------- COL - 3 ----------------------->
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="row  d-flex justify-content-between mb-4">
                            <div class="col text-secondary">Places</div>
                            <div class="col">
                                <?= sizeof($placesReservees) ?>
                            </div>
                        </div>
                        <div class="row mb-2" style="max-height:">
                            <table class="table table-sm table-bordered shadow-sm">
                                <thead>
                                    <tr>
                                        <th scope="col">Numéro</th>
                                        <th scope="col">Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                        <?php foreach ($placesReservees as $k=>$place) {?>
                                        <tr>
                                            <th scope="row"><?= $place['coords'] ?></th>
                                            <td><?= $place['type'] ?></td>
                                        </tr>
                                        <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Map d'emplacements -->
                <div class="row mx-2 mb-2 mt-5">
                    <div id="seat-map" class="col bg-light mx-auto rounded mb-3 text-dark mx-auto border rounded"></div>
                </div>

                <hr class="my-3">

                <!-- Actions : Valider, Refuser -->
                <div class="row mt-3 mb-3">
                    <div class="col-4 font-weight-bold">Actions</div>
                    <div class="col-4 text-center">
                        <div class="btn btn-danger"><a href="admin_update_resa.php?id_resa=<?= $id_resa ?>&choix=3"  class="text-white">Refuser</a></div>
                    </div>
                    <div class="col-4 text-center">
                        <div class="btn btn-success"><a href="admin_update_resa.php?id_resa=<?= $id_resa ?>&choix=2" class="text-white">Valider</a></div>
                    </div>
                </div>

            </div> <!-- demande-container -->
        </div> <!-- container -->

        
        <?php
            } catch (Exception $e) {

                die('Erreur : ' . $e->getMessage());
            } finally {

                $base = null; //fermeture de la connexion
            }
        ?>


        <?php
        include 'inc_footer.php';
        ?>

        <script src="../js/jquery-3.5.0.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/myscript.js"></script>
        <script src="../js/jquery.seat-charts.min.js"></script>
        <script>
        $(document).ready(function() {
            var api_map_array = <?= json_encode($api_map_array); ?>;
            var places_reservees = [];
            var sc = $('#seat-map').seatCharts({
                rows: false,
                map: api_map_array,
                seats: {
                    a: {
                        price   : 10.99,
                        type: 'Emplacement 2 mètres',
                        classes : 'front-seat' //your custom CSS class
                    },
                    b: {
                        price   : 15,
                        type: 'Emplacement 3 mètres',
                        classes : 'emplacement-3m' //your custom CSS class
                    },
                    x: {
                        price   : 15,
                        classes : 'emplacement-indisponible' //your custom CSS class
                    }
                
                },
                legend : {
                    node  : $('#my-legend-container'),
                    items : [
                        [ 'a', 'available',   'Emplacement 2 mètres'],
                        [ 'b', 'available',   'Emplacement 3 mètres'],
                        [ 'x', 'available',   'Emplacement reservé'],
                    ]
                },
                /***********************************
                * Quand on clique sur un emplacement
                */
                click: function () {
                    /*******************************************
                     *  Si action == séléctionner l'emplacement
                     */
                    if (this.status() == 'available') {
                        //Enregistrer les coordonnées places reservés
                        //Emplacement séléctionné, ajouter dans le panier
                        
                        return 'selected';
                    
                    /*******************************************
                     *  Si action == désélectionner l'emplacement
                     */
                    } else if (this.status() == 'selected') {
                        //Supprimer les coordonnées places reservés
                        return 'available';
                    } else if (this.status() == 'unavailable') {
                        //seat has been already booked
                        return 'unavailable';
                    } else {
                        return this.style();
                    }
                }
            });


            //Make all available 'c' seats unavailable
            sc.find('x.available').status('unavailable');
            sc.find('r.available').status('selected');

            /*
            Get seats with ids 2_6, 1_7 (more on ids later on),
            put them in a jQuery set and change some css
            */
            sc.get(['2_6', '1_7']).node().css({
                color: '#ffcfcf'
            });
            console.log('Seat 1_2 costs ' + sc.get('1_2').data().price + ' and is currently ' + sc.status('1_2'));
        });
        </script>
    </body>

    </html>

<?php

} else {
    header("Location:accueil.php");
}
?>