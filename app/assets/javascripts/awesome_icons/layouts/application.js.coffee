class @ApplicationLayout extends Joosy.Layout
  @view 'application'

  elements:
    'signInForm':  '#sign-in-form'
    'signInModal': '#sign-in-modal'

  @afterLoad ->
    @attachSignInForm()

  attachSignInForm: ->
    Joosy.Form.attach @signInForm,
      resource: Session.build()
      success: (user) =>
        Session.setUser user
        @signInModal.modal 'hide'
      error: (errors) =>
        @signInForm.find('.control-group').addClass 'error'
        @signInForm.find('.control-group').first().empty().append "<span class='help-block'>#{errors.error}</span>"