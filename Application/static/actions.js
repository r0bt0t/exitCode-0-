$('.alert').alert()

$(function () {
    $('.all-popover').popover({
      container: 'body'
    })
  })

  //Enable tool tips everywhere
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })
   
 $(document).ready(function() {
  $('.dp').datepicker({
    format: 'yyyy-mm-dd',
    startDate: '2023-12-01',
    endDate: '2025-12-30'
  });
});
