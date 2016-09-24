Rails.application.routes.draw do
  get 'admin_pages/dashboard'

  devise_for :admins, only: :sessions
  resources :admins
  resources :admin_pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
