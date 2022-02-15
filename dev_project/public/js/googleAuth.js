function handleCredentialResponse(response) {
    console.log("Encoded JWT ID token: " + response.credential);

    fetch('model/googleAuth.php', {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
        },
        body: JSON.stringify(response.credential),
    }).then(response => {
        response.json().then(function(data) {
            console.log('d ', data);
            return response;
        })
    })
}
window.onload = function() {
    google.accounts.id.initialize({
        client_id: "866214768583-13jeokh10iam9q1chmeiphgok3gbkr1i.apps.googleusercontent.com",
        callback: handleCredentialResponse
    });
    google.accounts.id.renderButton(
        document.getElementById("googleAuthButton"), {
            theme: "outline",
            size: "large"
        } // customization attributes
    );
    google.accounts.id.prompt(); // also display the One Tap dialog
}