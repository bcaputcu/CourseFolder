# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggle_sections = (flag) ->
	@sections_enabled = flag
	if flag
		$('#sections_form').show()
		$("#only_time_slots_form").hide()
	else
		$('#sections_form').hide()
		$("#only_time_slots_form").show()

jQuery ->

	$('form').on 'click', '.add_fields', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()

	$('form').on 'click', '.remove_fields', (event) ->
		$(this).prev('.control-group').find('input[type=hidden]').val('1')
		$(this).closest('fieldset').hide()
		event.preventDefault()

	$("#enable_sections_switch").on "switch-change", (e, data) ->
		toggle_sections data.value

	$("#submit_course").on 'click', (event) ->
		if sections_enabled
			$("#only_time_slots_form").remove()
		else
			$('#sections_form').remove()
