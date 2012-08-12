class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable

  attr_accessible :email, :password, :password_confirmation
  
end
