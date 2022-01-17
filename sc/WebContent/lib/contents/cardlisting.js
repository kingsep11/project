define(['jquery','common','bootstrap'], function ($,$common) {
	return function(){
		console.log("invoking listing pages....");
		/*$("#header").load('header.html');
		$("#footer").load('footer.html');
		$("#maincontainer").load("diarylist.html");*/
		
		
		var cardList = new Array();
		var childCardList = new Array();
		var stIndex = 0; endIndex = 40, totCards=0;
		
		
		var cardType =sessionStorage.getItem("listingtype");
		paintPageTitle();
		
		
		function paintPageTitle()
		{
		  var pageTitle="";
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
			}
			
			$(".title").text(pageTitle);
		}
		
		
		getCardList(cardType);
		
		function getCardList(type){
			$.ajax({
				type:'GET',
				contentType:'application/json',
				url:'./webserviceInvokeservlet?wsname=getCardList&cardType='+type,
				success:function(data){
					cardList = data.cardVO.cardList;
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
				
				htmlStr = htmlStr+'<div class="card-item">'+
                '<div class="card-image"><img src="/products/cards/'+cardItem.name+'.jpg" /><div class="card-name-overlay fadeInDown animated"> <a href="" data-toggle="modal" data-target="#previewcards"><i class="fa fa-search-plus"></i>View Card</a> </div></div>'+
				'<div class="card-detail">'+
                
                '<div class="card-collection-details-container"> '+ 
                    '<div class="card-price"><i class="fa fa-inr"></i> '+cardItem.price+'</div>'+
                    '<div class="card-name">'+cardItem.name+'</div>'+
                '</div>'+
				'</div>'+
            '</div>';
			});
			
			$("#"+type).html(htmlStr);
			
			bindCardItemEvents();
		}
		
		
		function bindCardItemEvents(){
			var cardItmList = $(".card-item");
			
			$.each(cardItmList,function(i,cardItem){
				var viewDet = $(cardItem).find(".fa-search-plus");
				
				$(viewDet).off();
				$(viewDet).on('click',function(){
					console.log(cardItem);
					$common.showCardDetails(cardItem);
				});
			});
		}
		
	}
});