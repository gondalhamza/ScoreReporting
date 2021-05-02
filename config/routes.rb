Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :players, only: [:create]

    end
  end
end
