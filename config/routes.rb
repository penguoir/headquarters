Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root to: redirect('/users/sign_up'), as: 'redirect_to_signup'
  end

  resources :projects, shallow: true do
    resources :resources
  end

  authenticated do
    # Redirect / => /dashboard when signed in
    root to: redirect('/projects'), as: 'homepage_authenticated'
  end

  root 'pages#home'
end
