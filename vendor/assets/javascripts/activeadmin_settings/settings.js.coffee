# Settings
$ ->
  show_update_btn = (el) ->
    $(el).closest('tr').find('.update_link').show()

  hide_update_btn = (el) ->
    $(el).closest('tr').find('.update_link').hide()

  $('#settings .form form input, textarea').change ->
    show_update_btn(this)

  $('#settings .form form input, textarea').keypress ->
    show_update_btn(this)

  $('#settings .form form').submit ->
    false

  $('#settings .update_link').click (e) ->
    e.preventDefault()
    btn = $(this)
    tr  = $(btn.attr("data-id"))

    form = tr.find(".form form")
    form.ajaxSubmit
      success: (value) =>
        if form.parent().hasClass("file")
          form.find(".inline-hints").html(value)
          form.clearForm()
        btn.hide()

