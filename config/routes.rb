Iversity::Application.routes.draw do

  root to: 'dashboard#index'
  resources :dashboard  do
    collection do
      get :sync
      get :start_soon_charts
      get :start_soon
      get :finish_soon_charts
      get :finish_soon
      get :active_charts

    end
  end
end
