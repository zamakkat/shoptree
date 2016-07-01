window.Shoptree.products =
  init_index: ->
    $('.toggle-icon').click ->
      $(this).toggleClass('fa-chevron-right').toggleClass('fa-chevron-down')
