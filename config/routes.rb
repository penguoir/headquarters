Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show

  get 'users/edit/parent', to: 'users#edit_parent'
  patch 'users/edit/parent', to: 'users#update_parent'

  resources :projects, shallow: true do
    collection do
      get 'pinned'
    end

    member do
      # /project/1/pin --> pins#pin
      post 'pin', to: 'pins#pin'
      delete 'pin', to: 'pins#unpin'

      get 'students', to: 'projects#students'

      resources :chats
      resources :tasks do
        post :complete, on: :member
        post :incomplete, on: :member
      end
    end

    resources :resources, except: :index
  end

  authenticated do
    # Redirect / => /dashboard when signed in
    root to: redirect('/projects'), as: 'homepage_authenticated'
  end

  root 'pages#home'
end
