Rails.application.routes.draw do

  namespace :chatwork do
    resource :webhook, only: :create
  end
end
