<?php

// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php")
{
	header("Location:../index.php?view=login");
	die("");
}

?>
<!--connection sur website pour utilisatuer -->
<div id="corps_user">

<h1>Connexion </h1>
    </br>

<div class="form"id="formLogin">
<form action="controleur.php" method="GET">
Login : <input type="text" name="login" /><br />
Mot de passe : <input type="password" name="passe" /><br />
<input class="submit_button" type="submit" name="action" value="Connexion" />
</form>

</div>


</div>
