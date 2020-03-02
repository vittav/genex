Rails.application.routes.draw do
  devise_for :users

  resources :experiences do
    resources :meetings, except: [:destroy, :update]
  end

  resources :meetings, only: [:destroy, :update]


  get '/my_meetings', to: 'meetings#my_meetings', as: :my_meetings
  get '/my_experiences', to: 'experiences#my_experiences', as: :my_experiences

  get '/home', to: 'pages#home', as: :home
  root to: 'experiences#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
