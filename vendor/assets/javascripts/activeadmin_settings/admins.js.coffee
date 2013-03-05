# Admins
$ ->
  $('.new_admin #admin_user_password_confirmation').keypress (e) ->
    if e.which == 13
      e.preventDefault()
      $("#admins .create_link").click()

  $('tr.admin #admin_user_password_confirmation').keypress (e) ->
    if e.which == 13
      e.preventDefault()
      $(this).closest("tr.admin").find(".update_link").click()

  # Credentials
  hide_credentials_form = (tr) ->
    tr.find(".form").hide()
    tr.find(".admin_actions").show()
    tr.find(".form_actions").hide()

  show_credentials_form = (tr) ->
    tr.find(".form").show()
    tr.find(".admin_actions").hide()
    tr.find(".form_actions").show()

  $('document').on 'click', "#admins .admin .credentials_link", (e) ->
    e.preventDefault()
    btn = $(this)
    tr  = $(btn.attr("data-id"))
    show_credentials_form(tr)

  $('document').on 'click', "#admins .admin .cancel_link", (e) ->
    e.preventDefault()
    btn = $(this)
    tr  = $(btn.attr("data-id"))
    hide_credentials_form(tr)

  $('document').on 'click', "#admins .admin .update_link", (e) ->
    e.preventDefault()
    btn = $(this)
    tr  = $(btn.attr("data-id"))

    form = tr.find(".form form")
    form.ajaxSubmit
      error: (res) =>
        # parse errors
      success: (res) =>
        hide_credentials_form(tr)
        form.clearForm()

  # New admin
  show_new_admin_form = ->
    $("#admins .form.new_admin").show()
    $("#admins .new_admin_actions .form_actions").show()
    $("#admins .new_admin_actions .new_link").hide()
    $("#admins .form.new_admin form").clearForm()
    $("#admin_user_email").focus()

  hide_new_admin_form = ->
    $("#admins .form.new_admin").hide()
    $("#admins .new_admin_actions .form_actions").hide()
    $("#admins .new_admin_actions .new_link").show()

  $("#admins .new_link").click (e) ->
    e.preventDefault()
    show_new_admin_form()

  $(".new_admin_actions .cancel_link").click (e) ->
    e.preventDefault()
    hide_new_admin_form()

  $("#admins .create_link").click (e) ->
    e.preventDefault()
    form  = $("#admins .form.new_admin form")
    form.ajaxSubmit
      error: (res) =>
        # parse errors
      success: (html) =>
        $("#admins tr.admin:last").after(html)
        show_new_admin_form()

