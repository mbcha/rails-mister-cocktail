Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    collection do
      get 'search', to: 'cocktails#search', as: :search
      get 'result/:name', to: 'cocktails#result', as: :result
    end
  end
  resources :doses, only: [:destroy]
end
