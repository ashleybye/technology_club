Rails.application.routes.draw do

  namespace :admin do
    root 'sessions#new'

    match 'dashboard', to: 'dash_board#index', via: :get
    
    resource  :sessions,  only: [:new, :create, :destroy]
    resources :users,     except: [:show]
    resources :newsitems
  end

  resources :newsitems, only: [:index, :show]

  root 'pages#index'

  match '/home',              to: 'pages#index',                via: :get
  match '/about',             to: 'pages#about',                via: :get
  match '/location',          to: 'pages#location',             via: :get
  match '/club_rules',        to: 'pages#club_rules',           via: :get
  match '/privacy_policy',    to: 'pages#privacy',              via: :get
  match '/cookies_policy',    to: 'pages#cookie',               via: :get
  match '/accept_cookies_policy', to: 'pages#cookie_accept',    via: :get
  match '/disclaimer',        to: 'pages#disclaimer',           via: :get
  match '/contact_us',        to: 'contact_us#new',             via: :get
  match '/contact_us',        to: 'contact_us#create',          via: :post
  match '/register_interest', to: 'interested_parties#new',     via: :get
  match '/register_interest', to: 'interested_parties#create',  via: :post
  match '/volunteer',         to: 'volunteers#new',             via: :get
  match '/volunteer',         to: 'volunteers#create',          via: :post

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
