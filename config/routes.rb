Rails.application.routes.draw do
  root 'restaurants#index'
  resources 'restaurants', only: %w[index new show create] do
    resources :reviews, only: %w[create]
  end
end
