define(['jquery','jquery_dropdown','simpleCart'], function ($) {
	return function(){
		
		$("#paymentbtn").click(function(){
			
			$("#order_id").val(sessionStorage.getItem('orderId'));
			$("#calamt").val(sessionStorage.getItem('totalprice'));
			$("#delivery_name").val($("#custname").val());
			$("#billing_email").val($("#custmail").val());
			$("#delivery_tel").val($("#custmob").val());
			$("#delivery_address").val($("#deladdress").val());
			$("#delivery_city").val($("#city").val());
			$("#delivery_state").val($("#state").val());
			$("#delivery_zip").val($("#country").val());
			$("#merchant_param1").val("Total Quantity : "+sessionStorage.getItem('quantity'));
			$("#merchant_param2").val("Product Details : "+sessionStorage.getItem('productid'));
			$("#frmcart").submit();
			
		});
	}
});
