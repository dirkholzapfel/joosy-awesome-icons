window.FormErrorHandling = 
  
  handle: (errors, joosy_form) ->
    $form = joosy_form.container
    @reset $form

    for k, v of errors.errors 
      name = "name='#{joosy_form.__resource.__entityName}[#{k}]'"
      $err_input = $form.find "input[#{name}], select[#{name}], textarea[#{name}]"
      $control_group = $err_input.closest '.control-group'
      $control_group.addClass 'error'
      $control_group.append "<span class='help-inline'>#{v.first()}</span>"

  reset: ($form) ->
    $form.find('.control-group').removeClass 'error'
    $form.find('.control-group span.help-inline').remove()