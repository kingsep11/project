define(['jquery','jquery_dropdown','simpleCart'], function ($) {
	return function(){
		console.log("invoking diary list....");
		var prodSubCat = sessionStorage.getItem('category');
		var prodType=1;
		
		loadDiaryList();
		var prodList;
		
		
		function loadDiaryList(){
			
			if(prodSubCat==undefined || prodSubCat==null || prodSubCat==''){
				prodSubCat=2;
			}
			prodList=new Array();
			$.ajax({
				type:'GET',
				contentType:'application/json',
				url:'./webserviceInvokeservlet?wsname=getdiarylist&producttype='+prodType+'&subcat='+prodSubCat,
				success:function(data){
					prodList = data.diaryVO.diaryList;
				},
				complete:function(){
					fnPaintProducts(prodList);
				}
			});
				
		}
			
			function fnPaintProducts(prodList)
			{
				
				var topProdHtml = '<div class="col-md-9 prdt-left">';
				topProdHtml=topProdHtml+'<div class="product-one">';
				
				
				$.each(prodList,function(i,product)
				{
					topProdHtml=topProdHtml+'<div class="col-md-4 product-left p-left">'+
											'<div class="product-main simpleCart_shelfItem">'+
											'<a href="#" id="'+product.diaryId+'" class="mask"><img class="img-responsive zoom-img" src="images/'+product.fileName+'" alt="" /></a>'+
											'<div class="product-bottom">'+
												'<h3>'+product.diaryTitle+'</h3>'+
												'<p>Premium Diaries</p>'+
												'<h4><a class="item_add" href="#"><i></i></a> <span class=" item_price">INR '+product.diaryPrice+'</span></h4>'+
											'</div>'+
											'<div class="srch srch1">'+
												'<span>-50%</span>'+
											'</div>'+
										'</div>'+
									'</div>';
					
					
					if(prodList.length==(i+1)){
						topProdHtml=topProdHtml+'<div class="clearfix"></div></div>';
					}
					else if((i+1)%3 == 0){
						topProdHtml=topProdHtml+'<div class="clearfix"></div></div>'+
												'<div class="product-one">';
					}
					
				});
				
				topProdHtml=topProdHtml+'</div>';
				
				
				
				
				
				var fiterSectionHtml = '<div class="col-md-3 prdt-right">'+
							'<div class="w_sidebar">'+
							'<section  class="sky-form">'+
								'<h4>Catogories</h4>'+
								'<div class="row1 scroll-pane">'+
									'<div class="col col-4">'+
										'<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Popular Diaries</label>'+
									'</div>'+
									'<div class="col col-4">'+								
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Premium Diaries</label>'+
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Budget Diaries</label>'+
													
									'</div>'+
								'</div>'+
							'</section>'+
							/*'<section  class="sky-form">'+
								'<h4>Brand</h4>'+
								'<div class="row1 row2 scroll-pane">'+
									'<div class="col col-4">'+
										'<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>kurtas</label>'+
									'</div>'+
									'<div class="col col-4">'+
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Sports</label>'+
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Fossil</label>'+
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Maxima</label>'+
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Yepme</label>'+
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Citizen</label>'+
										'<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Diesel</label>'+									
									'</div>'+
								'</div>'+
							'</section>'+
*/							
						'</div>'+
					'</div>'+
					'<div class="clearfix"></div>';
				
				
				    topProdHtml=topProdHtml+fiterSectionHtml;
				    
				    $(".prdt-top").html(topProdHtml);
				    fnBindProdDetEvents();
	    }

			
		function fnBindProdDetEvents(){
			var prodLnkLst = $(".mask");
			var selectedProdId = '';
			$.each(prodLnkLst,function(i,prodLnk){
				$(prodLnk).on('click',function(){
					selectedProdId = $(this).attr('id');
					sessionStorage.setItem('productid', selectedProdId);
					$("#maincontainer").load("productdetails.html");
				});
			})
		}
		
	}
});