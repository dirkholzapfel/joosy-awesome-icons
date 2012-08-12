Joosy.namespace 'Icon', ->

  class @ShowPage extends ApplicationPage
    @view 'show'

    elements:
      'newCommentForm': '#new-comment-form'
    
    @fetch (complete) ->    
      Icon.find @params.id, (icon) =>
        @data.icon = icon
        complete()

    @afterLoad ->
      @attachNewCommentForm()

    attachNewCommentForm: ->
      form = Joosy.Form.attach @newCommentForm,
        resource: Comment.build()
        action: "/icons/#{@params.id}/comments"
        success: (comment) =>
          @data.icon('comments').add Comment.build(comment)
          @newCommentForm[0].reset()
          FormErrorHandling.reset @newCommentForm
        error: (errors) =>
          FormErrorHandling.handle errors, form