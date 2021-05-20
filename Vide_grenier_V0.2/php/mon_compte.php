<?php
session_start();

if (isset($_SESSION["id_util"])) {

?>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mon Compte | CIL de la Gravière</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/monstyle.css">
    </head>

    <body>
        <?php
        include 'inc_header.php';
        // echo $_SESSION['admin'];
        ?>

        <main id="monCompte">
            <?php

            // Test Admin
            if ($_SESSION['admin'] == 1) {
            ?>
                <section class="boxSite">

                    <h2>Gestion Administrateur:</h2>
                    <div id="lienAdmin"><a href="panneau_admin.php" class="bouton">Gestion</a></div>

                </section>

            <?php } ?>

            <section id="" class="container">
                <h3>Vos réservations:</h3>

                <table class="table bg-white rounded">
                    <thead>
                        <tr>
                            <th scope="col">Vide-grenier</th>
                            <th scope="col">Date</th>
                            <th scope="col">Lieu</th>
                            <th scope="col">Nombre d'emplacements</th>
                            <th scope="col">Nom Prénom</th>
                            <th scope="col">Mail</th>
                            <th scope="col">Immatriculation</th>
                            <th scope="col">Statut</th>
                        </tr>
                    </thead>
                    <tbody>
                <?php
                try {
                    include 'inc_bdd.php';

                    // Recherche des valeurs du compte 
                    $select_utilisateur = 'SELECT * FROM utilisateur WHERE id_util = :id_util';
                    $resultat = $base->prepare($select_utilisateur);
                    $resultat->bindParam(':id_util', $_SESSION["id_util"]);
                    $resultat->execute();

                    while ($ligne = $resultat->fetch()) {
                        $mail = $ligne['MAIL_UTIL'];
                        $nom = $ligne['NOM_UTIL'] != "" ? $ligne['NOM_UTIL'] : '';
                        $prenom = $ligne['PRENOM_UTIL'] != "" ? $ligne['PRENOM_UTIL'] : '';
                        $telephone = $ligne['TEL_UTIL'] != "" ? $ligne['TEL_UTIL'] : '';
                        $description = $ligne['DESC_UTIL'] != "" ? $ligne['DESC_UTIL'] : '';
                    }

                    // Rescherche et affiche les résa faites
                    $select_resa = "SELECT * FROM reservation_vg JOIN videgrenier ON reservation_vg.id_vg = videgrenier.id_vg JOIN statuts ON reservation_vg.statu_resa = statuts.id_statuts WHERE id_util = :id";
                    $resultat_select = $base->prepare($select_resa);
                    $resultat_select->bindParam(':id', $_SESSION["id_util"]);
                    $resultat_select->execute();

                    $ok = false;

                    while ($ligne = $resultat_select->fetch()) {

                        $ok = true;
                        switch ($ligne['LABEL_STATUTS']) {
                            case 'En attente':
                                $color_status = "background-color:#FCF3CF; border-radius: 15px; color:#F39C12;";
                                break;
                                
                            case 'Validée':
                                $color_status = "background-color:#C7E0AF; border-radius: 15px; color:#0D6F1C;";
                                break;
                                
                            case 'Refusée':
                                $color_status = "background-color:#EDA7A7; border-radius: 15px; color:#6E0000;";
                                break;
                            
                            default:
                                $color_status = "";
                                break;
                        }
                    
                    ?>
                    
                    <tr class="bg-light">
                        <th class="py-4" scope="row"><?= $ligne['LABEL_VG'] ?></th>
                        <td class="py-4">Le <?= $ligne['DATE_VG'] ?> à <?= $ligne['HEURE_VG'] ?></td>
                        <td class="py-4"><?= $ligne['ADDRESSE_VG'] ?></td>
                        <td class="py-4"><?= $ligne['NOM_RESA'] ?>  <?= $ligne['PRENOM_RESA'] ?></td>
                        <td class="py-4"><?= $ligne['MAIL_RESA'] ?></td>
                        <td class="py-4"><?= $ligne['IMMATRICULATION_RESA'] ?></td>
                        <td class="py-4"><?= $ligne['NBR_RESA'] ?></td>
                        <td class="py-4">
                            <span style="<?= $color_status ?>" class="py-1 px-3"><strong><?= $ligne['LABEL_STATUTS'] ?></strong></span>
                        </td>
                    </tr>

                    <?php
                        if ($ligne['INFO_RESA'] != "") {
                            echo "<p>Informations: " . $ligne['INFO_RESA'] . "</p>";
                        }
                    }

                    if ($ok == false) {

                        echo "<p class=\"text-center\">Pas de réservation pour le moment</p>";
                        echo "<p class=\"text-right\"><a href=\"vide_grenier.php\">Voir le prochain vide grenier</a></p>";
                    }
                } catch (Exception $e) {

                    die('Erreur : ' . $e->getMessage());
                } finally {

                    $base = null; //fermeture de la connexion
                }
                

                ?>
                
                </tbody>
                </table>




            <!-- On créer le form avec les valeurs par défaut du compte -->
            <div id="update" class="boxSite container">
                <h3>Modifier Profil</h3>
                <form class="w-75" method="post" action="update_inscription.php" id="updateDB">
                    <div class="form-group">
                        <label for="mail">*Mail: </label>
                        <input type="text" class="form-control" name="mail" id="mail" value="<?php echo $mail ?>" placeholder="exemple@mail.com">
                    </div>
                    <div class="form-group">
                        <label for="old_password">Ancien Mot de passe: </label>
                        <input type="password" class="form-control" name="old_password" id="old_password">
                    </div>
                    <div class="form-group">
                        <label for="new_password">Nouveau Mot de passe: </label>
                        <input type="password" class="form-control" name="new_password" id="new_password">
                    </div>
                    <div class="form-group">
                        <label for="repeat_password">Répeter Nouveau Mot de passe: </label>
                        <input type="password" class="form-control" name="repeat_password" id="repeat_password">
                    </div>
                    <div class="form-group">
                        <label for="nom">Nom: </label>
                        <input type="text" class="form-control" name="nom" id="nom" value="<?= $nom ?>" placeholder="<?= $nom ?>">
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prénom: </label>
                        <input type="text" class="form-control" name="prenom" id="prenom" value="<?= $prenom ?>" placeholder="<?= $prenom ?>">
                    </div>
                    <div class="form-group">
                        <label for="tel">Tel.: </label>
                        <input type="text" class="form-control" name="tel" id="tel" value="<?= $telephone ?>" placeholder="<?= $telephone ?>">
                    </div>
                    <div class="form-group">
                        <label for="description">Une déscription à partager? : </label>
                        <textarea name="description" id="description" cols="31" rows="5" placeholder="280 caractéres maximum..."><?= $description ?></textarea>
                    </div>
                    <div class="form-group">
                        <p>(*)Champs obligatoires pour modifier le profil</p>
                    </div>
                    <input class="bouton" type="submit" value="Valider" id="subInscription">

                    <div id="erreurUpdateInscription" class="red">
                        <?php
                        if (isset($_GET["erreur_update_inscription"])) {

                            echo $_GET["erreur_update_inscription"];
                        }
                        ?>
                    </div>
                </form>

            </div>



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