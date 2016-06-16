// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:change',function(){

// Displays tour2 when first time new job will be added
  if (gon.tour2 === 2){
    $('.tour2').attr("data-intro","Just drag and drop/copy and paste the job posting's URL here.");

    $('body').chardinJs('start');
  };
});
