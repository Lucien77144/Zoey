<?php
session_start();

if (!isset($_SESSION['idUser']) && isnumeric($_SESSION['idUser'])){
  exit('déconnecté');
}

require("model.php");



// function safeEntry($validate){
//     $validate = trim($validate);
//     $validate = stripslashes($validate);
//     $validate = htmlspecialchars($validate);
//     return $validate;
// }

function postAddPost(){
    // $description = safeEntry($_POST['description']);
    
    // $currentDirectory = getcwd();
    $uploadDirectory = "public/images/";

    $errosrs = [];

    $fileExtensionsAllowed = ['jpeg','jpg','png'];

    $fileName = safeEntry($_FILES['media']['name']);
    $fileSize = $_FILES['media']['size'];
    $fileTmpName  = $_FILES['media']['tmp_name'];
    $fileType = $_FILES['media']['type'];
    $explodedFilename = explode('.',$fileName);
    $fileExtension = strtolower(end($explodedFilename));

    $uploadPath = "../" . $uploadDirectory . "uploadedOn" . time() . "_by_" . $_SESSION['idUser'] . "_" . basename($fileName);

    if (isset($_FILES['media'])) {

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
          echo "Le fichier " . basename($fileName) . " a bien été uploadé";
        } else {
          echo "Erreur";
        }
      } else {
        foreach ($errors as $error) {
          echo $error . " -> erreurs" . "\n";
        }
      }

    }
    
    
    // require("PDO.php");

    // $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    // (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    // $sql = "INSERT INTO post (description, media) VALUES (:description, :media)";
    // $req = $db -> prepare($sql);
    
    // $req -> execute(array(
    //     ':description' => $description,
    //     ':media' => $fileName));

    // if ($req->rowCount() <= 0)
    //     throw new Exception("L'importation a échoué.1");

    return "valid";
}

try {
    if (
      // isset($_POST['description'])
    isset($_FILES['media'])
    )
    {
        $postAddPost = postAddPost();
        echo $postAddPost;
    } else {        
        throw new Exception("L'importation a échoué.2");
    }

} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}

    