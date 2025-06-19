class HaitoEkiSyukei
    # 譲渡益明細ＤＢから配当金を集計する
  def self.get_soneki(nen)
    # 日付の組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"

    table_name = "jyoto_eki_meisais "

    # SQL
    query = "SELECT code, MAX(name) as name, SUM(son_eki_gaku) as son_eki_gaku, "
    query += "MIN(syutoku_bi) AS kaituke_bi, MAX(yakujo_bi) AS baikyaku_bi, "
    query += "MIN(ukewatasi) AS ukewatasi_bi, "
    query += "SUM(count) AS kabu_su, SUM(sinki_gaku) AS konyu_gaku "
    query += "FROM " + table_name
    query += "WHERE ukewatasi BETWEEN ? and ?"
    query += "AND ( torihiki = '株式配当金' OR torihiki = '信用配当金')"
    query += "GROUP BY code "
    query += "ORDER BY son_eki_gaku DESC "

    # 該当の証券コード毎に「株式配当金」の金額を取得する
    ret = JyotoEkiMeisai.find_by_sql([query, from_date, to_date])
  end

end
