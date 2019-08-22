<?php

// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php")
{
	header("Location:../index.php");
	die("");
}

?>

<div id="pied">


<?php
// Si l'utilisateur est connecte, on affiche un lien de deconnexion 
if (valider("connecte","SESSION"))
{
	echo "Utilisateur <b>$_SESSION[pseudo]</b> connecté depuis <b>$_SESSION[heureConnexion]</b> &nbsp; "; 
	echo "<a href=\"controleur.php?action=Logout\">Se Déconnecter</a>";
}
?>

    <p><a href="">Copyright ©2019 LI Qingwen</a></p>
    <p><a href="">Velo club</a> | <a href="">Bolg
        </a> | <a href="">Work</a> | <a href="">Terms of Use</a> | <a href="">Contact Me</a></p>

</div>

</body>
</html>
