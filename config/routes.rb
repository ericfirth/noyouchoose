Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resource :sessions, only: [:show, :create, :destroy]
    resources :users, only: [:index, :show, :create]
    resources :restaurants do
        get "filter", on: :collection
    end
  end

  get "/auth/:provider/callback", to: "sessions#omniauth"

  root to: "pages#root"
end
