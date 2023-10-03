// Function to load and insert header content
function loadHeader() {
	// Use jQuery's load() function to fetch the header.html content
	$('#header-container').load('header.html');
}

// Function to load and insert footer content
function loadFooter() {
	$('#footer-container').load('footer.html');
}

// Call the loadHeader() function when the document is ready
$(document).ready(function() {
loadHeader();
loadFooter();
});
