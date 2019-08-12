<?php


if (basename($_SERVER["PHP_SELF"]) != "index.php")
{
	header("Location:../index.php?view=accueil");
	die("");
}
include_once("libs/modele.php"); // listes
include_once("libs/maLibUtils.php");// tprint



?>

<div id="corps">
 <form id="list_container" method="GET">
        <input id="date" type="date" name="dateChoisir"  min="2018-12-31" max="2020-12-31">
        <input class="button_search" type="submit"  value="Chercher"  ></br>
        <table id="table_activity">
                <tr>
                    <th>Date</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Type</th>
                    <th>Description</th>

                </tr>

            <?php
            //lister des activités de la date choisi.
            if($idChercher=valider("connecte","SESSION")){
            if($date=valider("dateChoisir")){
                    $activity=listerActivity($date);
                    for($i=0;$i<count($activity);$i++){
                        if($i<5){
                            echo "\t<tr>\n";
                            echo"\t\t <td>".$activity[$i]["date"]."</td>\n";
                            echo"\t\t <td>".$activity[$i]["startTime"]."</td>\n";
                            echo"\t\t <td>".$activity[$i]["endTime"]."</td>\n";
                            echo" \t\t<td>".$activity[$i]["type"]."</td>";
                            echo" \t\t<td>".$activity[$i]["description"]."</td>";
                            echo"\t</tr>\n";
                        }else{
                            break;
                        }

                    }
                }else{
                echo "<script type='text/javascript'>alert('Choisir une date ,S\'il vous plaît');</script>";
                }
            }else{
                $urlBase = dirname($_SERVER["PHP_SELF"]) . "/index.php";
                header("Location:" . $urlBase . "?view=signin");
            }

            ?>
        </table>
    </form>

</div>
