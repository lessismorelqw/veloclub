<?php

// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php")
{
    header("Location:../index.php?view=login");
    die("");
}

?>
<!--inscription pour visiteurs-->
<div id="corps_user">

    <h1 id="signin_titre">Sign in</h1>
    <a href="controleur.php?action=Connexion">déjà membre ?</a>
    <div class="form" id="form_Signin">
        <form action="controleur.php" method="GET">
           Nom         <input type="text" name="nom" /><br />
           Prénom      <input type="text" name="prenom" /><br />
           Adresse     <input type="text" name="adresse" /><br />
           Code postal <input type="number" name="postal" /><br />
           Ville       <input type="text" name="ville" /><br />
           Login       <input type="text" name="login" /><br />
           Mot de passe<input type="password" name="passwd" /><br />
                        <input class="submit_button" type="submit" name="action" value="sign" />
        </form>
    </div>


</div>
