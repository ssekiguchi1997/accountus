Rails.application.routes.draw do

  get 'users/show'
  get 'users/edit'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get "search" => "searches#search"
  
  root to: "homes#top"
  
  get '/about' => "homes#about" , as: :about
  resources :tips, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
