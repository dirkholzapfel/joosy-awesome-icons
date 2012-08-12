class AwesomeIconsController < ApplicationController
  helper 'joosy/sprockets'

  def index
    render nothing: true, layout: 'awesome_icons'
  end
end
