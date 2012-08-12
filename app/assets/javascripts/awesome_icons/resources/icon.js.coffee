class @Icon extends Joosy.Resource.REST
  @entity 'icon'
  @source '/icons'

  @map 'comments', Comment
  
  cssClass: ->
    "icon-#{@data.name}"