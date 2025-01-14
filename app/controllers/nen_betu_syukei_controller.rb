class NenBetuSyukeiController < ApplicationController


  def index
    # 画面表示用
    son_eki = []
    (2020..2025).each do |nen|
      son_eki[nen] = NenBetuSyukei.get_soneki(nen.to_s)
    end

    @total_year_son_eki = son_eki
  end 
end
