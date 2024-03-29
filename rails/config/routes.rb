Rails.application.routes.draw do
  get 'pages/home', to: "pages#home", as: :get_started
  resources :job_applications do
    resources :interviews, except: %i[index]
  end
  resources :users, except: %i[index]
  resources :sessions, only: %i[new create] do
    delete :destroy, on: :collection
  end

  resources :configurations, only: [] do
    get :ios, on: :collection
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "job_applications#index"
end
