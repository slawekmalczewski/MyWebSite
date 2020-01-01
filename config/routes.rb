Rails.application.routes.draw do

  #routes for devise and changed default paths for sign_in to login, sign_out to logout etc
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: { registrations: "registrations" }

  root to: 'public#index'

  get 'about', to:'static_pages#about'

  resources :posts do
    resources :comments
  end

  resources :photos

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
