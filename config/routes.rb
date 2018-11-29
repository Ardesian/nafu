Rails.application.routes.draw do
  root "index#index"

  get :sup, controller: :index
end
