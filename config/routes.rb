Rails.application.routes.draw do
  devise_for :users
  resources :users, except: %i(index)

  resources :disks do
    patch 'upload_files', on: :member
    delete 'delete_files', on: :member
  end

  devise_scope :user do
    root to: "users#show"
  end

  unauthenticated do
    root to: 'home#show', as: 'unauthenticated'
  end

  authenticated :user do
    root to: 'sessions#new', as: 'authenticated'
  end
end
