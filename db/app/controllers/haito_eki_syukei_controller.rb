class HaitoEkiSyukeiController < ApplicationController
  # 配当益集計コントローラ 

  def index
    # 画面表示用
    @nen = params[:nen]

    # 銘柄毎の配当集計処理の呼び出し
    @haito_eki_syukeis = HaitoEkiSyukei.get_soneki(params[:nen])
    
  end

 
end
