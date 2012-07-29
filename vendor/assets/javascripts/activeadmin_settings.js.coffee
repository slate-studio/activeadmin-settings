#= require jquery.form

$ ->
  $('#settings .form form').submit ->
    false

  $('.edit_setting_link').click (e) ->
    e.preventDefault()
    id = $(this).attr "data-setting-id"
    setting = $("#setting_#{id}")
    setting.find(".value").hide()
    setting.find(".form").show()
    setting.find(".update_setting_link").show()
    $(this).hide()

  $('.update_setting_link').click (e) ->
    e.preventDefault()
    btn = $(this)
    id = btn.attr "data-setting-id"
    setting = $("#setting_#{id}")
    setting.find(".form").hide()

    # submit form, should use jquery form for file submissions
    form = setting.find(".form form")
    form.submit =>
      form.ajaxSubmit
        success: (value) =>
          setting.find('.value').html(value)
          setting.find(".value").show()
          setting.find(".edit_setting_link").show()
          btn.hide()
      false
    form.submit()
