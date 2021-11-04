<?php
function isMemberOfTheConversation(){
    $getConversationUsers = getConversationUsers(0);
    if ($getConversationUsers){
        $user = $getConversationUsers -> fetchAll();
        for ($i=0; $i < count($user); $i++) {
            if ($user[$i]['user'] == $_SESSION['idUser']){
                return true;
            }
        }
    } else {
        return false;
    }

    return false;
}