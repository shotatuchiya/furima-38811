Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  resources :furimas do
    resources :purchase_shipping_addresses, only: [ :index, :create]
  end
end
