Rails.application.routes.draw do
  devise_for :users
  root to: "mainpages#index"
  
  resources :picpages, only: [:index, :new, :create, :show, :edit, :update, :destroy] 
  resources :mainpages, only: [:index]
  resources :blogs, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
  resources :bios, only: [:index, :new, :create, :edit, :update, :show]
  resources :products, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  get  'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
end
