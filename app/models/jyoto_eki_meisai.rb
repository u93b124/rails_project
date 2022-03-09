class JyotoEkiMeisai < ApplicationRecord

  # 譲渡益明細ＤＢから銘柄毎の損益を算出する
  def self.get_soneki(nen)
    p "aaaaaaaaaa nen = " , nen
    # 日付の組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"
p "from_date = " , from_date
p "to_date = " , to_date

    # SQL
    query = "SELECT code, MAX(name) as name, SUM(son_eki_gaku) as son_eki_gaku " 
    query += "FROM jyoto_eki_meisais "
    query += "WHERE ukewatasi BETWEEN ? and ?"
    query += "GROUP BY code "
    query += "ORDER BY son_eki_gaku desc "

    # 該当の証券コード毎に「株式現物買」の金額を取得する
    ret = self.find_by_sql([query, from_date, to_date])
  end

end
