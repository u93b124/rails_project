class TuusanRankingController < ApplicationController


  def index
    # 通算ランキング（利益額）
    @tuusan_ranking_syukeis_rieki_gaku = JyotoEkiSyukei.get_tuusan_ranking("gaku", nil, "DESC")

    # 通算ランキング（損失額）
    @tuusan_ranking_syukeis_sonsitu_gaku = JyotoEkiSyukei.get_tuusan_ranking("gaku", nil, "ASC")

    # 通算ランキング（上昇率）
    @tuusan_ranking_syukeis_rieki_ritu = JyotoEkiSyukei.get_tuusan_ranking_ritu("DESC")

    # 通算ランキング（下落率）
    @tuusan_ranking_syukeis_sonsitu_ritu = JyotoEkiSyukei.get_tuusan_ranking_ritu("ASC")


    # 通算ランキング（利益率）
    # son_eki = []
    # (2020..Date.current.year).each do |nen|
    #   son_eki << JyotoEkiSyukei.get_tuusan_ranking("ritu", nen.to_s, "DESC")
    # end

    # 騰落率の降り順にソートする
    # son_eki_sort = son_eki.flatten.sort_by {|x| -x["tou_raku_ritu"] }
    # @tuusan_ranking_syukeis_ritu = son_eki_sort
  end
end
