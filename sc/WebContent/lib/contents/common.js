define(['jquery'], function ($) {
	return {
		
		
		
		
		logout:function(){
			
			$.ajax({
				type:'GET',
				contentType:'application/json',
				url:'./webserviceInvokeservlet?wsname=logout',
				success:function(data){
					sessionStorage.clear();
					window.location.href="index.html";
				},
				error:function(){},
				complete:function(){}
			});

		},
		
		
		/** For checking if the user logged in based on enable menu**/
		chkUserSession:function(){
			console.log("called chkUserSession......");
			var userObj=null;
			/** if the user information available in session **/
			if(sessionStorage.getItem('user')!= undefined && sessionStorage.getItem('user')!= null)
			{
				console.log("user session available....");
				userObj=JSON.parse(sessionStorage.getItem('user'));
				console.log(userObj);
				
				
				if(userObj!=null && userObj.userDto.logicStatus=="Y"){
					$(".usertitle").html(userObj.userDto.userName);
					$("#usernameLblLnk").text(userObj.userDto.userName);
					$(".login").remove();
				}
				
				
				if(userObj!=null && userObj.userDto.isadmin=="N"){
					$("#admindiv").remove();
				}
				
			}
			else{
				$("#admindiv").remove();
				$(".logout").remove();
			}
		},
		
		
		showNotification1:function(logicStatus,messageStatus,message){
			
			if(logicStatus=="Y"){
				$("#message").show();
				$("#message").addClass("alert-success");
				$("#message").html(message);
			}else if(logicStatus=="Y" && messageStatus=="A"){
				$("#message").show();
				$("#message").removeClass("alert-success");
				$("#message").removeClass("alert-danger");
				$("#message").addClass("alert-warning");
				$("#message").html(message);

			}else{
				$("#message").show();
				$("#message").removeClass("alert-success");
				$("#message").removeClass("alert-warning");
				$("#message").addClass("alert-danger");
				$("#message").html(message);	
			}
			
		},

showNotification:function(div,logicStatus,messageStatus,message){
			
			if(logicStatus=="Y"){
				$(".fixed-alert").show();
				$(".fixed-alert #"+div).show();
				$(".fixed-alert #"+div).addClass("alert-success");
				$(".fixed-alert #"+div).html('<strong>'+message+'</strong><span class="pull-right close">X</span>');
			}else if(logicStatus=="Y" && messageStatus=="A"){
				$(".fixed-alert").show();
				$(".fixed-alert #"+div).show();
				$(".fixed-alert #"+div).removeClass("alert-success");
				$(".fixed-alert #"+div).removeClass("alert-danger");
				$(".fixed-alert #"+div).addClass("alert-warning");
				$(".fixed-alert #"+div).html('<strong>'+message+'</strong><span class="pull-right close">X</span>');

			}else{
				$(".fixed-alert").show();
				$(".fixed-alert #"+div).show();
				$(".fixed-alert #"+div).removeClass("alert-success");
				$(".fixed-alert #"+div).removeClass("alert-warning");
				$(".fixed-alert #"+div).addClass("alert-danger");
				$(".fixed-alert #"+div).html('<strong>'+message+'</strong><span class="pull-right close">X</span>');	
			}
			
			$(".close").off();
			$(".close").on('click',function(){
				$(".fixed-alert").hide();
			});
			
			
		},

		getUserObject:function(){
			var userObj=JSON.parse(sessionStorage.getItem('user'));
			return userObj;
		},
		
		
		showCardDetails:function(cardItem){
			
			var cardName = $(cardItem).find(".card-collection-details-container").find(".card-name").html();
			var cardPrice = $(cardItem).find(".card-collection-details-container").find(".card-price").text();
			
			$("#previewcards").find(".modal-title").text(cardName);
			$("#previewcards").find(".card-price-modal").html('<i class="fa fa-inr"></i>'+cardPrice);
			
			$(".modal-body").html('<img src="/products/cards/'+cardName+'.jpg" style="width: 75%;">');
			
		}
		
	};
});