class TuusanRankingController < ApplicationController


  def index
    # 通算ランキング（利益額）
    @tuusan_ranking_syukeis_rieki_gaku = JyotoEkiSyukei.get_tuusan_ranking_gaku("DESC")

    # 通算ランキング（損失額）
    @tuusan_ranking_syukeis_sonsitu_gaku = JyotoEkiSyukei.get_tuusan_ranking_gaku("ASC")

    # 通算ランキング（上昇率）
    @tuusan_ranking_syukeis_rieki_ritu = JyotoEkiSyukei.get_tuusan_ranking_ritu("DESC")

    # 通算ランキング（下落率）
    @tuusan_ranking_syukeis_sonsitu_ritu = JyotoEkiSyukei.get_tuusan_ranking_ritu("ASC")
  end
end
