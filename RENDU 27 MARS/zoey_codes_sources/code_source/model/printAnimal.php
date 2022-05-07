<?php
session_start();

// print animal on account page

require("model.php");
require("verifyToken.php");
define("BASE_URL", "./");

require("../view/print.php"); //function printAnimal()

try {
    if (isset($_POST['animalId'])) {
        $animalId = safeEntry($_POST['animalId']);

        // securiser id
        // verifier que l'id appartient bien à l'utilisateur
        if (in_array($animalId, $_SESSION['printAnimal'])) {
            $printAnimal = printAnimal($animalId);
            echo $printAnimal;
        } else {
            return false;
        }
    } else {
        return false;
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    return false;
}
