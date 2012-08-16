class @Icon extends Joosy.Resource.REST
  @entity 'icon'
  @source '/icons'

  @map 'comments', Comment
  
  # this is an instance method
  cssClass: ->
    "icon-#{@data.name}"