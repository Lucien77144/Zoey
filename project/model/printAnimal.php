<?php

    session_start();
    
    require("model.php");
    require("verifyToken.php");
    define("BASE_URL","../project/");
    
    require("../view/print.php"); //function printAnimal()
    
    try {
        if (isset($_POST['animalId']))
        {
            $animalId = safeEntry($_POST['animalId']);

            // securiser id
            // verifier que l'id appartient bien à l'utilisateur
            if (in_array($animalId, $_SESSION['printAnimal'])){
                $printAnimal = printAnimal($animalId);
                echo $printAnimal;
            } else {
                return false;
            }
        } else {
            // throw new Exception("La demande d'ami n'a pas pu être envoyée");
            return false;
        }
    
    } catch (Exception $e) {
        // echo "catch";
        $errorMsg = $e->getMessage();
        // echo $errorMsg;
        return false;
        // require(BASE_URL . "view/errorView.php");
    }