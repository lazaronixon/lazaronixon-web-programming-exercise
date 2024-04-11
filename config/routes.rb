Rails.application.routes.draw do
  root to: "accounts#index"

  resources :accounts, only: :index do
    resources :contacts, only: :index
  end
end
