<?php 
// default page title
ob_start();
?>
    <article class="defaultBlock">
        <h1>
            Erreur !
        </h1>
        
        <p>
            :/ <br>
            <?= nl2br(htmlspecialchars($errorMsg)) ?>
        </p>
    </article>
<?php
    $viewContent = ob_get_clean();
    require('template.php');