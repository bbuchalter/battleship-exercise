Rails.application.routes.draw do

  resource :battleship, :only => [:create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end