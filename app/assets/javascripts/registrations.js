// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

/*  $('#registration_name').focusout(function() {
    $('#registration_email_div').fadeIn("slow")
    $('#registration_email').focus
    })*/
$(function() {
    $('#new_registration input[type=text], #new_registration textarea').each(function() {
      $(this).focusin(function() {
        $(this).closest(".field").addClass("current")
        })
      $(this).focusout(function() {
        $(this).closest(".field").removeClass("current")
        })
      })

    })
