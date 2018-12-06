Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/user/sessions#new"
  end

  devise_for :users, path: :account, path_names: { sign_in: "login", sign_out: "logout" }, skip: [:registrations, :confirmations], controllers: {
    # confirmations: "devise/user/confirmations",
    # omniauth_callbacks: "devise/user/omniauth_callbacks",
    passwords: "devise/user/passwords",
    # registrations: "devise/user/registrations",
    sessions: "devise/user/sessions",
    unlocks: "devise/user/unlocks"
  }

  resource :account, controller: :account, only: [ :show, :edit, :update ]
  resources :shifts, only: [:new, :create, :index, :show]
  resources :candidates, only: [ :new, :create ]

  get :flash_message, controller: :application
end
