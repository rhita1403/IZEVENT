Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "dashboard", to: "pages#dashboard", as: 'dashboard'
  resources :events, except: :destroy do
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
    resources :participations, only: [:new, :create, :edit, :update]
    resources :reviews, only: [:new, :create, :edit, :update]
    resources :tasks, only: [:new, :create, :edit, :update] do
      member do
        get :confirm
      end
    end
  end
  resources :events, only: :destroy, as: "destroy_event"
  resources :tasks, only: :destroy, as: "destroy_task"
  resources :participations, only: :destroy, as: "destroy_participation"
  resources :participations, only: [] do
    member do
      patch :confirm
      patch :decline
    end
  end
  resources :events, only: [] do
    member do
     get :add_task
     get :add_multiple_tasks
     get :add_participation
     get :add_multiple_participations
     get :add_multiple_new_participations
     get :add_new_participation
    end
  end
  get "/form_task", to: "events#form_task"
end
