Rails.application.routes.draw do
  resources :torihiki_rirekis
  resources :kigyo_masters
  resources :diaries
  
  # 企業マスタアップロード画面
  get 'csv_upload/index', to: "csv_upload#index"
  get 'csv_upload/index_torihiki', to: "csv_upload#index_torihiki"

  # 損益管理画面
  get 'son_eki', to: 'son_eki#index'

  # ユーザ画面
  get 'users', to: 'users#index'
  get 'users/new', to: 'users#new'

  # CSVアップロード（更新処理）
  post "/csv_upload"=> "csv_upload#csv_import" 

  # ホーム画面
  get 'home/index', to: 'home#index'
end
