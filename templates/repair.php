<?php


if (basename($_SERVER["PHP_SELF"]) != "index.php")
{
    header("Location:../index.php?view=repair");
    die("");
}

?>
<!--reparation par des employées de l'association-->
<h3 id="repairTitle">

    Les réparations faites par les employés <span>Payante</span> correspondent le dépôt d’un vélo :<br>
     <span>Date</span>  + <span>startTime</span> + <span>endTime</span></h3>
    <div class="form" id="repair_container">
        <form class="reparationForm" action="controleur.php" method="GET">
           <label for="dateRepair">Date:</label><input type="date" name="dateRepair" min="2019-01-01" max="2020-12-31" /><br />
            <label for="start"> StartTime:</label><input type="time" name="start"  /><br />
            <label for="end">EndTime:</label> <input type="time" name="end" ><br />
            <input type="submit" name="action" value="Reparation_employ" />

        </form>

    </div>

