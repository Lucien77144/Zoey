async function postFormDataAsJson({ url, formData }) {
	const plainFormData = Object.fromEntries(formData.entries());
    console.log('plainFormData ', plainFormData);
	const formDataJsonString = JSON.stringify(plainFormData);

    console.log('formDataJsonString ', formDataJsonString);

    fetch('http://localhost/Zoey/algo_quizz/quizz.php', {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
        },
        body: formDataJsonString,
    }).then(response => { 
    response.json().then(function(data){ 
        console.log('d ',data);
        return response;
    })
    })
}

async function handleFormSubmit(event) {
	event.preventDefault();
	const form = event.currentTarget;
	const url = form.action;

	try {
		const formData = new FormData(form);
        console.log('formData ', formData);
		const responseData = await postFormDataAsJson({ url, formData });
		console.log({ responseData });
	} catch (error) {
		console.error(error);
	}
}

document.getElementById('formQuizz').addEventListener("submit", handleFormSubmit);