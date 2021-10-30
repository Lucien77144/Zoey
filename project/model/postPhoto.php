<?php
session_start();

require('model.php');
require_once("verifyToken.php");

if (!verifyToken()){
  exit('déconnecté');
}

function postPhoto(){
    $uploadDirectory = "public/images/";

    $errors = [];

    $fileExtensionsAllowed = ['jpeg','jpg','png'];

    $fileName = safeEntry($_FILES['media']['name']);
    $fileSize = $_FILES['media']['size'];
    $fileTmpName  = $_FILES['media']['tmp_name'];
    $fileType = $_FILES['media']['type'];
    $explodedFilename = explode('.',$fileName);
    $fileExtension = strtolower(end($explodedFilename));

    $uploadName = $_SESSION['idUser'] . time() . "." . $fileExtension;
    $uploadPath = "../" . $uploadDirectory . $uploadName;

    if (! in_array($fileExtension,$fileExtensionsAllowed)) {
    // throw new Exception("Zoey n'accepte que des photos JPEG ou PNG pour le moment.");s
        $errors[] = "Zoey n'accepte que des photos JPEG ou PNG pour le moment.";
    }

    if ($fileSize > 8000000) {
    // throw new Exception("Zoey n'accepte pas les photos de plus de 8Mo pour le moment.");
        $errors[] = "Zoey n'accepte pas les photos de plus de 8Mo pour le moment.";
    }

    if (empty($errors)) {
        $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

        if ($didUpload) {
            // echo "Le fichier " . basename($fileName) . " a bien été uploadé";
            // return "valid";
            return strval($uploadName);

        } else {
            // echo "Erreur";
            return false;
        }

    } else {
        // foreach ($errors as $error) {
        //     echo $error . " -> erreurs" . "\n";
        // }
        return false;
    }
}

try {
    if (
      // isset($_POST['description'])
    isset($_FILES['media'])
    )
    {
        $postPhoto = postPhoto();
        echo $postPhoto;
    } else {        
        // throw new Exception("L'importation a échoué.");
        return false;
    }

} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    // echo $errorMsg;
    return false;
    // require(BASE_URL . "view/errorView.php");
}

    