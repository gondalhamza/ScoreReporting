Rails.application.routes.draw do

  # SWAGGER
  root to: redirect('/swagger/dist/index.html')
  resources :apidocs, only: [:index]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :players, only: [:create]

    end
  end
end
