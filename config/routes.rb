Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, except: [:update], controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, except: [:new, :create] do
    member do
      get 'show_account'
      get 'show_profile'
      get 'edit_account'
      get 'edit_profile'
    end
  end

  resources :rooms
  resources :reservations
end
