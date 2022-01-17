define(['jquery','common','bootstrap'], function ($,$common) {
	return function(){
		console.log("invoking header....");
		/*$("#header").load('header.html');
		$("#footer").load('footer.html');
		$("#maincontainer").load("diarylist.html");*/
		
		updateUserSection();
		
		function updateUserSection(){	
			var sessUsr = sessionStorage.getItem('user');
			if(sessUsr != undefined){
				var userObj = JSON.parse(sessUsr);
				
				if(userObj.userType != "invalid"){
					$(".register-login").hide();
		    		$(".greet-user").show();
		    		$(".greet-user .username_span").text("Welcome "+userObj.userName);
				}
			}
		}
		
		
		$("#logout").click(function(){
			$common.logout();
		});
		
		
		$("#admin").click(function(){
			window.location.href="admin.html";
		})
		
		$(".signin-cont .btn-primary").click(function(){
			userVo = {
					"userName":$("#Username").val(),
					"password":$("#Password").val()
			}
			
			$.ajax({
			    url: './webserviceInvokeservlet?wsname=dologin',
			    dataType: 'json',
			    type: 'POST',
			    contentType: 'application/json;charset=UTF-8',
			    data: JSON.stringify(userVo),
			    success: function( data, textStatus, jQxhr ){
			    	sessionStorage.setItem('user',JSON.stringify(data.userDto));
			    	
			    	if(data.userDto.userType == "invalid"){
			    		$(".login-error").html("Invalid Credentials");
			    	}else{
			    		setTimeout(function(){$('.login-register').hide();},500);
			    		updateUserSection();
			    		//window.location.href="admin.html";
			    	}
			    	
			    },
			    error: function( jqXhr, textStatus, errorThrown ){
			        console.log( errorThrown );
			        //$common.showNotification('signup-message',"N","E","Applciation Error with user registration ! Please click <a href=login.html>here</a> to back to application ");
			    },
			    complete:function(){
			    	//$(".form-error").html(messageFromServer);
			    	//$common.showNotification('signup-message',logicStatus,messageStatus,messageFromServer);
			    }
			});
		});
		
		
		
		
		var manuItems = $(".menu-item");
		
		$.each(manuItems,function(i,menu){
			$(menu).click(function(){
				var menuId = $(this).attr('type');
				sessionStorage.setItem("listingtype",menuId);
				if(menuId == "home"){
					window.location.href="index.html";
				}
				//if(menuId == "hc"){
				else{
					window.location.href="cardlisting.html";
				}
				
			});
		});
		
		
		
		$('#login,#register').click(function(){
			if($(this).attr('newuser') == 'yes'){
			$('.signin-cont').hide();
			$('.register-cont').show();
			}
			else{
			$('.signin-cont').show();
			$('.register-cont').hide();
			}
			$('.lrc').removeClass('zoomOut').addClass('zoomIn');
			$('.login-register').show();
			});

		$('.cancel-lrc').click(function(){
			debugger;
			$('.lrc').removeClass('zoomIn').addClass('zoomOut');
			setTimeout(function(){$('.login-register').hide();},500);
			});	
		
	}
});