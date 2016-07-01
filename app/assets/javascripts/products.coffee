window.Shoptree.products =
  init_index: ->
    $('.toggle-icon').click ->
      $(this).toggleClass('fa-chevron-right').toggleClass('fa-chevron-down')
    this.init_filter_links()

  init_filter_links: ->
    $('a[data-remote=true]').click ->
      $('.products-index').html('<p class="spinner"><i class="fa fa-spinner fa-pulse fa-fw"></i></p>')
