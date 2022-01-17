requirejs.config({
    baseUrl: 'js/',
    paths: {
        
        'jquery': 'jquery-1.11.0.min',
        'jquery_dropdown':'jquery.easydropdown',
        'jquery_flexslider':'jquery.flexslider',
        'responsiveslides.min':'responsiveslides.min',
        
        
        'imagezoom':'imagezoom',
        'memenu':'memenu',
        'simpleCart':'simpleCart.min',
        
        // contents 
        'home':'contents/home',
        'header':'contents/header',
        'diarylist':'contents/diarylist',
        'proddet':'contents/proddet',
        'delivery':'contents/delivery'
       
    },
    shim:{
 	   'jquery_dropdown':{dep:['jquery']},
 	   'jquery_flexslider':{dep:['jquery']}
 	   //'jquery_datatable_twitter_pagination':{dep:['jquery','jquery_dataTables']}
     }

});