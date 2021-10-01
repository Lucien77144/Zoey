<?php
    session_start();
    include_once "config.php";
    $nom = mysqli_real_escape_string($conn, $_POST['nom']);
    $lname = mysqli_real_escape_string($conn, $_POST['lname']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    if(!empty($nom) && !empty($lname) && !empty($email) && !empty($password)){
        if(filter_var($email, FILTER_VALIDATE_EMAIL)){
            $sql = mysqli_query($conn, "SELECT * FROM users WHERE email = '{$email}'");
            if(mysqli_num_rows($sql) > 0){
                echo "$email - This email already exist!";
            }else{
                $ran_id = rand(time(), 100000000);
                //$encrypt_pass = md5($password);
                $insert_query = mysqli_query($conn, "INSERT INTO users (unique_id, fname, lname, email, password)
                VALUES ({$ran_id}, '{$nom}','{$lname}', '{$email}', '{$password}')");
                if($insert_query){
                    $select_sql2 = mysqli_query($conn, "SELECT * FROM users WHERE email = '{$email}'");
                    if(mysqli_num_rows($select_sql2) > 0){
                        $result = mysqli_fetch_assoc($select_sql2);
                        $_SESSION['unique_id'] = $result['unique_id'];
                        echo "success";
                    }else{
                        echo "L'adresse mail n'existe pas";
                    }
                }else{
                    echo "Quelque chose c'est mal passé, essayez encore";
                }
            }
        }else{
            echo "$email n'est pas un mail valide";
        }
    }else{
        echo "Tous les champs sont requis!";
    }
?>