$(document).ready(function(){
	
	//Discussion Page Items
	//Make the background teal & text white on click
	$('.discussion-page-overhead p, .dicussion-page-overhead li').click(function(){
		//$(this).css("background-color","#00D0A1");
		//$(this).css("color","#ffffff");
		//$(this).width($(this).width()+400)
		$(this).css("background-color","#EDFCF8");
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
		$(this).css("background-color","#8BEAD4");
	})
	
	
	//On page load, have the browser automatically focus on the search-box so users can start searching asap

	$(".search-box input").focus();
	$(" #article_name").focus();

	//On clicking a paragraph, set the comment box ready
	$(".show-discussion p").click(function(){
		show_form(this);
		move_form("#test_box", this);
		//resize_form(this);
		set_paragraph_to_form(this);
		$("#comment-area").focus();
	})

	$(' textarea').autosize();

})

function show_form(paragraph){
	$("#test_box").removeClass("hidden")
	$("#paragraph-input").val($(paragraph).attr("id"))
}

function move_form(form, paragraph){
	var vertical_difference = get_vertical_difference(form, paragraph);
	var animate_box = vertical_difference

	$(form).css("position","relative");
	$(form).animate({
		top: "-="+vertical_difference+"px"
	  }, 0);
	
}

function get_vertical_difference(box, paragraph){
	var position_of_box = $(box).position().top;
	var position_of_paragraph = $(paragraph).position().top;
	var vertical_difference = position_of_box - position_of_paragraph;
	return vertical_difference;
}

function resize_form(paragraph){
	var paragraph_height = $(paragraph).height();
	$('.article-note-box textarea').css("height", paragraph_height+"px").trigger('autosize.resize');
}

function set_paragraph_to_form(paragraph){
	$('#paragraph-value').val($(paragraph).attr("id"));
}