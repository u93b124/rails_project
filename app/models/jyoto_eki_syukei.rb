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

  # 全投資期間における各銘柄の損益ランキングを算出する
  def self.get_tuusan_ranking(kind, nen, order_by)
    # SQLパラメータの組み立て
    from_date = nen + "-01-01"
    to_date = nen + "-12-31"
    table_name = "jyoto_eki_meisais "

    if kind == "ritu"
      order_item = "tou_raku_ritu"
    else
      order_item = "son_eki_gaku"
    end

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
    query += "ORDER BY " + order_item + " " + order_by + " "
    query += "LIMIT 10 " # SQL側で各年のベスト１０まで取得しておきビュー側で全体のベスト１０まで絞る

    ret = JyotoEkiMeisai.find_by_sql([query, from_date, to_date])
  end

  # 通算ランキング（利益額／損失額）
  def self.get_tuusan_ranking_gaku(order_by)

    # SQLで1度に集計できないので、2020年から各年でループする
    son_eki = []
    (2020..Date.current.year).each do |nen|
      son_eki << self.get_tuusan_ranking("gaku", nen.to_s, order_by)
    end

    if order_by == "DESC"
      # 利益額ランキングでは損益額の降り順にソートする
      son_eki_sort = son_eki.flatten.sort_by {|x| -x["son_eki_gaku"] } 
    else
      # 損失額ランキングでは損益額の上り順にソートする
      son_eki_sort = son_eki.flatten.sort_by {|x| x["son_eki_gaku"] } 
    end
  end

  # 通算ランキング（利益率／損失率）
  def self.get_tuusan_ranking_ritu(order_by)

    # SQLで1度に集計できないので、2020年から各年でループする
    son_eki = []
    (2020..Date.current.year).each do |nen|
      son_eki << self.get_tuusan_ranking("ritu", nen.to_s, order_by)
    end

    if order_by == "DESC"
      # 利益率ランキングでは騰落率の降り順にソートする
      son_eki_sort = son_eki.flatten.sort_by {|x| -x["tou_raku_ritu"] } 
    else
      # 損失率ランキングでは騰落率の上り順にソートする
      son_eki_sort = son_eki.flatten.sort_by {|x| x["tou_raku_ritu"] } 
    end
  end

end
