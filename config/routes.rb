Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  # get 'pages/show'





  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/, defaults: {source_route: true} do

    get "/appartments/search/(*query)", to: 'appartments#search'

    get 'test/gmap'

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    get 'appartments', to: 'appartments#list', as: 'appartments'
    #
    # get 'appartments/:item', to: 'appartments#item', as: 'appartments_item'
    #
    get 'about', to: 'about#index', as: 'about'
    #
    get 'articles', to: 'articles#list', as: 'articles'
    #
    # get 'articles/:item', to: 'articles#item', as: 'articles_item'
    #
    get 'news', to: 'news#list', as: 'news'
    #
    # get 'news/:item', to: 'news#item', as: 'news_item'
    #
    get 'contact', to: 'contact#show', as: 'contact'
    #
    # get 'contact/create'
    #
    # get 'test', to: 'test#index'

    root to: 'home#index'
  end


  DynamicRouter.load

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
