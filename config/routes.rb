Rails.application.routes.draw do
  root to: "entries#new"
  get 'pdf', to: "pages#pdf"
  resources :entries
end
