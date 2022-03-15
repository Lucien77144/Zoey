<?php

require_once("../vendor/lib/Tinify/Exception.php");
require_once("../vendor/lib/Tinify/ResultMeta.php");
require_once("../vendor/lib/Tinify/Result.php");
require_once("../vendor/lib/Tinify/Source.php");
require_once("../vendor/lib/Tinify/Client.php");
require_once("../vendor/lib/Tinify.php");

$post = json_decode(file_get_contents('php://input'), true);

if (isset($post['photo'])) {
    $uploadName = $post['photo'];
    $uploadPath = "../" . "public/images/upload/" . $uploadName;

    // \Tinify\setKey("pSM69JsH2zKBrydR7x6dpdJdfsBXx3CM"); //clé marin
    \Tinify\setKey("X0ZpbDCLBVMgPDbvQGm9mJJzbCmrlSf1"); // clé app.zoey
    $source = \Tinify\fromFile($uploadPath);
    $resized = $source->resize(array(
        "method" => "scale",
        "width" => 800
    ));
    $resized->toFile($uploadPath);

    echo json_encode(true);
} else {
    echo json_encode(false);
}
