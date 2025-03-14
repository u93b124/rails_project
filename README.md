# [概要]

  このプログラムは、SBI証券における
  (※)　「譲渡益明細ＣＳＶファイル」
  を Linux VM上にあるMySQL DBで集計し、WEB画面にて銘柄ごとの損益一覧をランキング形式で表示するものである。
　　(VirtualBox等 Linux VM上からの個人的な使用を想定し、画面デザインは簡素化している）  

　　(※取得方法) SBIログイン ＞ 口座管理 ＞ 取引履歴 ＞ 譲渡益明細 ＞ ＣＳＶダウンロード

# [バージョン]
  - Ruby 3.1.1
  - Rails 7.0
  - MySQL Server 8.0

  (前提)
   上記、構成にて Linux 上にインストール済みであること

# [画面仕様]
  - アクセスURL ( http://192.168.56.2:3000/home/index )
  - トップメニュー画面
  - 譲渡益明細アップロード画面
    - CSVアップロード画面（20XX各年のCSVに対応）
    - アップロード時に前処理として [20XX 該当年] レコードが全て削除される


  - 譲渡益明細集計画面
    - 銘柄ごとの損益一覧（損益が大きい順に表示）

# [プログラム仕様]
　　*rails_project 配下の各ディレクトリ構成* 
   - 【app/controllers】
     - csv_upload_controller.rb　　　　⇒　CSVアップロード画面コントローラ
     - home_controller.rb　　　　　　　⇒　TOPメニュー画面コントローラ
     - joto_eki_syukei_controller.rb　⇒　譲渡益修正画面コントローラ

   - 【app/models】
     - jyoto_eki_meisai.rb

     - jyoto_eki_syukei.rb
      　集計用ＳＱＬの実行モデル

   - 【app/views】
     - csv_upload/index_jyo_to_eki.html.erb　⇒　CSVアップロード画面ビュー
     - home/index.html.erb　　　　　　　　　　⇒　TOPメニュー画面ビュー
     - jyoto_eki_syukei/index.html.erb　　　　⇒　譲渡益集計画面ビュー

   - 【lib】
     - csv_import.rb　⇒　CSVアップロード処理(DB更新ロジック)


# ■ データベース 初期設定 手順
   1. config/database.yml の [username]、[password] をMySQLのユーザに合わせ修正する
   2. cd [Rails.root] ディレクトリへ移動する

   3. rake db:crate
   ⇒ developmentデータベースの作成
   ３
   4. rake db:migrate
   ⇒ テーブルの作成



# ■ ＣＳＶ集計の画面操作 手順

  1. （・・/rails_projec） ディレクトリで、下記 Linuxコマンドで railsサーバ を起動する
  `rails s -b 0.0.0.0`

  2. ブラウザにてローカルWEBサーバへアクセスする
  `http://192.168.56.2:3000/home/index`

      2.1. 譲渡益明細アップロード リンクを選択し、csvファイル（上記2.3で保存したもの）をアップロードする
      - プルダウンメニューより、対象年を選択する
      - CSVファイルを選択し、アップロードボタンを押下

      2.2. ホームリンク を選択 ⇒ 譲渡益集計リンクを選択し、集計画面を参照する  
　　　(画面上部リンクから 2020年～20XX年 を切り替え可)


  <BR>
  ＜サンプル画面＞<BR>
  <a href="sample_image.png" target="_blank">
  <img src="sample_image.png" alt="サンプル画面" width="50%" height="50%" /></a>
  <BR>

以上
