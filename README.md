joosy-awesome-icons
===================

This is a simple app (Rails 3.2.8, Ruby 1.9.3) showing some key features of [Joosy](http://joosy.ws), a JS-application framework:

- Authentication
- Dynamic rendering
- Partials
- Mapped (has_many) resources
- Widget

Clone the repo and start the app:
```ruby
git clone git://github.com/dirkholzapfel/joosy-awesome-icons.git
cd joosy-awesome-icons
bundle
bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed
rails s
```

![bitcrowd](http://bitcrowd.net/bitcrowd_what_we_do_860px.jpg)
Coded by [bitcrowd](http://bitcrowd.net).
