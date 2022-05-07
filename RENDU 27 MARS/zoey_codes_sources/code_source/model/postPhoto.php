<?php
session_start();

// save uploaded photo to server

require('model.php');
require("verifyToken.php");

if (!verifyToken()) {
    exit('déconnecté');
}

function postPhoto()
{
    $namePrefix = $_SESSION['idUser'];

    $uploadDirectory = "public/images/upload/";

    $errors = [];

    $fileExtensionsAllowed = ['jpeg', 'jpg', 'png'];

    $fileName = safeEntry($_FILES['media']['name']);
    $fileSize = $_FILES['media']['size'];
    $fileTmpName  = $_FILES['media']['tmp_name'];
    $fileType = $_FILES['media']['type'];
    $explodedFilename = explode('.', $fileName);
    $fileExtension = strtolower(end($explodedFilename));

    $uploadName = $namePrefix . time() . "." . $fileExtension;
    $uploadPath = "../" . $uploadDirectory . $uploadName;

    if (!in_array($fileExtension, $fileExtensionsAllowed)) {
        $errors[] = "Zoey n'accepte que des photos JPEG ou PNG pour le moment.";
    }

    if ($fileSize > 8000000) {
        $errors[] = "Zoey n'accepte pas les photos de plus de 8Mo pour le moment.";
    }

    if (empty($errors)) {
        $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

        if ($didUpload) {

            return strval($uploadName);
        } else {
            echo "Erreur";
        }
    } else {
        return false;
    }
}

try {
    if (
        isset($_FILES['media'])
    ) {
        $postPhoto = postPhoto();

        $explodedFilename = explode('.', $postPhoto);
        $fileExtension = strtolower(end($explodedFilename));
        if (in_array($fileExtension, ['jpeg', 'jpg', 'png'])) {
            echo $postPhoto;
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
