Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/auth', controllers: { omniauth_callbacks: 'overrides/omniauth_callbacks'}

  namespace :api, defaults: {format: :json} do
    scope module: :v1 do
      resources :users, only: [:show]
      get '/leaderboard', to: 'users#leaderboard'
    end
  end
end
