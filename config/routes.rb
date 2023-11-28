Rails.application.routes.draw do
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/edit'
  get 'tasks/update'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :events do
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
    resources :participations, only: [:new, :create, :edit, :update]
    resources :reviews, only: [:new, :create]
    resources :tasks, only: [:new, :create, :edit, :update]
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
