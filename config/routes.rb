Rails.application.routes.draw do
  get 'static_pages/payment'

  get 'static_pages/guide'

  get 'static_pages/shipping'



  get 'static_pages/about'

  get 'static_pages/service'

  devise_for :users

  root "products#index"

  namespace :admin do
    resources :products do
      member do
        post :onsale
        post :notsale
      end
      resources :photos, :only => [:destroy]
    end

    resources :banners do
      member do
        post :hide
        post :publish
        post :do_slide
        post :undo_slide
      end
    end

    resources :categories do
      member do
        get :get_subcategories, defaults: { format: "js" }
      end
    end

    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end  # namespace admin end

  resources :banners

  resources :products do
    member do
      post :add_to_cart
    end

    collection do
      get :search
      get :new_arrived
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end


  #resources :brands
  resources :categories
  resources :subscribes
  resources :subscribers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
