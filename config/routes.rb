Flix::Application.routes.draw do

  resources :movies do
    resources :reviews
  end

  root "movies#index"
end
