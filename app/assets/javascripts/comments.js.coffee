# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	# html5 editor
	
	$(".wysihtml5").each (i, elem) ->
  	$(elem).wysihtml5()


  # Create a comment
  $(".comment-form")
    .on "ajax:beforeSend", (evt, xhr, settings) ->
      $(this).find('textarea')
			
        .attr('disabled', 'disabled');
    .on "ajax:success", (evt, data, status, xhr) ->
      $(this).find('textarea')
        .removeAttr('disabled', 'disabled')
        .val('Hello');
      $(xhr.responseText).insertAfter($(this)).show('slow')
				
	# Delete a comment
	 $(document)
     .on "ajax:beforeSend", ".comment", ->
       $(this).fadeTo('fast', 0.5)
     .on "ajax:success", ".comment", ->
       $(this).hide('fast')
     .on "ajax:error", ".comment", ->
       $(this).fadeTo('fast', 1)


			