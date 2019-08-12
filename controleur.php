<?php
session_start();

	include_once "libs/maLibUtils.php";
	include_once "libs/maLibSQL.pdo.php";
	include_once "libs/maLibSecurisation.php"; 
	include_once "libs/modele.php"; 

	$qs = "";

	if ($action = valider("action"))
	{
		ob_start ();

		echo "Action = '$action' <br />";

		switch($action)
		{
			case 'sign':
				if ($login = valider("login"))
				if ($passe = valider("passwd"))
				if($adresse = valider("adresse"))
				if($nom= valider("nom"))
				if($prenom = valider("prenom"))
				if($postal= valider("postal"))
				if($ville= valider("ville")){
					addUser($nom, $prenom, $adresse,$postal,$ville, $login, $passe);
					header("Location:controleur.php?login=$login&passe=$passe&action=signin");
				}
				$qs="?view=login";
				break;
			case 'Connexion':
				$qs = "?view=login";

				if ($login = valider("login"))
				if ($passe = valider("passe"))
				{
					if (verifUser($login,$passe)) {
						$qs = "?view=accueil&login=$login&passe=$passe";
					}

				}
				break;

			case 'Reparation_employ':
				if($date= valider("dateRepair"))
					if($idCreat=valider("idUser","SESSION"))
						if($start = valider("start"))
							if($end= valider("end")) {
                            addRepairEmploy($date,$start,$end,$idCreat);
								$qs="?view=repair&date=$date&user=$idCreat";
							}

				break;
			case 'logout' : 
			case 'Logout' :
			case 'deconnexion' :
				session_destroy();
				$qs = "?view=login";


		}

	}



	$urlBase = dirname($_SERVER["PHP_SELF"]) . "/index.php";

	header("Location:" . $urlBase . $qs);

	ob_end_flush();
	
?>










