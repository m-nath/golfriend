Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'show', to: "pages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users do
  #   resources :reservations, only:[:new, :create, :edit, :update] do
  #     resources :events, only:[:index, :show]
  #   end
  #   resources :events
  # end
  resources :events do
    resources :reservations, only:[:create]
    resources :messages, only:[:create]
  end
  resources :reservations, only:[:destroy, :update]

  get "my_events", to: "users#my_events"

end
