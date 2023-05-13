function myFunction(x) {
	x.classList.toggle("change");
  }

$(document).ready(function() {
  $('#datepicker').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
});
  