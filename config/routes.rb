Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/api/auth', controllers: { omniauth_callbacks: 'overrides/omniauth_callbacks'}
  namespace :api, defaults: {format: :json} do
    scope module: :v1 do
      get '/user',  to: 'users#show'
      get '/leaderboard', to: 'users#leaderboard'
      resources :karma_requests, only: [:create, :update]
      resources :karma_management, only: [:index, :update]
    end
  end
end
