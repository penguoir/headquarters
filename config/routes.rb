Rails.application.routes.draw do
  devise_for :users

  resources :projects, shallow: true do
    collection do
      get 'pinned'
    end

    resources :resources
  end

  authenticated do
    # Redirect / => /dashboard when signed in
    root to: redirect('/projects'), as: 'homepage_authenticated'
  end

  root 'pages#home'
end
