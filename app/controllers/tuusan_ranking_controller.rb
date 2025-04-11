class TuusanRankingController < ApplicationController


  def index
    @tuusan_ranking_syukeis_gaku = JyotoEkiSyukei.get_tuusan_ranking("gaku")

    son_eki = []
    (2020..Date.current.year).each do |nen|
      son_eki << JyotoEkiSyukei.get_tuusan_ranking("ritu", nen.to_s)
    end

    # 騰落率の降り順にソートする
    son_eki_sort = son_eki.flatten.sort_by {|x| -x["tou_raku_ritu"] }

    @tuusan_ranking_syukeis_ritu = son_eki_sort
  end
end
