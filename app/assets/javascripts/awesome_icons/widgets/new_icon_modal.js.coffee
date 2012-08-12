class @NewIconModalWidget extends Joosy.Widget
  @view 'new_icon_modal'
  
  constructor: (icons) ->
    @data = icons: icons
  
  elements:
    'newIconForm':  '#new-icon-form'
    'newIconModal': '#new-icon-modal'
    
  @afterLoad ->
    @attachNewIconForm()
  
  attachNewIconForm: ->
    form = Joosy.Form.attach @newIconForm,
      resource: Icon.build()
      success: (icon) =>
        @newIconModal.modal 'hide'
        @newIconForm[0].reset()
        FormErrorHandling.reset @newIconForm
        if @data.icons
          @data.icons.add Icon.build(icon)
        else
          @navigate '/'
      error: (errors) =>
        FormErrorHandling.handle errors, form
  
