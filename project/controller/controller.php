<?php
require_once(BASE_URL . "model/model.php");

$blog = getBlog();
$pageTitle = "Blog";

require(BASE_URL . "view/blogView.php");