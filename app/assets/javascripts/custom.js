$(document).ready(function(){
	
	$('.discussion-page-overhead p').click(function(){
		$(this).css("background-color","#00D0A1");
		$(this).css("color","#ffffff");
	})
	
	$('.discussion-page-overhead p').mouseenter(function(){
		$(this).css("background-color","#EDFCF8");
	})
	
	$('.discussion-page-overhead p').mouseleave(function(){
		$(this).css("background-color","#ffffff");
		$(this).css("color","#0f1419");
	})
	
})