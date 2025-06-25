$(document).ready(function(){
	var altura = $('.menu-simple').offset().top;
	
	$(window).on('scroll', function(){
		if ( $(window).scrollTop() > altura ){
			$('.menu-simple').addClass('menu-fixed');
			
		} else {
			$('.menu-simple').removeClass('menu-fixed');
			
		}
	});

});