<?php
session_start();
// Values received via ajax
$idDelete=$_SESSION["idUser"];
$id = $_POST['id'];
$idUser=$_POST["idUser"];

try {
    $bdd = new PDO('mysql:host=localhost;dbname=veloclub', 'root', '');
} catch (Exception $e) {
    exit('Unable to connect to database.');
}

    $sql = "DELETE from reparation_membre WHERE idRepair='$id' AND idUser='$idDelete'";
    $q = $bdd->query($sql);

