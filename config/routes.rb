Rails.application.routes.draw do

  namespace :chatwork do
    resource :webhook, only: :create
  end

  get "/alive", to: "alive#show"
end
