Rails.application.routes.draw do
  devise_for :users

  resources :galleries do
    resources :photos, only: [:new, :create]
  end

  root "galleries#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
