Rails.application.routes.draw do

    scope module: :public do
      devise_for :users, controllers: {
        sessions: 'public/sessions'
      }
  
      root to: "homes#top"
      get '/about', to: "homes#about", as: :about
  
      resources :tips, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
        resources :post_comments, only: [:create, :destroy]
        resource :favorite, only: [:create, :destroy]
      end
  
      resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
    end
  

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions',
  }

  namespace :public do
    get 'search', to: 'searches#search'
  end

  namespace :admin do
    get 'dashboards' , to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
end

