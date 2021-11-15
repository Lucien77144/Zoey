<?php 
$pageTitle = 'Post';
$post = $post->fetch();
ob_start();
?>
   
<!-- qui sommes+nous goes here -->

<?php
    }
}
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');