class JyotoEkiSyukeiController < ApplicationController


  def index
    @jyoto_eki_syukeis = JyotoEkiMeisai.get_soneki(params[:nen])
    @nen = params[:nen]
  end

 
end
