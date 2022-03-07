Rails.application.routes.draw do
  resources :torihiki_rirekis
  
  # 企業マスタアップロード画面
  get 'csv_upload/index', to: "csv_upload#index"
  get 'csv_upload/index_torihiki', to: "csv_upload#index_torihiki"

  resources :kigyo_masters
  resources :diaries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'users', to: 'users#index'
  get 'users/new', to: 'users#new'

  # CSVアップロード（更新処理）
  post "/csv_upload"=> "csv_upload#csv_import" 


  # ホーム画面
  get 'home/index', to: 'home#index'
end
