// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var ind_pub = ENV['INDEED_NUMBER'];
var ind_el = 'indJobContent';
var ind_pf = '';
var ind_q = 'Web Developer';
var ind_l = 'south florida';
var ind_chnl = 'web';
var ind_n = 6;
var ind_d = 'http://www.indeed.com';
var ind_t = 50;
var ind_c = 30;
var ind_pgn = 1;
var ind_pgnCnt = 3;

function clearDefaults() {
  var formInputs = document.getElementById('indeed_jobform').elements;
  for(var i = 0; i < formInputs.length; i++) {
    if(formInputs[i].value == 'title, keywords' || formInputs[i].value == 'city, state, or zip') {
      formInputs[i].value = '';
    }
  }
}
