Rails.application.routes.draw do
  root to: "invoice#index"

  resources :invoices, except: :update
end
