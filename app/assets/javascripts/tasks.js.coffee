# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

	$(".form_datetime").datetimepicker({
		format: 'dd MM yyyy - HH:ii P',
		showMeridian: true
		})