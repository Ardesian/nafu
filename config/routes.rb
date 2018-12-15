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
  resource :queue, controller: :queue, only: [:show]
  get :pause, controller: :pause
  resources :shifts, only: [:new, :create, :index, :show] do
    get :current, on: :collection
    post :complete, on: :collection
  end
  resources :candidates, only: [ :new, :create ]

  resources :assignments, only: [:show, :create, :edit, :update]

  resource :admin, controller: :admin, only: [:show]
  namespace :admin do
    resources :candidates,    except: [:new, :create, :destroy]
    resources :users,         except: [:new, :create, :destroy] do
      resources :candidates, only: [:show]
    end
    resources :shifts,        except: [:new, :create, :destroy]
    resources :assignments,   except: [:new, :create, :destroy]
    resources :products,      except: [:destroy]
    resources :product_styles, except: [:destroy]
    resources :projects do
      resources :goals, except: [:index, :show]
    end
  end

  get :flash_message, controller: :application

  mount ActionCable.server => '/cable'
end
