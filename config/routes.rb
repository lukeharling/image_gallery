Rails.application.routes.draw do
  get "errors/not_found"
  get "errors/internal_server_error"
  devise_for :users

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :galleries do
    resources :photos, only: [:new, :create, :edit, :update, :destroy]
  end

  root "galleries#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
