$(document).ready(function(){
	
	//Discussion Page Items
	//Make the background teal & text white on click
	$('.discussion-page-overhead p, .dicussion-page-overhead li').click(function(){
		$(this).css("background-color","#00D0A1");
		$(this).css("color","#ffffff");
		//$(this).width($(this).width()+400)
	})
	
	//On mousehover, background becomes light-teal
	$('.discussion-page-overhead p, .discussion-heading, .dicussion-page-overhead li').mouseenter(function(){
		$(this).css("background-color","#EDFCF8");
	})
	
	//On release of mmousehover, revert text back to normal
	$('.discussion-page-overhead p, .discussion-heading, .dicussion-page-overhead li').mouseleave(function(){
		$(this).css("background-color","#ffffff");
		$(this).css("color","#0f1419");
	})
	
	
	//Groups List Box Slide
	$('.box-info').mouseenter(function(){
			$(this).fadeTo('slow', 0.1);
	})
	
	$('.box-info').mouseleave(function(){
			$(this).fadeTo('slow', 1);
	})
	
})

