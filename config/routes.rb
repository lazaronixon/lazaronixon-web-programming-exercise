Rails.application.routes.draw do
  root to: "accounts#index"

  resources :accounts, only: :index do
    resources :contacts, only: :index

    namespace :contacts do
      resources :imports, only: %i[ show new edit create destroy ]
    end
  end
end
