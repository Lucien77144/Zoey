<?php
require('db_config.php');

if(isset($_GET['categorie'])){
    $categorie = htmlspecialchars($_GET['categorie']);
    $result = [];
    $sql = 'SELECT titre, `resume`, url_article, url_image FROM blog, categorie_blog WHERE blog.fk_idcategorie=categorie_blog.id AND categorie_blog.nom=? ORDER BY `blog`.`date_publication` ASC';
    $req = $link -> prepare($sql);
    $req -> bindValue(1, $categorie, PDO::PARAM_STR);
    $req -> execute();

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