class JyotoEkiSyukeiController < ApplicationController


  def index
    # 画面表示用
    @nen = params[:nen]

    # 銘柄毎の損益集計処理の呼び出し
    @jyoto_eki_syukeis = JyotoEkiSyukei.get_soneki(params[:nen])

    @sum_plus = 0
    @sum_minus = 0
    @count_plus = 0
    @count_minus = 0

    sum_tou_raku_ritu_plus = 0
    sum_tou_raku_ritu_minus = 0

    @jyoto_eki_syukeis.each do |jyoto_eki|
      
      kai_tanka = jyoto_eki.konyu_gaku / jyoto_eki.kabu_su
      uri_tanka = (jyoto_eki.konyu_gaku + jyoto_eki.son_eki_gaku) / jyoto_eki.kabu_su
      tou_raku_ritu = ( (uri_tanka.to_f / kai_tanka.to_f) -1 ) * 100
      
      if ( jyoto_eki.son_eki_gaku < 0 ) 
        @sum_minus = @sum_minus + jyoto_eki.son_eki_gaku   # 合計損失額
        @count_minus = @count_minus + 1                    # 負け数
        sum_tou_raku_ritu_minus = sum_tou_raku_ritu_minus + tou_raku_ritu # 平均損失計算用_合計
      else
        @sum_plus = @sum_plus + jyoto_eki.son_eki_gaku     # 合計利益額
        @count_plus = @count_plus + 1                      # 勝ち数
        sum_tou_raku_ritu_plus = sum_tou_raku_ritu_plus + tou_raku_ritu  # 平均利益計算用_合計 
      end

    end
    
    @avg_loss = sum_tou_raku_ritu_minus.to_f / @count_minus 
    @avg_profit = sum_tou_raku_ritu_plus.to_f / @count_plus
    @win_rate = (@count_plus.to_f / (@count_plus.to_f + @count_minus.to_f))*100
    
  end

 
end
