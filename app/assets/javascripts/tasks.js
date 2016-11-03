//-----------------------------------------------------------------------------
// app/assets/javascripts/tasks.js
//-----------------------------------------------------------------------------

/**
 * Print some info to the console
 */
jQuery.fn.verifyJQuery = function() {
  console.log("jQuery is working");
  
  return this;
}

//-----------------------------------------------------------------------------
// main()
//-----------------------------------------------------------------------------
$(function() {
  // Turn on the datepicker
  $( ".datepicker" ).datepicker();
});