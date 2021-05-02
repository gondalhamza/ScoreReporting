Rails.application.routes.draw do

  # SWAGGER
  root to: redirect('/swagger/dist/index.html')
  resources :apidocs, only: [:index]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :players, only: [:create] do
        collection do
          post 'score', to: 'players#score'
        end
      end

      resources :reportings do
        collection do
          get 'weekly', to: 'reportings#weekly'
          get 'impact', to: 'reportings#impact'
        end
      end

    end
  end
end
