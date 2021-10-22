Rails.application.routes.draw do
  get '/v1', to: "events#index", as: "events"
  get '/v1/:id', to: "events#show", as: "event"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
