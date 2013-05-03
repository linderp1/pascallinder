function saveEmailAddr() {
	//1. Get the address value
	address = document.getElementById('emailAddress').value;
	
	//2. Create a request
	request = createRequest();
	
	//3. Set the url with parameters
	var url = '/SaveAddress?Address=' + escape(address) + '&Type=email'
	
	//4. Asynchronous GET request to the url
	request.open('GET', url, true);
	
	//alert(request.responseText);
	
	// 5. Display return message
	request.onreadystatechange = function() {
		if (request.readyState == 4 && request.status == 200) {
			alert(request.responseText);
		}
	}
	// 5. Display return message
	request.onreadystatechange = function() {
		if (request.readyState == 4 && request.status == 404) {
			alert(request.responseText);
		}
	}
	
	//6. Send without extras
	request.send(null);
}

function saveTextAddr() {
	//1. Get the address value
	address = document.getElementById('textAddress').value;
	
	//2. Create a request
	request = createRequest();
	
	//3. Set the url with parameters
	var url = '/SaveAddress?Address=' + escape(address) + '&Type=text';
	
	//4. Asynchronous GET request to the url
	request.open('GET', url, true);
	
	//5. Send without extras
	request.send(null);
}