Rails.application.routes.draw do
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/auth' do
    post 'sign_up', to: 'users#create'
    post 'log_in', to: 'users#log_in'
  end
  get 'movies', to: 'movies#index'
  get 'movies/search', to: 'movies#search'
end
