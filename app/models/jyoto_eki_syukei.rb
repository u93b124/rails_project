class JyotoEkiSyukei 
  # 譲渡益明細ＤＢから銘柄毎の損益を算出する
  def self.get_soneki(nen)

    # 日付の組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"

    table_name = "jyoto_eki_meisais "

    # SQL
    query = "SELECT code, MAX(LEFT(name, 20)) as name, SUM(son_eki_gaku) as son_eki_gaku, " 
    query += "MIN(syutoku_bi) AS kaituke_bi, MAX(ukewatasi) AS baikyaku_bi, "
    query += "SUM(count) AS kabu_su, SUM(sinki_gaku) AS konyu_gaku "
    query += "FROM " + table_name
    query += "WHERE ukewatasi BETWEEN ? and ?"
    query += "AND torihiki <> '株式配当金' "
    query += "AND torihiki <> '信用配当金' "
    query += "AND torihiki <> '資本剰余金配当/みなし譲渡' "
    query += "GROUP BY code "
    query += "ORDER BY son_eki_gaku DESC "

    # 該当の証券コード毎に「株式現物買」の金額を取得する
    ret = JyotoEkiMeisai.find_by_sql([query, from_date, to_date])
  end

  # 譲渡益明細ＤＢから投資来の通算での銘柄毎の損益を算出する
  def self.get_tuusan_ranking(kind, nen=nil)
    # 日付の組み立て
    if kind == "ritu"
      from_date = nen + "-01-01"
      to_date = nen + "-12-31"
      order_kind = "tou_raku_ritu"
    else
      from_date = "2020-01-01"
      to_date = Date.current.year.to_s + "-12-31"
      order_kind = "son_eki_gaku"
    end

    table_name = "jyoto_eki_meisais "
    # SQL
    query = "SELECT code ,"
    query += "MAX(LEFT(name, 20)) as name, SUM(son_eki_gaku) as son_eki_gaku, "
    query += "MIN(syutoku_bi) AS kaituke_bi, "
    query += "MAX(ukewatasi) AS baikyaku_bi, "
    query += "SUM(count) AS kabu_su, SUM(sinki_gaku) AS konyu_gaku, "
    query += "(SUM(sinki_gaku) / SUM(count)) AS kai_tanka, "
    query += "((SUM(sinki_gaku) + SUM(son_eki_gaku)) / SUM(count)) AS uri_tanka, "
    query += "(((SUM(sinki_gaku) + SUM(son_eki_gaku)) / SUM(count)) / (SUM(sinki_gaku) / SUM(count)) -1)*100  AS tou_raku_ritu "
    query += "FROM " + table_name
    query += "WHERE ukewatasi BETWEEN ? and ?"
    query += "AND torihiki <> '株式配当金' "
    query += "AND torihiki <> '信用配当金' "
    query += "AND torihiki <> '資本剰余金配当/みなし譲渡' "
    query += "GROUP BY code  "
    query += "ORDER BY " + order_kind + " DESC "
    query += "LIMIT 5 "


    # 該当の証券コード毎に「株式現物買」の金額を取得する
    ret = JyotoEkiMeisai.find_by_sql([query, from_date, to_date])
  end


end
