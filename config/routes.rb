Rails.application.routes.draw do
  resources :users, only: [:show] do 
    collection do 
      get "attendance"
    end 
    resources :leafs, except: [:index, :show]
    resources :attendances, only: [:new, :create]
  end 
  resources :departments
  resources :projects, only: [:index, :new, :create, :show, :edit, :update, :destroy] do 
    resources :columns, only: [:new, :create, :destroy, :edit, :update] do 
      patch "update_color"
      resources :cards, only: [:new, :create, :edit, :update, :destroy]
    end 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "departments#index"
end
