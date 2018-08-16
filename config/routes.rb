Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do    
      devise_scope :user do
        match '/sessions' => 'sessions#create', via: :post
        match '/sessions' => 'sessions#destroy', via: :delete
      end
    end
  end
end
