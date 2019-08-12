<?php
session_start();
// Values received via ajax
$idCreat=$_SESSION["idUser"];
$date = $_POST['date'];
$start = $_POST['start'];
$end =  $_POST['end'];
$description =  $_POST['description'];

// connection to the database
try {
    $bdd = new PDO('mysql:host=localhost;dbname=veloclub', 'root', '');
} catch (Exception $e) {
    exit('Unable to connect to database.');
}

// insert the records
$sql = "INSERT INTO reparation_membre (date, idUser,startTime, endTime,description) VALUES ( '$date','$idCreat', '$start', '$end','$description' )";
$q = $bdd->query($sql);

