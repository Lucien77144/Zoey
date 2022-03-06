<?php

function encrypt($plaintext)
{
    //$key devrait être généré précédemment d'une manière cryptographique, tel que openssl_random_pseudo_bytes
    // $key = openssl_random_pseudo_bytes(10, $strong_result);
    // $cipher = "aes-128-gcm";
    // $ivlen = openssl_cipher_iv_length($cipher);
    // $iv = openssl_random_pseudo_bytes($ivlen);


    // encrypt
    $ressource = fopen('./private_crypt/key.json', 'r');
    $stored = fread($ressource, filesize('./private_crypt/key.json'));
    $stored = json_decode($stored, true);
    $key = base64_decode($stored['key']);
    $iv = base64_decode($stored['iv']);
    $ciphertext = openssl_encrypt($plaintext, "aes-128-gcm", $key, $options = 0, $iv, $tag);
    // tag and ciphertext to db


    //store $cipher, $iv, and $tag for decryption later

    // $store = array('key' => base64_encode($key), 'iv' => base64_encode($iv), 'tag' => base64_encode($tag));
    // file_put_contents('./write/key.json', json_encode($store));

    $ciphertext = "U7Z9G2fqFH4Ckrf5TvBS+l47pSZK";


    // decrypt
    $ressource = fopen('./private_crypt/key.json', 'r');
    $stored = fread($ressource, filesize('./private_crypt/key.json'));
    $stored = json_decode($stored, true);
    $key = base64_decode($stored['key']);
    $iv = base64_decode($stored['iv']);
    // tag and ciphertext from db
    $original_plaintext = openssl_decrypt($ciphertext, "aes-128-gcm", $key, $options = 0, $iv, $tag);


    echo $ciphertext . "<br>";

    echo $original_plaintext . "\n";
}

encrypt("test ' 😂 \" @ é&-!");
