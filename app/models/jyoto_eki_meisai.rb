class JyotoEkiMeisai < ApplicationRecord

  # 譲渡益明細ＤＢから銘柄毎の損益を算出する
  def self.get_soneki(nen)
    # 日付の組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"

    # SQL
    query = "SELECT code, MAX(name) as name, SUM(son_eki_gaku) as son_eki_gaku, " 
    query += "MIN(yakujo_bi) AS kaituke_bi, MAX(yakujo_bi) AS baikyaku_bi "
    query += "FROM jyoto_eki_meisais "
    query += "WHERE ukewatasi BETWEEN ? and ?"
    query += "GROUP BY code "
    query += "ORDER BY son_eki_gaku desc "

    # 該当の証券コード毎に「株式現物買」の金額を取得する
    ret = self.find_by_sql([query, from_date, to_date])
  end

 # 譲渡益明細ＤＢから利益額合計、損失額合計、全体の損益を算出する
  def self.get_total_soneki(nen)
    # 日付の組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"
   
    # SQL
    query = "SELECT SUM(son_eki_gaku) AS son_eki_gaku "
    query += "FROM jyoto_eki_meisais " 
    query += "WHERE son_eki_gaku >= 0 "
    query += "AND ukewatasi BETWEEN ? AND ? "     
    query += "UNION "
    query += "SELECT SUM(son_eki_gaku) AS son_eki_gaku "
    query += "FROM jyoto_eki_meisais "
    query += "WHERE son_eki_gaku < 0 "
    query += "AND ukewatasi BETWEEN ? AND ? " 
    query += "UNION "
    query += "SELECT SUM(son_eki_gaku) AS son_eki_gaku "
    query += "FROM jyoto_eki_meisais "
    query += "WHERE ukewatasi BETWEEN ? AND ? " 
    
    ret = self.find_by_sql([query, from_date, to_date, from_date, to_date, from_date, to_date])

  end


end
