<?php
session_start();

if (isset($_SESSION["id_util"]) && isset($_GET['idVG'])) {

?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réservation | CIL de la Gravière</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/monstyle.css">
    <link rel="stylesheet" href="../css/jquery.seat-charts.css">
</head>

<body>
    <?php
    include 'inc_header.php';

    try {
        include 'inc_bdd.php';

        $select_vg = 'SELECT * FROM videgrenier WHERE ID_VG = :id';
        $resultat = $base->prepare($select_vg);

        $resultat->bindParam(':id', $_GET['idVG']);
        $resultat->execute();

        while ($ligne = $resultat->fetch()) {

            $label = $ligne['LABEL_VG'];
            $date = $ligne['DATE_VG'];
            $heure = $ligne['HEURE_VG'];
            $addresse = $ligne['ADDRESSE_VG'];
            $nbrRestant = $ligne['NBR_RESTANT_VG'];
            $prixPlace = $ligne['PRIX_EMPLACEMENTS'];
        }
    } catch (Exception $e) {

        die('Erreur : ' . $e->getMessage());
    } finally {

        $base = null; //fermeture de la connexion
    }
    ?>
    <div class="container">

    <!-- Récupere la valeur en JS pour calcule dynamique -->
    <input type = hidden id = prixJS value = <?php echo $prixPlace;?>/>

    <section id="infoResa" class="boxSite">
        <h3>Réservation: </h3>
        <h3><?php echo $label ?></h3>
        <p>Quand? le <?php echo $date ?>, <?php echo $heure ?></p>
        <p>Où? <?php echo $addresse ?></p>
        <p>Plus que <?php echo $nbrRestant ?> places disponibles.</p>

        <!-- Légende -->
        <div id="my-legend-container" class="bg-light text-dark rounded pb-2 mb-1">
            <h5 class="text-middle">Légende</h5>
        </div>

        <!-- Emplacements -->
        <div id="seat-map" class="bg-light mx-auto rounded mb-3 text-dark mx-auto" style="height:200px"></div>
    </section>

    <main id="reservationVideGrenier" class="boxSite">



        <form method="post" action="verif_resa.php?idVG=<?php echo $_GET['idVG']?>" id="resaDB">

            <div class="form-group">
                <label for="mail">*Mail: </label>
                <input type="text" class="form-control" name="mail" id="mail" placeholder="exemple@mail.com">
            </div>
            <div class="form-group">
                <label for="nom">*Nom: </label>
                <input type="text" class="form-control" name="nom" id="nom" placeholder="Dupont">
            </div>
            <div class="form-group">
                <label for="prenom">*Prénom: </label>
                <input type="text" class="form-control" name="prenom" id="prenom" placeholder="Jean">
            </div>
            <div class="form-group">
            <label for="addresse">*Adresse: </label>
            <input type="text" class="form-control" name="addresse" id="addresse" placeholder="4 avenus de l'exemple">
            </div>
            <div>
                <label for="postal">*Code Postal: </label>
                <input type="text" class="form-control" name="postal" id="postal" placeholder="XXXXX">
            </div>
            <div>
                <label for="ville">*Ville: </label>
                <input type="text" class="form-control" name="ville" id="ville" placeholder="Saint exemple">
            </div>
            <div class="form-group">
                <label for="portable">*Portable: </label>
                <input type="text" class="form-control" name="portable" id="portable" placeholder="0XXXXXXXXX">
            </div>
            <div class="form-group">
                <label for="numCNI">*N° Carte d'identité: </label>
                <input type="text" class="form-control" name="numCNI" id="numCNI" placeholder="">
            </div>
            <div class="form-group">
                <label for="dateCNI">*Délivrée le: </label>
                <input type="text" class="form-control" name="dateCNI" id="dateCNI" placeholder="XX/XX/XXXX">
            </div>
            <div class="form-group">
                <label for="parCNI">*Délivrée par: </label>
                <input type="text" class="form-control" name="parCNI" id="parCNI" placeholder="Préfecture de ...">
            </div>
            <div class="form-group">
                <label for="immatriculation">Plaque d'immatriculation: </label>
                <input type="text" class="form-control" name="immatriculation" id="immatriculation" placeholder="'AB-123-CD' ou '123 AB 45'">
            </div>
            <div class="form-group">
                <label for="nbrEmplacement">*Nombre d'emplacements désirer: </label>
                <input type="number" class="form-control" name="nbrEmplacement" id="nbrEmplacement" placeholder="" min="1" max="<?php echo $nbrRestant?>">
                <span> <?php echo $prixPlace ?>€ la place.</span>
                <span id='resultatPrix'></span>
                
            </div>
            <p class="text-justify">Ces emplacements vous sont personnels et seront déclarés au registre réglementaire pour remise au Maire de la commune à l'issu du Vide Grenier.</p>

            <p class="text-justify">Ils sont donc non revendable ni cessibles.
                Possibilité de nous contacter pour augmenter la taille ultérieurement (minimum 15j avant la manifestation, en fonction des places disponibles).</p>

            <p class="text-justify">Par contre, si nous sommes avertis 7 jours calendaires avant, d’un empêchement majeur de votre part, nous vous rembourserons le montant de votre réservation moins les frais de réservation et de service s'élevant à 4€.</p>

            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="infoCheck">
                <label class="form-check-label text-justify" for="infoCheck">*Je certifie sur l'honneur l'exactitude des informations remplies</label>
            </div><br />
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="commercantCheck">
                <label class="form-check-label text-justify" for="commercantCheck">*Je certifie sur l'honneur de ne pas être commerçant(e)</label>
            </div><br />
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="objetCheck">
                <label class="form-check-label text-justify" for="objetCheck">*Je certifie sur l'honneur de ne vendre que des objets personnels et usagés (Article L 310-2 du Code de commerce)</label>
            </div><br />
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="manifestationCheck">
                <label class="form-check-label text-justify" for="manifestationCheck">*Je certifie sur l'honneur de non-participation à 2 autres manifestations de même nature au cours de l’année civile. (Article R321-9 du Code pénal)</label>
            </div><br />
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="parkingCheck">
                <label class="form-check-label text-justify" for="parkingCheck">*Je m'engage a laisser libre les emplacements de parking réservés à la décharge des véhicules (cf emplacements verts sur photos plus bas), à défaut je sais que je pourrai recevoir un Procès Verbal pour infraction à l'arrêté de non stationnement publié par la Mairie pour le jour de la manifestation.</label>
            </div><br />
            <div class="form-group">
            <label for="remarque">Une remarque? : </label>
            <textarea name="remarque" id="remarque" cols="40" rows="5" placeholder="150 caractéres maximum..."></textarea>
            </div>
            
            <div class="form-group">
                <p>(*)Champs obligatoires</p>
            </div>

            <input class="bouton" type="submit" value="Valider" id="subInscription">

            <div id="erreurReservation" class="red">
                <?php
                if (isset($_GET["erreur_reservation"])) {

                    echo $_GET["erreur_reservation"];
                }
                ?>
            </div>
        </form>




    </main>


    </div>



    <?php
    include 'inc_footer.php';
    ?>

    <script src="../js/jquery-3.5.0.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/myscript.js"></script>
    <script src="../js/jquery.seat-charts.min.js"></script>
    <script>
    $(document).ready(function() {

        var sc = $('#seat-map').seatCharts({
            rows: false,
            map: [
                'axxaaaaaaaaaaaaxaaaaaaaaaaaaaaa',
                'aaaaaxxaaaaaaaxaaaaaaaaaaaxxaaa',
                'bbbbbbbbbb__bbbbbbbbb____bbb',
            ],
            seats: {
                a: {
                    price   : 10.99,
                    classes : 'front-seat' //your custom CSS class
                },
                b: {
                    price   : 15,
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
                    [ 'a', 'available',   'Emplacement 2 mètres (10.99Euros)'],
                    [ 'b', 'available',   'Emplacement 3 mètres (20Euros)'],
                    [ 'x', 'available',   'Emplacement Indisponible'],
                ]
            },
            click: function () {
                if (this.status() == 'available') {
                    //do some stuff, i.e. add to the cart
                    return 'selected';
                } else if (this.status() == 'selected') {
                    //seat has been vacated
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