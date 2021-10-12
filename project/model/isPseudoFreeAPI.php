<?php

require('model.php');

$apianswer = isPseudoFree($_POST['checkPseudo']);

echo $apianswer;