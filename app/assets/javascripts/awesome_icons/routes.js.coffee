Joosy.Router.map
  404             : (path) -> alert "Page '#{path}' was not found :("
  '/'             : Icon.IndexPage
  '/icons'        :
    '/:id'        : Icon.ShowPage