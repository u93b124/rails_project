class JyotoEkiSyukei 
    # 譲渡益明細ＤＢから銘柄毎の損益を算出する
  def self.get_soneki(nen)
    # 日付の組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"

    case nen
    when "2020" then
      table_name = "jyoto_eki_meisai2020s "
    when "2021" then
      table_name = "jyoto_eki_meisai2021s "
    when "2022" then
      table_name = "jyoto_eki_meisai2022s "
    when "2023" then
      table_name = "jyoto_eki_meisai2023s "
    when "2024" then
      table_name = "jyoto_eki_meisai2024s "
    end

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
    ret = JyotoEkiMeisai2024.find_by_sql([query, from_date, to_date])
  end
end
