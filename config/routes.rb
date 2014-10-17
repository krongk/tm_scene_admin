Rails.application.routes.draw do
  resources :pictures

  resources :galleries

  resources :resources

  resources :admin_resources do 
    collection {get :dialog_list}
  end

  resources :site_comments

  resources :site_pages

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
