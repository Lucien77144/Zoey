<?php 
$pageTitle = "Publier un post";
ob_start();
?>

<form id="addPostForm">
    <label for="description">description</label>
    <input type="text" name="description" id="description"> <br>

    <label for="media">photo</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg">

    <input type="submit" id="submitAddPost">
</form>
<span id="ConfirmationMessage"></span>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');