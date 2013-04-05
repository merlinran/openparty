// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//= require jquery.ui.dialog
$(function() {
    $('#enrol_form').dialog({autoOpen: false});
    $('#enrol_btn').click(function() {
      $('#enrol_form').dialog('open');
    });

    $('#new_topic_form').dialog({autoOpen: false});
    $('#new_topic_btn').click(function() {
      $('#new_topic_form').dialog('open');
    });
  });
