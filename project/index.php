<?php
session_start();
$pageTitle = "Zoey";
$targetPage = NULL;

$getTargetPage = "";
if (isset($targetPage)){
    $getTargetPage = "?action=" . $targetPage;
}
require("view/template.php" . $getTargetPage);