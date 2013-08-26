$(document).ready(function(){
	
	$('p').mouseenter(function(){
		$(this).css("background-color","#00D0A1");
		$(this).css("color","#ffffff");
	})
	
	$('p ').mouseleave(function(){
		$(this).css("background-color","#ffffff");
		$(this).css("color","#0f1419");
	})
	
})