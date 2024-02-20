Rails.application.routes.draw do
  get 'pages/home', to: 'pages#home', as: :get_started
  get 'pages/info', to: 'pages#info', as: :info

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

  root 'pages#info'
end
