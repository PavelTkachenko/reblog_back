Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :rest do
      namespace :v1 do
        resources :movies
        resources :reviews
        resources :authors
      end
    end
  end
end
