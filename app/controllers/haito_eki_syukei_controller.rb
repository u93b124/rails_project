class HaitoEkiSyukeiController < ApplicationController
  # 配当金集計コントローラ 

  def index
    # 画面表示用
    @nen = params[:nen]

    # 銘柄毎の配当集計処理の呼び出し
    @haito_eki_syukeis = HaitoEkiSyukei.get_soneki(@nen)
  end
end
