<?php
session_start();
// Values received via ajax
$idStage= $_POST['id'];
$idSelect=$_SESSION["idUser"];
// connection to the database
try {
    $bdd = new PDO('mysql:host=localhost;dbname=veloclub', 'root', '');
} catch (Exception $e) {
    exit('Unable to connect to database.');
}

// insert the records
$sql = "INSERT INTO choixStage(idUser,idStage) VALUES ('$idSelect', '$idStage')";
$q = $bdd->query($sql);


