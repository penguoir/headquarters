Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show

  resources :projects, shallow: true do
    collection do
      get 'pinned'
    end

    member do
      # /project/1/pin --> pins#pin
      post 'pin', to: 'pins#pin'
      delete 'pin', to: 'pins#unpin'
    end

    resources :resources, except: :index
  end

  authenticated do
    # Redirect / => /dashboard when signed in
    root to: redirect('/projects'), as: 'homepage_authenticated'
  end

  root 'pages#home'
end
