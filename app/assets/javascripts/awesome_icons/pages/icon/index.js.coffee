Joosy.namespace 'Icon', ->

  class @IndexPage extends ApplicationPage
    @view 'index'
    
    elements:
      'removeButton' : '.btn.remove'
      'editButton'   : '.btn.edit'
      'editIconForm' : '#edit-icon-form'
      'editIconModal': '#edit-icon-modal'
      
    events:
      'click $removeButton': 'delete'
      'click $editButton'  : 'openEditModal'
    
    @fetch (complete) ->
      Icon.find 'all', (icons) =>
        @data.icons = icons
        complete()
    
    delete: (element) ->
      icon = @getIcon element
      icon.delete =>
        @data.icons.remove icon
        
    openEditModal: (element) ->
      icon = @getIcon element
      form = Joosy.Form.attach @editIconForm,
        resource: icon
        success: (updated_icon) =>
          icon.load updated_icon
          @editIconModal.modal 'hide'
        error: (errors) =>
          FormErrorHandling.handle errors, form
      @editIconModal.modal()
      
    getIcon: (element) ->
      iconId = $(element).closest('tr').data 'id'
      @data.icons.findById iconId