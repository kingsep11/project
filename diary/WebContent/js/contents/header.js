define(['jquery','memenu'], function ($) {
	return function(){
		console.log("header called.....");
		loadMenu();
		function loadMenu(){
			$(".memenu").memenu();
			
			$('.lnkdiary').off();
			$('.lnkdiary').on('click',function(){
				if($(this).attr("id")=="diary2"){
					sessionStorage.setItem('category', 2);
				}
				if($(this).attr("id")=="diary1"){
					sessionStorage.setItem('category', 1);
				}
				if($(this).attr("id")=="diary3"){
					sessionStorage.setItem('category', 3);
				}
				
				window.location.href="home.html";
			});
		}
	}
});