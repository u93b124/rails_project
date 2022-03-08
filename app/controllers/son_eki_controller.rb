class SonEkiController < ApplicationController

  def index
    # 損益一覧を取得する
    @son_ekis = TorihikiRireki.get_soneki
  end

  # 証券コードから企業名を取得する
  def get_kigyo_name(code)
    kigyo_name = TorihikiRireki.get_kigyo_name(code)
    #p "contoroller = kigyo name = " , kigyo_name.class
    #kigyo_name = "豊田自動車"
  end

  helper_method :get_kigyo_name
end
