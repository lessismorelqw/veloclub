<?php

/*
Dans ce fichier, on définit diverses fonctions permettant de récupérer des données utiles pour notre TP d'identification. Deux parties sont à compléter, en suivant les indications données dans le support de TP
*/

include_once("libs/maLibSQL.pdo.php");


/*ajouter utilisateur et son information sur la page signin.php

*/
function addUser($nom, $prenom, $adresse,$postal,$ville, $login, $passe){
	$sql = "INSERT INTO user(pseudo, passwd, nom, prenom, codePostal,ville,adresse)";
	$sql.="VALUES ('$login', '$passe', '$nom', '$prenom', '$postal','$ville','$adresse')";
	return SQLInsert($sql);
}

function verifUserBdd($login,$passe)
{
	$SQL = "SELECT idUser FROM user WHERE pseudo='$login' AND passwd='$passe'";
	return SQLGetChamp($SQL);
}


/*lister des activité dans la page accuiel
@date: la date choisi sur la page d'accueil, en format(yyyy-MM-dd)
*/
function listerActivity($date){
    $SQL="SELECT stage.date,stage.type,stage.description,stage.startTime,stage.endTime";
    $SQL.=" FROM stage";
    $SQL.=" WHERE stage.date='$date'";
	$SQL.=" UNION SELECT date,type,description,startTime,endTime FROM reparation_employ WHERE date='$date'";
	$SQL.=" UNION SELECT date,type,description,startTime,endTime FROM reparation_membre WHERE date='$date'";
	$SQL.=" ORDER BY startTime";

	return parcoursRs(SQLSelect($SQL));

}
/*ajouter reparation par des employés sur la page repair.php
@date: la date en format(yyyy-MM-dd)
@start: temps de début en  format(HH:mm:ss)
@end: temps de finn  format(HH:mm:ss) (la même jour de date )
@idCreat: $_SESSION["idUser"]
*/
function addRepairEmploy($date,$start,$end,$idCreat){
	$SQL="INSERT INTO reparation_employ(date,startTime,endTime,idUser)  VALUES('$date','$start','$end','$idCreat')";
	return SQLInsert($SQL);
}



?>
