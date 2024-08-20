Rails.application.routes.draw do
  resources :jyoto_eki_meisais
  resources :torihiki_rirekis
  resources :meigara_memos

  # 各アップロード画面
  get 'csv_upload/index', to: "csv_upload#index"
  get 'csv_upload/index_torihiki', to: "csv_upload#index_torihiki"
  get 'csv_upload/index_jyo_to_eki', to: "csv_upload#index_jyo_to_eki"

  # 取引履歴集計 画面
  get 'son_eki', to: 'son_eki#index'
 
  # 譲渡益集計 画面
  get 'jyoto_eki_syukei', to: 'jyoto_eki_syukei#index'

  # （月別）譲渡益集計 画面
  get 'tuki_jyoto_eki_syukei', to: 'tuki_jyoto_eki_syukei#index'

  # 配当金集計 画面
  get 'haito_eki_syukei', to: 'haito_eki_syukei#index'

  # CSVアップロード（更新処理）
  post "/csv_upload"=> "csv_upload#csv_import" 

  # ホーム画面
  get 'home/index', to: 'home#index'
end
