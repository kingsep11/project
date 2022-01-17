define(['jquery','common','bootstrap'], function ($,$common) {
	return function(){
		console.log("invoking home");
		/*$("#header").load('header.html');
		$("#footer").load('footer.html');
		$("#maincontainer").load("diarylist.html");*/
		
		$(".carousel-control").hide();
		
		getCardList('sc');
		function getCardList(type){
			$.ajax({
				type:'GET',
				contentType:'application/json',
				url:'./webserviceInvokeservlet?wsname=getCardList&cardType='+type,
				success:function(data){
					var cardList = data.cardVO.cardList;
					var minIndex = Math.floor(Math.random() * (cardList.length-12));
					var childCardList = cardList.slice(minIndex,minIndex+12);
					paintCardItem(childCardList,type);
				},
				complete:function(){
					if(type=='sc'){
						getCardList('pc');
					}
				}
			});
		
		}
		
		
		function paintCardItem(cardList,type){
			var htmlStr = '';
			$.each(cardList,function(i,cardItem){
				
				/*htmlStr = htmlStr+'<div class="card-item">'+
				//'<div class="card-image"><img src="images/'+i+'.jpg" /></div>'+
                '<div class="card-image"><img src="/products/cards/'+cardItem.name+'.jpg" /></div>'+
				'<div class="card-detail">'+
                '<div class="card-name">'+cardItem.name+'</div>'+
                '<div class="card-collection-details-container"> '+ 
                    '<div class="card-price"><i class="fa fa-inr"></i> '+cardItem.price+'</div>'+
                    '<div class="card-details-container">'+
                       '<span class="card-details">'+
                            '<span class="details-icon"></span>'+
                            '<span class="details-text">DETAILS</span>'+
                        '</span>'+
                    '</div>'+
                '</div>'+
				'</div>'+
               // '<div ng-if="item.isNew" class="new-ribbon"></div>'+
            '</div>';*/
				
				htmlStr = htmlStr+'<div class="card-item">'+
				//'<div class="card-image"><img src="images/'+i+'.jpg" /><div class="card-name-overlay fadeInDown animated"> <a href=""><i class="fa fa-shopping-cart"></i> Add to cart</a><a href=""><i class="fa fa-info-circle"></i> View detail</a><a href="" data-toggle="modal" data-target="#previewcards"><i class="fa fa-search-plus"></i>Preview</a> </div></div>'+
                '<div class="card-image"><img src="/products/cards/'+cardItem.name+'.jpg" /><div class="card-name-overlay fadeInDown animated"> <a href="" data-toggle="modal" data-target="#previewcards"><i class="fa fa-search-plus"></i>Preview</a> </div></div>'+
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