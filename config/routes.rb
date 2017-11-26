Rails.application.routes.draw do
  root to: "pages#live"

  resources :reports
  devise_for :users

  mount ActionCable.server => '/cable'

  get '/start', to: 'reports#start'

  post 'report', to: 'reports#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
