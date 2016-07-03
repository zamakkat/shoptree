window.Shoptree.admin_categories =
  init: ->
    $('.parent-select').select2(
      theme: 'bootstrap',
      allowClear: true,
      placeholder: 'Select blank for top level category'
    )
