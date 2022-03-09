class JyotoEkiSyukeiController < ApplicationController


  def index
    @jyoto_eki_syukeis = JyotoEkiMeisai.get_soneki
    p "aaaaaaaaaaa jyoto_eki_syukeis = " , @jyoto_eki_syukeis
  end

 
end
