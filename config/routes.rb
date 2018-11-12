Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    post 'users/confirm' => 'users/registrations#confirm'
    post 'users/complete' => 'users/registrations#complete', as: 'user_detail'
    post 'users/logout'  => 'users/sessions#logout'
  end

  root 'items#index'
  get "users/in_progress" => "users#in_progress"
  get "users/completed" => "users#completed"
  get "users/purchase" => "users#purchase"
  get "users/purchased" => "users#purchased"
  get "users/listing" => "users#listing"
  get "users/logout" => "users#logout"
  resources :users, only: [:index, :edit, :update, :show] do
    resources :ueser_detail, only: [:edit, :update]
  end
  get "items/area/:prefecture" => "items#area"
  resources :items, only: [:new, :create, :edit, :update, :destroy, :show] do
    post :payjp, on: :member
    get :buy, on: :member
    get :stop, on: :member
    get :resume, on: :member
  end
  post "items/create" => "items/create"
  resources :category, only: [:index,:show]

  resources :large_category, only: [:show] do
    resources :medium_category, only: [:show] do
      resources :small_category, only: [:show]
    end
  end

  # get "large_category/:large_category_id" => "category#large_category"
  # get "category/medium_category/:large_category_id/:medium_category_id" => "category#medium_category"
  # get "category/small_category/:large_category_id/:medium_category_id/:small_category_id" => "category#small_category"

  resources :transaction_details, only: [:show, :update]
end
