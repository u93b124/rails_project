class NenBetuSyukeiController < ApplicationController
  def index
    son_eki = []

    (2020..Date.current.year).each do |nen|
      son_eki[nen] = NenBetuSyukei.get_nenbetu_soneki(nen.to_s)
    end

    @total_year_son_eki = son_eki
  end 
end
