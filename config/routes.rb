Rails.application.routes.draw do
  root to: "invoices#index"

  resources :invoices, except: [:update, :edit]
end
