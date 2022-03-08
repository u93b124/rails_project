class SonEkiController < ApplicationController

  def index
    # 損益一覧を取得する
    @son_ekis = TorihikiRireki.get_soneki
  end


end
