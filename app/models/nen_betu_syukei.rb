class NenBetuSyukei 

  # 譲渡益明細ＤＢから銘柄毎の年別の損益を算出する
  def self.get_nenbetu_soneki(nen)
    # 日付の組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"

    table_name = "jyoto_eki_meisais "

    # SQL
    query = "SELECT "
    query += "DATE_FORMAT(`ukewatasi`, '%Y') as year_column, "
    query += "SUM(son_eki_gaku) as son_eki_gaku "
    query += "FROM " + table_name
    query += "WHERE ukewatasi BETWEEN ? and ?"
    query += "AND torihiki <> '株式配当金' "
    query += "AND torihiki <> '信用配当金' "
    query += "AND torihiki <> '資本剰余金配当/みなし譲渡' "
    query += "GROUP BY year_column "
    query += "ORDER BY year_column "

    # 該当の証券コード毎に「株式現物買」の金額を取得する
    ret = JyotoEkiMeisai.find_by_sql([query, from_date, to_date])
  end
end
