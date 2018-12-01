Rails.application.routes.draw do
  root "index#index"

  devise_for :users, path: :account, path_names: { sign_in: "login", sign_out: "logout" }, controllers: {
    confirmations: "devise/user/confirmations",
    # omniauth_callbacks: "devise/user/omniauth_callbacks",
    passwords: "devise/user/passwords",
    registrations: "devise/user/registrations",
    sessions: "devise/user/sessions",
    unlocks: "devise/user/unlocks"
  }
end
