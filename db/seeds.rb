unless User.exists? email: 'joosy@bitcrowd.net'
  User.create! email: 'joosy@bitcrowd.net', password: 'joosy'
end