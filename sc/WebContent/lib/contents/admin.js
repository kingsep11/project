define(['jquery','common','bootstrap'], function ($,$common) {
	return function(){
		console.log("invoking listing pages....");
		/*$("#header").load('header.html');
		$("#footer").load('footer.html');
		$("#maincontainer").load("diarylist.html");*/
		
		
		var cardList = new Array();
		var childCardList = new Array();
		var stIndex = 0; endIndex = 40, totCards=0;
		
		
		//var cardType =sessionStorage.getItem("listingtype");
		paintPageTitle();
		
		
		function paintPageTitle()
		{
		 /* var pageTitle="";
			if(cardType=="hc"){
				pageTitle = "Hindu Wedding Cards";
			}
			if(cardType=="sc"){
				pageTitle = "Special Wedding Cards";
			}
			if(cardType=="cc"){
				pageTitle = "Christian Wedding Cards";
			}
			if(cardType=="mc"){
				pageTitle = "Muslim Wedding Cards";
			}
			if(cardType=="pc"){
				pageTitle = "Personal Wedding Cards";
			}
			if(cardType=="ca"){
				pageTitle = "Calendar Collections";
			}
			if(cardType=="dy"){
				pageTitle = "Dairies Collections";
			}*/
			
			$(".title").text("Admin - Manage Cards");
		}
		
		
		getCardList();
		
		function getCardList(){
			$.ajax({
				type:'GET',
				contentType:'application/json',
				url:'./webserviceInvokeservlet?wsname=getCardListForAdmin',
				success:function(data){
					cardList = data.cardVO.cardList;
				},
				error:function(){
					console.log("Eror occured in admin login");
					$common.logout();
				},
				complete:function(){
					if(cardList !=null && cardList != undefined){
						totCards=cardList.length;
						if(cardList.length<40){
							$(".pagination").hide();
							endIndex = cardList.length;
						}
					}
					manageCardsList();
					adjustPageinationDisplay();
				}
			});
		
		}
		
		
		function adjustPageinationDisplay(){
			$(".st").text(stIndex);
			$(".ed").text(endIndex);
			$(".tot").text(totCards);
		}
		
		
		function manageCardsList(){
			childCardList = cardList.slice(stIndex,endIndex);
			paintCardItem(childCardList,"cardlistdiv");
			adjustPageinationDisplay();

		}
		
		
		$(".prev").click(function(){
			stIndex = stIndex-40;
			endIndex = endIndex-40;
			$(".next").show();
			
			if(stIndex<=0){
				stIndex=0;
				endIndex=40;
				$(".prev").hide();
			}
			
			manageCardsList();
		});
		

		
		$(".next").click(function(){
			stIndex = stIndex+40;
			endIndex = endIndex+40;
			$(".prev").show();
			
			if(endIndex>=totCards){
				endIndex=totCards;
				stIndex=totCards-40;
				$(".next").hide();
			}
			
			manageCardsList();
		});

		function paintCardItem(cardList,type){
			var htmlStr = '';
			$.each(cardList,function(i,cardItem){
				
				var ptypeCommaStr = cardItem.type;
				var ptypeArry = new Array();
				
				if(ptypeCommaStr.indexOf(",") > -1)
				{
					ptypeArry=ptypeCommaStr.split(",");
				}
				
				htmlStr = htmlStr+'<div class="card-item">'+
                '<div class="card-image"><img src="/products/cards/'+cardItem.name+'.jpg" /></div>'+
				'<div class="card-detail">'+
	                '<div class="card-collection-details-container"> '+ 
	                    '<div class="card-price"><i class="fa fa-inr"></i> '+cardItem.price+'</div>'+
	                    '<div class="card-name">'+cardItem.name+'</div>'+
	                '</div>'+
				'</div>';
				
				if(ptypeArry.length==0){
					htmlStr = htmlStr+'<div class="form-group">'+
					'<div class="checkbox">'+
					'<label><input type="checkbox" cardname="'+cardItem.name+'" ptype="'+ptypeCommaStr+'">'+ptypeCommaStr+'</label>'+
					'</div></div>';
				}else{
				
				/*htmlStr = htmlStr+'<div class="form-group">'+
					'<div class="checkbox">'+
					'<label><input type="checkbox" cardname="'+cardItem.name+'" ptype="all"> All</label>'+
					'</div>';*/
				
				$.each(ptypeArry,function(i,itm){
				htmlStr = htmlStr+'<div class="checkbox">'+
						'<label><input type="checkbox" cardname="'+cardItem.name+'" ptype="'+itm+'">'+itm+'</label>'+
					'</div>';
			   
				});
				htmlStr = htmlStr+'</div>';
				}
			   
			htmlStr = htmlStr+'</div>';
			});
			
			$("#"+type).html(htmlStr);
			bindEventsToChkBox();
		}
		
		
		var chkBoxSelArray = new Array();
		function bindEventsToChkBox(){
			var chkBoxArray = $('input[type="checkbox"]');
			chkBoxSelArray = new Array();
			
			$.each(chkBoxArray,function(i,chkBox){
				//if($(chkBox))
				console.log(chkBox.checked);
				
				$(chkBox).off();
				$(chkBox).on('click',function(){
					if(this.checked){
						chkBoxSelArray.push({"cardname":$(this).attr('cardname'),"ptype":$(this).attr('ptype')});
					}else{
						console.log("unchecked---- "+$(this).attr('cardname'));
						
						var unselCardName = $(this).attr('cardname');
						var unselPtype = $(this).attr('ptype');
						
						$.each(chkBoxSelArray, function(i, el){
						    if((el.cardname == unselCardName) && (el.ptype == unselPtype)){
						    	chkBoxSelArray.splice(i, 1);
						    	return false;
						    }
						});
						
					}
				});
			});
		}
		
		
		$(".btn-third").click(function(){
			deleteCards();
		});
		
		function deleteCards(){
			
			//var delCardVo = {"delCardVo":chkBoxSelArray};
			
			var delCardVo = {chkBoxSelArray};
			
			$.ajax({
			    url: './webserviceInvokeservlet?wsname=deletecards',
			    dataType: 'json',
			    type: 'POST',
			    contentType: 'application/json;charset=UTF-8',
			    data: JSON.stringify(delCardVo),
			    success: function( data, textStatus, jQxhr ){
			    	
			    },
			    error: function( jqXhr, textStatus, errorThrown ){
			        console.log( errorThrown );
			        //$common.showNotification('signup-message',"N","E","Applciation Error with user registration ! Please click <a href=login.html>here</a> to back to application ");
			    },
			    complete:function(){
			    	//$(".form-error").html(messageFromServer);
			    	$common.showNotification('alert-box','Y',null,"Cards Deleted successfully");
			    	getCardList();
			    }
			});

		}
		
		
	}
});