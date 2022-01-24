<?php
session_start();

// save uploaded photo to server

require('model.php');
require("verifyToken.php");

if (!verifyToken()){
//   exit('déconnecté');
}

require_once("../vendor/lib/Tinify/Exception.php");
require_once("../vendor/lib/Tinify/ResultMeta.php");
require_once("../vendor/lib/Tinify/Result.php");
require_once("../vendor/lib/Tinify/Source.php");
require_once("../vendor/lib/Tinify/Client.php");
require_once("../vendor/lib/Tinify.php");


// function compressImage($source_url, $destination_url, $quality) {
//     $info = getimagesize($source_url);

//     if ($info['mime'] == 'image/jpeg') $image = imagecreatefromjpeg($source_url);
//     elseif ($info['mime'] == 'image/gif') $image = imagecreatefromgif($source_url);
//     elseif ($info['mime'] == 'image/png') $image = imagecreatefrompng($source_url);

//     //save file
//     imagejpeg($image, $destination_url, $quality);

//     //return destination file
//     return $destination_url;
// }

function postPhoto(){
    $uploadDirectory = "public/images/upload/";

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
    // $uploadPath = strval($uploadPath);
    // "../../" . $uploadDirectory . $uploadName;

    if (! in_array($fileExtension,$fileExtensionsAllowed)) {
    // throw new Exception("Zoey n'accepte que des photos JPEG ou PNG pour le moment.");
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

            // compress

            \Tinify\setKey("pSM69JsH2zKBrydR7x6dpdJdfsBXx3CM");
            $source = \Tinify\fromFile($uploadPath);
            $resized = $source->resize(array(
                "method" => "scale",
                "width" => 800
            ));
            $resized->toFile($uploadPath);

            return strval($uploadName);

        } else {
            var_dump($fileTmpName);
            var_dump($didUpload);


            echo "Erreur";
            // return false;
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

    