Rails.application.routes.draw do

  resources :loans, defaults: {format: :json} do
      resources :payments, only: [:index,:create,:show]
  end

end
