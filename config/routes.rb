Rails.application.routes.draw do
  resources :site_comments

  resources :site_pages

  resources :site_images

  resources :site_sections

  resources :sites

  resources :payment_coupons

  resources :payment_tokens

  resources :page_templates

  resources :templates do 
    resources :sections
  end
  resources :cates

  resources :keystores

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
