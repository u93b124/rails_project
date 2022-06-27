class JyotoEkiSyukeiController < ApplicationController


  def index
    # 画面表示用
    @nen = params[:nen]

    # 銘柄毎の損益集計処理の呼び出し
    @jyoto_eki_syukeis = JyotoEkiSyukei.get_soneki(params[:nen])
    
    # 利益額合計、損失額合計、全体の損益を算出
    @total_soneki = JyotoEkiSyukei.get_total_soneki(params[:nen])
  end

 
end
