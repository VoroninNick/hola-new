Rails.application.routes.draw do

 get "/users/sign_up", to: "error#not_found"
 post "/users", to: "error#not_found"

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  # get 'pages/show'


  DynamicRouter.load


  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/, defaults: {source_route: true} do

             #get "/appartments/search/(*query)", to: 'appartments#search'

    #get 'test/gmap'

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    #get 'appartments', to: 'appartments#list', as: 'appartments'
    #
    # get 'appartments/:item', to: 'appartments#item', as: 'appartments_item'
    #
    #get 'about-us', to: 'about#index', as: 'about'
    #
    get 'articles', to: 'articles#articles_list', as: 'articles'
    #
    get 'articles/:item', to: 'articles#article_item', as: 'articles_item'
    #
    get 'news', to: 'articles#news_list', as: 'news'
    #
    get 'news/:item', to: 'articles#news_item', as: 'news_item'
    #
    #get 'contact', to: 'contact#show', as: 'contact'
    #
    # get 'contact/create'
    #
    # get 'test', to: 'test#index'

    root to: 'home#index', defaults: {page_id: Pages::HomePage.first.page.id}
  end




  get "*path", to: 'error#not_found', defaults: { error_code: 404 }

  #get "/404", :to => "errors#not_found"
  #get "/422", :to => "errors#unacceptable"
  #get "/500", :to => "errors#internal_error"


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

