<?php
session_start();

if (isset($_SESSION['id_util']) && $_SESSION["admin"] == 1) {
?>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Liste des demandes en attentes | CIL de la Gravière</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/monstyle.css">
        <!-- ICON -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    
    </head>

    <body>
        <?php
        include 'inc_header.php';
        include 'api/getDemandeReservationMap.php'; // récupérer $map pour le JS
        ?>
        <main id="listeAttente">
            <?php

            try {
                include 'inc_bdd.php';

                // liste des demande de VG en attente de validation ou d'annulation
                $select_attente =  "SELECT * FROM reservation_vg JOIN videgrenier ON reservation_vg.id_vg = videgrenier.id_vg JOIN statuts ON reservation_vg.statu_resa = statuts.id_statuts /*WHERE STATU_RESA = 1*/";

                $resultat_select = $base->prepare($select_attente);
                $resultat_select->execute();

                $table = "<table class=\"table table-striped\">
                <tr>
                    <th>#ID</th>
                    <th>Vide grenier</th>
                    <th>Nom</th>
                    <th>Prenom</th>
                    <th>Date</th>
                    <th>N°Places</th>
                    <th>Etat</th>
                    <th> </th>
                </tr>";

                while ($ligne = $resultat_select->fetch()) {
                    
                    //NB de places reservées
                    $placesReservees = sizeof(getPlacesReservees($ligne['ID_RESA']));


                    switch ($ligne['STATU_RESA']) 
                    {
                        case 1:
                            $info="<td style='color:orange'> en attente </td>";
                            break;
                        case 2:
                            $info="<td style='color:green'> validée </td>";
                            break;
                        case 3:
                            $info="<td style='color:red'> refusée </td>";
                            break;
                    }
                    $table .= "
                        <td>" . $ligne['ID_RESA'] . "</td>
                        <td>" . $ligne['LABEL_VG'] . "</td>
                        <td>" . $ligne['NOM_RESA'] . "</td>
                        <td>" . $ligne['PRENOM_RESA'] . "</td>
                        <td>" . $ligne['INFO_RESA'] . "</td>
                        <td>" . $placesReservees . "</td> $info ";

                        //Si la réservation n'est pas validée
                        if ($ligne['STATU_RESA'] != 2 && $ligne['STATU_RESA'] != 3){
                            $table .= "<td class=\"text-center\"><a href=\"admin_voir_resa.php?id_resa=".$ligne['ID_RESA']."\"><i class='fas fa-pen'></i></a></td>";
                        }else{
                            $table .= "<td></td>";
                        }

                        $table .= "</tr>";
                }

                $table .= "</table>";
                echo "<section class = \"boxSite\">";    
                echo $table;
                echo "<div id=\"erreurSupp\" class=\"red\">";
                if (isset($_GET["erreur_supp"])) {

                    echo $_GET["erreur_supp"];
                }
                echo "</div></section>";
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

<?php

} else {
    header("Location:accueil.php");
}
?>