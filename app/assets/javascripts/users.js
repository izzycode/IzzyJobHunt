// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Opens 3 pages for job searching
function open_win(event) {
  event.preventDefault();
  var what = $('#what').val().trim().replace(/\s/g,"+");
  var where = $('#where').val().trim().replace(/\s/g,"+");
  var whatLink = $('#what').val().trim().replace(" ","-");
  var whereLink = $('#where').val().trim().replace(" ","-");

  window.open("https://www.indeed.com/jobs?q="+what+"&l="+where);
  window.open("https://ziprecruiter.com/candidate/search?search="+what+"&location="+where);
  window.open("https://www.linkedin.com/jobs/"+whatLink+"-jobs-"+whereLink+"?trk=jserp_search_button_execute");
}



$(document).on('ready page:change',function(){
// Adds neon glow when jobs count reaches 10
  if (parseInt($('#ten').text()) > 9) {
    $('#ten').addClass('neon-glow')
  }
// Adds neon glow when contacts count reaches 10
  if ($('#thirty').text() > 9) {
    $('#thirty').addClass('neon-glow')
  }


// Displays tour1 when user signs in for the first time
  if (gon.tour1 === 1){
    var $t1 = $('.tour1')
    $t1.filter('.t1').attr("data-intro","Add jobs you applied for.");
    $t1.filter('.t2').attr({"data-intro":"Edit your name, Log Out and always find your way back.","data-position":"left"});
    $t1.filter('.t3').attr({"data-intro":"Quickly search for jobs in Linkedin, Indeed and Ziprecruiter with one click!","data-position":"right"});

    // chardin full page tour
    $('body').chardinJs('start');
  }

// Displays tour4 after first job has been added
  if (gon.tour4 === 4){
    $t4 = $('.tour4')
    $t4.filter('.t41').attr({"data-intro":"You can expand on the Applied job to add details.", "data-position":"bottom"});
    $t4.filter('.t42').attr({"data-intro":"Edit the job's info.", "data-position":"bottom"});
    $t4.filter('.t43').attr({"data-intro":"Click on the company name to add/edit details.", "data-position":"top"});

    $('body').chardinJs('start');
  };


})
