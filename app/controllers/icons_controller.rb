class IconsController < ApplicationController

  inherit_resources
  respond_to :json
  
  def update
    update! do |success, failure|
      success.json { render json: resource }
    end
  end
  
end
