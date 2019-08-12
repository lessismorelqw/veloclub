<?php

// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php")
{
    header("Location:../index.php?view=reserver");
    die("");
}

?>

<!--réparation entre des membres, reservation d'atelier-->
<script src="js/reserver.js"></script>

<div id="external-events">
    <p> Ajouter une </p>
</div>
<div id='calendar-container'>
    <div id="calendar"></div>
</div