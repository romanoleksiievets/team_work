Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, path_names: { sign_up: 'register' , sign_in: 'login' }, controllers: { registrations: 'registrations' }

    resources :novelties,:path => "/news", only: [:index, :show]
    resources :pages, param: :url,only: [:index, :show]
    resources :projects do
      resources :comments, only: [:new, :create, :destroy]
      resources :attachments, only: [:create, :destroy] do
        member do
          get 'download'
          post 'add'
          delete 'del'
        end
       #match "attachments/:id" => "attachment#download", as: :download, via: [:get, :post]
      end
    end

    namespace :system_admin do
      resources :organizations
      get '/' => 'organizations#index'
    end

    namespace :organization_admin, path: "admin" do
      resources :novelties,:path => "/news", only: [:new, :create, :update, :destroy, :show, :index]
      resources :novelty_categories, only: [:new, :create, :update, :destroy]
      resources :users, except: [:new, :create, :show] do
        post :send_invite, on: :collection
      end
      resources :pages do
        collection  do
          post :edit_multiple
          put :update_multiple
        end
      end

      get '/' => 'pages#index'
    end

    devise_scope :user do
      unauthenticated do
        root 'pages#show', url: "home", as: :root
      end

      authenticated :user do
        root 'pages#show', url: "home", as: :auth_root
      end
    end
  end

  #root 'pages#show', title: "home"
  #root to: 'admin/pages#index', constraints: RoleConstraint.new('admin'), as: :admin_root
  # root to: 'welcome#index', constraints: RoleConstraint.new('employee'), as: :employee_root

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root to: "projects#index"

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


