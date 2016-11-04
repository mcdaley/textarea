//-----------------------------------------------------------------------------
// app/assets/javascripts/tasks.js
//-----------------------------------------------------------------------------

/**
 * Clear the task form after adding a new task
 */
jQuery.fn.clearTaskForm = function() {
  console.log("[clearTaskForm]: Called method to clear the task form");

  this.find( '#task_description'  ).val('').focus();
 	this.find( '#task_due_text'     ).val('');
 	this.find( '.form-group'        ).removeClass('has-error');

  return this;
}

//-----------------------------------------------------------------------------
// main()
//-----------------------------------------------------------------------------
$(function() {
  // Turn on the datepicker
  $( ".datepicker" ).datepicker();
});