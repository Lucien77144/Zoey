<?php
include('db_config.php');

if(isset($_GET['categorie'])){
    $sql = "SELECT titre, `resume`, url_contenu_article, url_image_mise_en_avant FROM blog, categorie_blog WHERE blog.fk_idcategorie=categorie_blog.id AND categorie_blog.nom={$_GET['categorie']}ORDER BY `blog`.`date_publication` ASC";
    $req = $link -> prepare($sql);
    $req -> execute();
    $result = [];

    for($i = 0; $res = $req->fetch(PDO::FETCH_ASSOC); $i++){
        $result[$i] = $res;
    }

    $length = count($result);
    if($length<7){
        $temp=0;
        for($i = 0; $i<(8-$length); $i++){
            if(isset($result[$temp])){
                $result[] = $result[$temp];
                $temp++;
            }else{
                $temp=0;
            }
        }
    }
    echo json_encode($result); // Envoie sous forme de JSON du resultat
}

?>