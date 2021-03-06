Rails.application.routes.draw do

  resources :attempts
  resources :honchos
  resources :companies
  resources :jobs
  resources :users
  get 'user', to: 'users#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#izzybam'
  get 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'autofill', to: 'jobs#autofill'

  get 'job_search', to: 'users#search'
  get 'mail_please', to: 'users#mail_please'
  get 'test', to: "sessions#test_create"
  get 'contact', to: "users#contact"
  post 'contact_mail', to: "users#contact_mail"

  # auth0 routes
  get "/auth/auth0/callback", to: "auth0#callback"
  get "/auth/failure", to: "auth0#failure"

  match '*path' => redirect { |p, req| req.flash[:error] = "I don't think you'll find anything useful in #{req.env["HTTP_HOST"]}#{req.env["REQUEST_PATH"]}"; '/' }, via: :get

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
