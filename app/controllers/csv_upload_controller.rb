class CsvUploadController < ApplicationController
  include CsvImport

  # 企業マスタアップロード画面
  def index
  end

  # 取引履歴アップロード画面
  def index_torihiki
  end

  # 譲渡益明細アップロード画面
  def index_jyo_to_eki
  end


  #CSV UpladしDBへ登録する
  def csv_import
    # 取引履歴ＣＳＶの場合
    if params[:gamen_kind] == "tori"
      @errors = import(params[:file],"tori")
      redirect_to action: 'index_torihiki' 
    # 譲渡益明細CSVの場合
    elsif params[:gamen_kind] == "jyoto"
      @errors = import(params[:file],"jyoto")
      redirect_to action: 'index_jyo_to_eki' 
    # 企業マスタCSVの場合
    elsif params[:gamen_kind] == "kigyo"
      @errors = import(params[:file],"kigyo")
      redirect_to action: 'index' 
    else
      p "gamen_kind parameter eror"  
    end
  end

end
