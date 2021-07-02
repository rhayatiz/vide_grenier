<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vide Grenier | CIL de la Gravière</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/monstyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</head>

<body>
    <?php
    include 'inc_header.php';
    ?>

<div class="container">
    <h1 class="display-4 mb-4">Les prochains vides greniers</h1>
    <?php
    try {
        include 'inc_bdd.php';

        $select_vg = 'SELECT * FROM videgrenier';
        $resultat = $base->prepare($select_vg);

        $resultat->execute();

        echo "<main id=\"videGrenier\" class=\"text-center\">";
        echo "<div class='accordion mb-4' id='accordionContainer'>";
        if($resultat->rowCount() == 0){
            echo "<div class='mb-4'>AUCUN VIDE GRENIER PROGRAMME</div>";
        }else{
            while ($ligne = $resultat->fetch()) {

                $id = $ligne['ID_VG'];
                $label = $ligne['LABEL_VG'];
                $date = $ligne['DATE_VG'];
                $heure = $ligne['HEURE_VG'];
                $addresse = $ligne['ADDRESSE_VG'];
                $nbrRestant = $ligne['NBR_RESTANT_VG'];
                $nbrEmplacements = $ligne['NBR_EMPLACEMENTS'];

                //Séléctionner nb total de places
                $select_nb_places = "select count(*) as nbPlaces from places where type != '_' and type != 'x'";
                $resultat = $base->prepare($select_nb_places);
                $resultat->execute();
                $totalPlaces = $resultat->fetchObject()->nbPlaces;

                //enlever les places réservées
                $select_nb_places_reservees = "SELECT count(*) as placesReservees FROM  reservation_place,`reservation_vg` 
                    WHERE `ID_VG` = :id_vg
                    AND `STATU_RESA` = 2
                    AND reservation_place.reservation_id = reservation_vg.ID_RESA";
                $resultat = $base->prepare($select_nb_places_reservees);
                $resultat->bindParam(':id_vg', $id);
                $resultat->execute();
                $placesReservees = $resultat->fetchObject()->placesReservees;

                $placesDispo = $totalPlaces - $placesReservees;
                
        
                ?>
                <!-- Accordion item -->
                <div class="accordion-item">
                        <h2 class="accordion-header border-5 border-left border-info" id="<?php echo 'heading'.$id; ?>">
                        <div class="accordion-button pl-0 pr-3 py-0 collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#<?php echo 'collapse'.$id; ?>" aria-expanded="false" aria-controls="<?php echo 'collapse'.$id; ?>">
                            <div class="row justify-content-between p-3" style="width : 100%;">
                                <div class="col-3 pl-4">
                                    <div class="row align-center h4 mb-0"><?php echo $date ?></div> 
                                    <div class="row align-center h3"><?php echo $heure ?></div>
                                </div>
                                <div class="col-7">
                                    <div class="row align-center h4 mb-0"><?php echo $label ?></div>
                                    <div class="row align-center"><?php echo $addresse ?></div>
                                </div>
                            </div>    
                        </div>
                        </h2>
                        <div id="<?php echo 'collapse'.$id; ?>" class="accordion-collapse collapse" aria-labelledby="<?php echo 'heading'.$id; ?>" data-bs-parent="#accordionContainer">
                        <div class="accordion-body" style="background-color: #f7f7f7;">
                            <!-- ACCORDION BODY -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3 mb-1">
                                    <h6 class="mb-0">Quand</h6>
                                    </div>
                                    <div class="col-sm-9">
                                        <span class="px-sm-3">Le <strong><?php echo $date ?></strong> à <strong><?php echo $heure ?></strong></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3 mb-1">
                                    <h6 class="mb-0">Adresse</h6>
                                    </div>
                                    <div class="col-sm-9">
                                        <span class="px-sm-3"><?php echo $addresse ?></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3 mb-1">
                                    <h6 class="mb-0">Nombre emplacements</h6>
                                    </div>
                                    <div class="col-sm-9">
                                    <span class="px-sm-3"><?php echo $totalPlaces ?></span>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3 mb-1">
                                    <h6 class="mb-0">Places disponsibles</h6>
                                    </div>
                                    <div class="col-sm-9">
                                    <!-- PLACES DISPO -->
                                    <?php 
                                    if ($placesDispo > 0) {
                                        
                                        // NOMBRE DE PLACES
                                        echo '<span style="background-color:#C7E0AF; border-radius: 15px; color:#0D6F1C;" class="py-1 px-3"><strong>'.$placesDispo.'</strong> Places disponibles</span>';

                                        // USER connecté, bouton réservez
                                        if (isset($_SESSION['id_util'])) {
                            
                                            echo '<div class="row justify-content-center mb-2 mt-3">
                                                    <div class="col">
                                                            <a class="btn btn-primary"
                                                            href="reservation.php?idVG=' . $id . '">Réservez!</a>
                                                    </div>
                                                </div>';
                                        // User deconnecté, bouton connexion
                                        } else {
                                            echo '<div class="row justify-content-center mb-2 mt-3">
                                                <div class="col">
                                                    <a class="btn btn-primary"
                                                    href="connexion.php">Connectez vous pour réserver</a>
                                                </div>
                                            </div>';
                                        }
                                    } else {
                                        // PLUS DE PLACES DISPO
                                        echo '<span style="background-color:#EDA7A7; border-radius: 15px; color:#6E0000;" class="py-1 px-3">Plus de places disponibles</span>';
                                    }
                                    ?>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col text-secondary">
                                        <p class="mb-0">Exposants ou Visiteurs, nous vous attendons nombreux !</p>
                                        <p class="mb-0">Réservé exclusivement aux particuliers.</p>
                                    </div>
                                </div>

                                </div>
                            </div>
                            <!-- END ACCORDION BODY -->
                        </div>
                    </div>
                    <!-- END ITEM -->
                <?php
        

        
            }
        }

    } catch (Exception $e) {

        die('Erreur : ' . $e->getMessage());
    } finally {
        $base = null; //fermeture de la connexion
    }

    ?>
        </div>
    </main>
</div>




    <?php
    include 'inc_footer.php';
    ?>

    <script src="../js/jquery-3.5.0.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/myscript.js"></script>
</body>

</html>