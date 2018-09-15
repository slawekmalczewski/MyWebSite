Rails.application.routes.draw do

  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get 'users/delete'
  root "public#index"
  # get 'administrators', :to=>"administrators#index"
  resources :photos

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
