Rails.application.routes.draw do
  get 'profile/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/homes/home'
  resources :posts do
    resources :comments
  end
  root 'homes#home'
  get ':user_id', to: "profile#show", as: :profile
end
