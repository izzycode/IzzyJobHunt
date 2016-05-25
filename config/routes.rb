Rails.application.routes.draw do


  resources :users
  resources :attempts
  resources :honchos
  resources :companies
  resources :jobs

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#izzybam'
  get 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'autofill', to: 'jobs#autofill'

  get 'job_search', to: 'users#search'
  get 'mail_please', to: 'users#mail_please'

  # #linkedin routes
  # get '/auth/:provider/callback', to: 'sessions#linkedin'
  #
  # delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  #
  # # get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'
  # get '/auth/failure' do
  #   flash[:notice] = params[:message] # if using sinatra-flash or rack-flash
  #   redirect '/'
  # end

  # auth0 routes
  get "/auth/auth0/callback", to: "auth0#callback"
  get "/auth/failure", to: "auth0#failure"



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
