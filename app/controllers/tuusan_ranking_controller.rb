class TuusanRankingController < ApplicationController


  def index
    @tuusan_ranking_syukeis_gaku = JyotoEkiSyukei.get_tuusan_ranking("gaku")
    # @tuusan_ranking_syukeis_ritu = JyotoEkiSyukei.get_tuusan_ranking("ritu")

    son_eki = []
    (2020..Date.current.year).each do |nen|
      # p "nen = " , nen
      # son_eki[nen] = JyotoEkiSyukei.get_tuusan_ranking("ritu", nen.to_s)
      son_eki <<  JyotoEkiSyukei.get_tuusan_ranking("ritu", nen.to_s)
      p "son_eki = " , son_eki
    end

    @tuusan_ranking_syukeis_ritu = son_eki

    p "@tuusan_ranking_syukeis_ritu = " , @tuusan_ranking_syukeis_ritu

    # ret = son_eki.sort {|x, y| x["tou_raku_ritu"] <=> y["tou_raku_ritu"] }
    # p "aaaaaaaaaaaaaaa ret = " , ret
  end

  # CSVダウンロード
  def send_csv(tuusan_ranking_syukeis)
    bom = %w(EF BB BF).map { |e| e.hex.chr }.join
    csv_data = CSV.generate(bom) do |csv|
      # header = %w(code name kabu_su)
      header = %w(コード 会社名	株数	買付株価	売却単価	騰落率	損益額	買付日	売却日)
      csv << header

      tuusan_ranking_syukeis.each do |item|
        kai_tanka = item.konyu_gaku / item.kabu_su
        uri_tanka = (item.konyu_gaku + item.son_eki_gaku) / item.kabu_su
        tou_raku_ritu = ( (uri_tanka.to_f / kai_tanka.to_f) -1 ) * 100

        values = [
          item.code,
          item.name,
          item.kabu_su,
          kai_tanka,
          uri_tanka,
          tou_raku_ritu,
          item.son_eki_gaku,
          item.kaituke_bi,
          item.baikyaku_bi
        ]
        csv << values
      end

    end
    send_data(csv_data, filename: "tuusan_ranking_syukeis_" + @nen + ".csv")
  end


end
