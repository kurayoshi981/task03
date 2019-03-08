Rails.application.routes.draw do
  get 'bar/change'
  devise_for :users
  # root 'top#index'
  root to: 'bar#index'

  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
end
