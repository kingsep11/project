define(['jquery','jquery_dropdown','simpleCart'], function ($) {
	return function(){
		console.log("invoking load header");
		$("#header").load('header.html');
		$("#footer").load('footer.html');
		$("#maincontainer").load("diarylist.html");
	}
});