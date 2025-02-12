Rails.application.routes.draw do
  get "rooms/show"
  resources :messages
  resources :users
  resources :entries
  resources :blogs
  resources :todos
  get "profiles/show"
  get "profiles/edit"
  get "profiles/update"
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destroy"

  resources :publishers
  # resources :profiles
  # リソースの制限
  resources :profiles, only: %i[show edit update]
  # resources :publishers do
  #   resources :books
  #   member do
  #     get 'detail'
  #   end
  #   collection do
  #     get 'search'
  #   end
  # end

  # Defines the root path route ("/")
  root "articles#index"
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  # リダイレクト処理
  # respond_to do | format |
  #   format.html {{ redirect_to profile_path }}
  # end
  # フォーマットによるだし分けが不要ならrespond_toを書かなくて良い
  # redirect_to profile_path
  # redirect_to profile_path, status: 302
  # redirect_to profile_path, status: :found
  resources :articles
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  if Rails.env.development?
    require "sidekiq/web"
    mount Sidekiq::Web, at: "/sidekiq"
    # mount Sidekiq::Web => "/sidekiq"
  end

end
