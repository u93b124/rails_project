class SonEkiController < ApplicationController

  def index
    #@son_ekis = TorihikiRireki.all

    query = "SELECT code, MAX(meigara) AS meigara, torihiki, SUM(kingaku) AS kingaku " 
    query += "FROM torihiki_rirekis "
    query += "GROUP BY code, torihiki "
    query += "ORDER BY code, torihiki, kingaku DESC "

    @son_ekis = TorihikiRireki.find_by_sql( [query, "3374", " 特定 "] )
    p "@son_ekis = "  , @son_ekis
  end


end
