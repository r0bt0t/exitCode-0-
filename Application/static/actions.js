$('.alert').alert()

//Enable popovers everywhere
$(function () {
    $('.all-popover').popover({
      container: 'body'
    })
  })

  //Enable tool tips everywhere
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })
 