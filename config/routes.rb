Rails.application.routes.draw do
  root :to => 'product_sizes#index'
  mount ShopifyApp::Engine, at: '/'
  resources :product_sizes
  resources :product_size_charts do
    collection do
      get   :get_sizes_list_for_edit
      get   :get_sizes_list
      get   :find_by_sku
      get   :find_by_name
    end
  end
  resources :app_configrations, :except => [:edit, :update, :destroy, :show, :new, :create]
  resources :home, :except => [:edit, :update, :destroy, :show, :new, :create]
end
