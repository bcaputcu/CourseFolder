# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $("#individual_due_dates").remove()
# $("#user_due_date").remove()

@toggle_same_due_dates= (flag) ->
	@same_due_dates_enabled = flag
	if flag
		$("#user_due_date").show()
		$("#individual_due_dates").hide()
	else
		$("#individual_due_dates").show()
		$("#user_due_date").hide()

jQuery ->

	$(".form_datetime").datetimepicker({
		format: 'dd MM yyyy - HH:ii P',
		showMeridian: true
		})

	$("#same_due_date_toggle").on 'click', (event) ->
		toggle_same_due_dates($(this).is(":checked"))

	$("#submit_task").on 'click', (event) ->
		if same_due_dates_enabled
			$("#individual_due_dates").remove()
		else
			$('#user_due_date').remove()