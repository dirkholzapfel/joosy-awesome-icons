#= require './user'

class @Comment extends Joosy.Resource.REST
  @entity 'comment'

  @map 'user', User
