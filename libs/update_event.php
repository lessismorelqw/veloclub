<?php
session_start();
/* Values received via ajax */
$idUpdate = $_POST['id'];
$start = $_POST['start'];
$end = $_POST['end'];
$idUser=$_SESSION["idUser"];
// connection to the database
try {
    $bdd = new PDO('mysql:host=localhost;dbname=veloclub', 'root', '');
} catch(Exception $e) {
    exit('Unable to connect to database.');
}
// update the records
$sql = "UPDATE reparation_membre SET startTime='$start', endTime='$end' WHERE idRepair='$idUpdate'AND idUser='$idUser'";

$q = $bdd->query($sql);

