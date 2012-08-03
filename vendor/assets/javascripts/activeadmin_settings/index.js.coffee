#= require jquery.form
#= require jquery.easytabs
#= require redactor
#= require_tree ./

$ ->
  $('.settings-redactor').redactor
    buttons: [ 'html', '|', 'image', 'video', 'file', 'table', 'link', '|', 'fullscreen' ]
    #buttons: ['html', '|', 'formatting', '|', 'bold', 'italic', 'deleted', '|', 'unorderedlist', 'orderedlist', 'outdent', 'indent', '|',
    #'image', 'video', 'file', 'table', 'link', '|',
    #      'fontcolor', 'backcolor', '|', 'alignleft', 'aligncenter', 'alignright', 'justify', '|',
    #      'horizontalrule', 'fullscreen'],