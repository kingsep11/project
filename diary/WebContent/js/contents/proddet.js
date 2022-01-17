define(['jquery','jquery_dropdown','imagezoom','jquery_flexslider','simpleCart','memenu'], function ($) {
	return function(){
		console.log("invoking prode det");
		console.log(sessionStorage.getItem('productid'));
		var unitprice = 0;
		
		getProdDetails();
		
		function getProdDetails(){
			
			var prodTitle='';
			var prodDesc ='';
			var prodPrice ='';
			var prodCode = '';
			$.ajax({
				type:'GET',
				contentType:'application/json',
				url:'./webserviceInvokeservlet?wsname=getDiaryDetail&diaryId='+sessionStorage.getItem('productid'),
				success:function(data){
					debugger;
					var prodDetLst = data;
					var img_t1='',img_t2='',img_1='',img_2='';
					 prodTitle=prodDetLst[0].diaryDto.diaryTitle;
					 prodDesc = prodDetLst[0].diaryDto.diaryDesc;
					 prodPrice = prodDetLst[0].diaryDto.diaryPrice;
					 prodCode = prodDetLst[0].diaryDto.diaryCode;
					 unitprice=prodPrice;
					
				},
				complete:function(){
					$("#prodTitle").html('<h2>'+prodTitle+'</h2>');
					$('.item_price').text('INR '+prodPrice);
					$('.proddesc').text(prodDesc);
					calculatePriceAndShipping();
					fnPaintSlideshow(prodCode);
					saveOrder(prodPrice,prodTitle);
				}
			});
		}
		
		function fnPaintSlideshow(prodCode){
			
			
			
			var htmlStr = '';
			htmlStr=htmlStr+'<ul class="slides">'+
							'<li data-thumb="images/'+prodCode+'/1.jpg">'+
							'<div class="thumb-image"> <img src="images/'+prodCode+'/1.jpg" data-imagezoom="true" class="img-responsive" alt=""/> </div>'+
								'</li>'+
								'<li data-thumb="images/'+prodCode+'/2.jpg">'+
									 '<div class="thumb-image"> <img src="images/'+prodCode+'/2.jpg" data-imagezoom="true" class="img-responsive" alt=""/> </div>'+
								'</li>'+
								'<li data-thumb="images/'+prodCode+'/1.jpg">'+
								 ' <div class="thumb-image"> <img src="images/'+prodCode+'/1.jpg" data-imagezoom="true" class="img-responsive" alt=""/> </div>'+
								'</li>'+
					  '</ul>';
			
			$('.flexslider').html(htmlStr);
			
			/** for flex sliding **/
			$('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
			  });
			
			$('.flex-direction-nav').remove();
			
			
		}
		
		
		function calculatePriceAndShipping(){
			var qty = $("#qty").val();
			var totPrice = qty*unitprice;
			
			$(".price1").html(totPrice);
			$(".shipping1").html("50");
			$(".total1").html(totPrice+50);
		}
		
		$("#qty").on('keyup',function(){
			console.log("--------");
			calculatePriceAndShipping();
		});
		
		function saveOrder(unitprice,prodName){
			$('.item_add').off();
		$('.item_add').on('click',function(){
			
			var currentTime = new Date();
			var qty = $("#qty").val();
			sessionStorage.setItem('quantity',qty);
			
			var totPrice = qty*unitprice;
			sessionStorage.setItem('totalprice',totPrice);
			
			//$("#order_id").val(currentTime); //setting current time in millisec for unique order id
			sessionStorage.setItem('orderId',currentTime);
			
			//$("#calamt").val(totPrice);
			
			$("#merchant_param1").val(prodName);
			$("#merchant_param2").val($("#deladdress").val());
			
			
			var order = {
					"orderId":0,//order id is auto increment handled at db end
					 "orderNumber":currentTime,
					 "productId":sessionStorage.getItem('productid'),
					 "orderStatus":'Pending',
					 "paymentStatus":'Pending',
					 "orderDate":null, // date set null because handled it in quer side
					 "expDelDate":null,
					 "custAddress":'Temp address'
			};
			
			
			
			
			$.ajax({
			    url: './webserviceInvokeservlet?wsname=saveorder',
			    dataType: 'json',
			    type: 'POST',
			    contentType: 'application/json;charset=UTF-8',
			    data: JSON.stringify(order),
			    success: function( data, textStatus, jQxhr ){
			        console.log("save order success....");
			        console.log(JSON.stringify(data));
			        
			    },
			    error: function( jqXhr, textStatus, errorThrown ){
			        console.log( errorThrown );
			    },
			    complete:function(){
			    	$("#maincontainer").load("deladdress.html");
			    }
			});
			
		});
		}
	}
});