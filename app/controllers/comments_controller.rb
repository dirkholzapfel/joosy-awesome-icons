class CommentsController < ApplicationController

  before_filter :authenticate_user!
  
  inherit_resources
  belongs_to :icon
  respond_to :json
  
  def create
    build_resource.user = current_user
    create!
  end
  
end
