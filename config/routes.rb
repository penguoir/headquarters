Rails.application.routes.draw do
  resources :projects, shallow: true do
    resources :resources
  end

  devise_for :users

  authenticated do
    # Redirect / => /dashboard when signed in
    root to: redirect('/projects'), as: 'homepage_authenticated'
  end

  root 'pages#home'
end
