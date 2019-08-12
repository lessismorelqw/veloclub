<?php


// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php") {
    header("Location:../index.php?view=reserver");
    die("");
}


?>
<!--monter des formations par créneau -->

<script src="js/stage.js"></script>

<div id='stage-container'>
    <div id="stage"></div>
</div