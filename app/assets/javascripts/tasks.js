//-----------------------------------------------------------------------------
// app/assets/javascripts/tasks.js
//-----------------------------------------------------------------------------

/****
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
  // Attempt to pop open an alert window
  $("ul.list-group").verifyJQuery();
  
  $( ".datepicker" ).datepicker();
});