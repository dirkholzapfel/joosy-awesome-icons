JoosyAwesomeIcons::Application.routes.draw do

  devise_for :users
  
  resources :icons do
    resources :comments, only: :create
  end
  
  root to: 'awesome_icons#index'

end
