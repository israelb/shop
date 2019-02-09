Rails.application.routes.draw do
  root to: "invoice#index"

  resources :invoice
end
