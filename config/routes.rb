Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    post 'users/confirm' => 'users/registrations#confirm'
    post 'users/complete' => 'users/registrations#complete'
  end

  root 'items#index'
  get "users" => "users#index"
  get "users/show/:id" => "users#show"
  get "users/in_progress" => "users#in_progress"
  get "users/completed" => "users#completed"
  get "users/purchase" => "users#purchase"
  get "users/purchased" => "users#purchased"
  get "users/listing" => "users#listing"
  resources :users, only: [:index, :edit, :update]
  get "items/show/:id" => "items#show"
  get "items/update/:id" => "items#update"
  get "items/area/:prefecture" => "items#area"
  resources :items, only: [:new, :create, :edit, :update, :destroy]
  post "item/create" => "item/create"
  resources :category, only: [:index, :show]
  get "category/large_category/:large_category_id" => "category#large_category"
  get "category/medium_category/:large_category_id/:medium_category_id" => "category#medium_category"
  get "category/small_category/:large_category_id/:medium_category_id/:small_category_id" => "category#small_category"
end
