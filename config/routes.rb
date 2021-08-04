Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/auth' do
    post 'sign_up', to: 'users#create'
    post 'log_in', to: 'users#log_in'
  end
  scope '/lists' do
    post 'create_list', to: 'lists#create'
  end
end
