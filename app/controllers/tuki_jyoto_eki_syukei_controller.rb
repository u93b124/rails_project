class TukiJyotoEkiSyukeiController < ApplicationController


  def index
    # 画面表示用
    @nen = params[:nen]
    @son_eki = TukiBetuSyukei.get_soneki(@nen)
  end 
end
