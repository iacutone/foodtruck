Foodtruck::Application.routes.draw do
  resources :trucks
 
  resources :users

  root 'users#new'
end
