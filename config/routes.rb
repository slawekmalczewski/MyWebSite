Rails.application.routes.draw do

  #routes for devise and changed default paths for sign_in to login, sign_out to logout etc
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: { registrations: "registrations" }

  root to: 'public#index'

  resources :posts do
    resources :comments
  end

  get 'about', to:'static_pages#about'

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
