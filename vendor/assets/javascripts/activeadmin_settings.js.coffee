#= require jquery.form

$ ->
  show_update_btn = (el) ->
    $(el).closest('tr').find('.update_setting_link').show()

  hide_update_btn = (el) ->
    $(el).closest('tr').find('.update_setting_link').hide()

  $('#settings .form form input, textarea').change ->
    show_update_btn(this)

  $('#settings .form form input, textarea').keypress ->
    show_update_btn(this)

  $('#settings .form form').submit ->
    false

  $('.update_setting_link').click (e) ->
    e.preventDefault()
    btn = $(this)
    id = btn.attr "data-setting-id"
    setting = $("#setting_#{id}")

    form = setting.find(".form form")
    form.submit =>
      form.ajaxSubmit
        success: (value) =>
          btn.hide()
      false
    form.submit()
