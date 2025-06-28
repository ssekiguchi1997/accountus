Rails.application.routes.draw do

  scope module: :public do
    devise_for :users
    root to: "homes#top"
    get '/about' => "homes#about" , as: :about
    resources :tips, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    end
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
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


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

