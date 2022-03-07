class CsvUploadController < ApplicationController
  include CsvImport

  # 企業マスタアップロード画面
  def index

  end

  # 取引履歴アップロード画面
  def index_torihiki

  end

  #CSV UpladしDBへ登録する
  def csv_import
    # 取引履歴ＣＳＶの場合
    if params[:gamen_kind] == "tori"
      #p "aaaaa params[:gamen_kind] ="  ,params[:gamen_kind]
      @errors = import(params[:file],"tori")
      redirect_to action: 'index_torihiki' 
    # 企業マスタCSVの場合
    else
      #p "bbbb params[:gamen_kind] ="  ,params[:gamen_kind]
      @errors = import(params[:file],"kigyo")
      redirect_to action: 'index' 
    end





  end

end
