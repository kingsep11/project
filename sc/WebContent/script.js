
var myApp = angular.module('myApp',[]);

myApp.controller('HomeController', ['$scope', function($scope) {
  $scope.cardsList = {
      "sda":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "isNew":true,
          "imgUrl":"images/item.JPG"
      },
      "dasd":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "imgUrl":"images/item.JPG"
      },
      "ada":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "imgUrl":"images/item.JPG"
      },
      "adas":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "imgUrl":"images/item.JPG"
      },
      "asadd":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "imgUrl":"images/item.JPG"
      },
      "asasqe":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "imgUrl":"images/item.JPG"
      },
      "kjk":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "imgUrl":"images/item.JPG"
      },
      "iuqi":{
          "name":"Vintage baby Buggy",
          "price":"$109.98",
          "imgUrl":"images/item.JPG"
      }
  };
  $scope.menuList = [
  {"menu":"Special Cards"},   
  {"menu":"Hindu Cards"},   
  {"menu":"Muslim Cards"},   
  {"menu":"Christian Cards"},   
  {"menu":"Personal Cards"},   
  {"menu":"Calendar"},   
  {"menu":"Diary"},   
  {"menu":"Gifts"}     
  ];
   
  $scope.customerFeedbackOne={
      "rating":3,
      "heading":"'Beautiful Wedding Cards'",
      "content":"I ordered custom wedding cards anf the result was beadutiful! Thank you!",
      "customerName":"Teri Gulda",
      "customerDate":"Jun 03 2016"
  };
  $scope.customerFeedbackTwo={
      "rating":2,
      "heading":"'Great service and quality! Thanks'",
      "content":"It was great experience working with Rajesh! Prompt service, great quality and service from Rajesh and everyone there was nothing but the best! Thanks",
      "customerName":"usha katariya",
      "customerDate":"Jun 03 2016"
  }
  $scope.cartItems=2;
  
}]);