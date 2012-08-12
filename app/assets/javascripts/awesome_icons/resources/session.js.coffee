#= require './user'

class @Session extends Joosy.Resource.REST
  @entity 'session'
  @source '/users/sign_in'
  
  currentUser = User.build()

  @setUser: (user) ->
    currentUser.load user

  @currentUser: ->
    currentUser
