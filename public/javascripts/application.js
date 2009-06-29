// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// jquery version
//
//$(document).ready( function () {
//  $("#newQuestion").click( function() {
//    var new_id = new Date().getTime();
//    $(this).before( question.replace(/NEW_RECORD/g, new_id) );
//  });
//});

// prototype version
//
var newQuestion = function() {
  var new_id = new Date().getTime();
  $('questions').insert({ 'bottom': question.gsub(/NEW_RECORD/, new_id) });
}
