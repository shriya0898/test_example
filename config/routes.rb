Rails.application.routes.draw do
  # mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers:  { registrations: 'users/registrations' }
  root "posts#index"
  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
