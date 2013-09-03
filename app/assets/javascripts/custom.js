$(document).ready(function(){
	
	//Discussion Page Items
	//Make the background teal & text white on click
	$('.discussion-page-overhead p, .dicussion-page-overhead li').click(function(){
		$(this).css("background-color","#00D0A1");
		$(this).css("color","#ffffff");
		//$(this).width($(this).width()+400)
	})
	
	//On mousehover, background becomes light-teal
	$('.discussion-page-overhead p, .dicussion-page-overhead li').mouseenter(function(){
		$(this).css("background-color","#EDFCF8");
	})
	
	//On release of mmousehover, revert text back to normal
	$('.discussion-page-overhead p, .dicussion-page-overhead li').mouseleave(function(){
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
	
	
	$('.article-box').hover(function(){
		$(this).css("background-color","#EDFCF8");
	})
	
	$('.article-box').mouseleave(function(){
		$(this).css("background-color","#00D0A1");
	})
	
	//On page load, have the browser automatically focus on the search-box so users can start searching asap
	$(function(){
	    $(".search-box input").focus();
	});

	$(".show-discussion p").click(function(){
		//console.log(this.attr('id'));
		show_form(this)
	})


})

function show_form(paragraph){
	$(paragraph).css("background-color","red");
	$("#test_box").fadeIn('fast')
	$("#test_box").toggleClass("hidden")
	$("#paragraph-input").val($(paragraph).attr("id"))
}


