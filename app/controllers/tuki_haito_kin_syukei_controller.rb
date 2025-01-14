class TukiHaitoKinSyukeiController < ApplicationController

  def index
    # 画面表示用
    @nen = params[:nen]
    @son_eki = TukiBetuSyukei.get_tukibetu_soneki(@nen)
  end
end
