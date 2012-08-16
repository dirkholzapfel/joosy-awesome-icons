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
    
    # Request all icons from the server (GET /icons)
    @fetch (complete) ->
      Icon.find 'all', (icons) =>
        @data.icons = icons
        complete()
    
    # Delete the icon, on success callback remove it from collection
    delete: (element) ->
      icon = @getIcon element
      icon.delete =>
        @data.icons.remove icon
        
    # Open the modal edit dialog, bind the icon
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
      
    # Helper to find the clicked icon in the collection
    getIcon: (element) ->
      iconId = $(element).closest('tr').data 'id'
      @data.icons.findById iconId