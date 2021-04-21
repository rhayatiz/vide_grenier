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

    <div class="accordion" id="accordionExample">
    <div class="accordion-item">
        <h2 class="accordion-header border-5 border-left border-info" id="headingOne">
        <div class="accordion-button pl-0 pr-3 py-0" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <div class="row justify-content-between p-3" style="width : 100%;">
                <div class="col-3 bg-danger">
                    <div class="row align-center h4 mb-0">22 SEP</div> 
                    <div class="row align-center h3">2016</div>
                </div>
                <div class="col-7">
                    <div class="row align-center h4 mb-0">Vide-grenier annuel 2016</div>
                    <div class="row align-center">Sainte-foy-lès-lyon 69110</div>
                </div>
            </div>    
        </div>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
        <div class="accordion-body" style="background-color: #f7f7f7;">
            <!-- ACCORDION BODY -->
            <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3 mb-1">
                      <h6 class="mb-0">Quand</h6>
                    </div>
                    <div class="col-sm-9">
                      Le <strong>{{DATE}}</strong> à <strong>{{HEURE}}</strong>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3 mb-1">
                      <h6 class="mb-0">Adresse</h6>
                    </div>
                    <div class="col-sm-9 ">
                      {{Full address}}
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3 mb-1">
                      <h6 class="mb-0">Places disponsibles</h6>
                    </div>
                    <div class="col-sm-9">
                      <span style="background-color:#E6F9D4; border-radius: 15px; color:#0D6F1C;" class="py-1 px-3"><strong>{{Places dispo}}</strong> Places disponibles</span>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col">
                        <p class="mb-0">Exposants ou Visiteurs, nous vous attendons nombreux !</p>
                        <p>Réservé exclusivement aux particuliers.</p>
                    </div>
                  </div>
                </div>
              </div>
            <!-- END ACCORDION BODY -->
        </div>
        </div>
    </div>
    <div class="accordion-item">
        <h2 class="accordion-header" id="headingTwo">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
            Accordion Item #2
        </button>
        </h2>
        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
        <div class="accordion-body">
            <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
        </div>
        </div>
    </div>
    <div class="accordion-item">
        <h2 class="accordion-header" id="headingThree">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
            Accordion Item #3
        </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
        <div class="accordion-body">
            <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
        </div>
        </div>
    </div>
    </div>
</div>

    <?php
    try {
        include 'inc_bdd.php';

        $select_vg = 'SELECT * FROM videgrenier';
        $resultat = $base->prepare($select_vg);

        $resultat->execute();

        echo "<main id=\"videGrenier\" class=\"text-center\">";

        while ($ligne = $resultat->fetch()) {

            $id = $ligne['ID_VG'];
            $label = $ligne['LABEL_VG'];
            $date = $ligne['DATE_VG'];
            $heure = $ligne['HEURE_VG'];
            $addresse = $ligne['ADDRESSE_VG'];
            $nbrRestant = $ligne['NBR_RESTANT_VG'];
    
            ?>
            <section class="boxSite">
            <h3>Prochain événement du CIL de la Gravière:</h3>
            <h3><?php echo $label ?></h3>
            <p>Quand? le <?php echo $date ?>, <?php echo $heure ?></p>
            <p>Où? <?php echo $addresse ?></p>
            <p>Exposants ou Visiteurs, nous vous attendons nombreux !</p>
            <p>Réservé exclusivement aux particuliers.</p>
            <!-- <img src="../images/imgVG.jpg" alt="Image de Vide-grenier" id="imgVG"> -->
            <?php
    
            if ($nbrRestant > 0) {
    
                echo "<p>Plus que $nbrRestant places disponibles!</p>";
    
                if (isset($_SESSION['id_util'])) {
    
                    echo "<a href=\"reservation.php?idVG=" . $id . "\" class=\"bouton\">Réservez!</a>";
                } else {
        
                    echo "<a href=\"connexion.php\" class=\"bouton\">Connectez vous pour réserver</a>";
                }
            } else {
    
                echo "<p>Plus de places disponibles!</p>";
            }
    
            echo "</section>";

        }
    } catch (Exception $e) {

        die('Erreur : ' . $e->getMessage());
    } finally {

        $base = null; //fermeture de la connexion
    }

    ?>

    
        
    </main>



    <?php
    include 'inc_footer.php';
    ?>

    <script src="../js/jquery-3.5.0.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/myscript.js"></script>
</body>

</html>