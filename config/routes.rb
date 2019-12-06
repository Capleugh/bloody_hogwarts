Rails.application.routes.draw do

  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'

  get '/courses', to: 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
