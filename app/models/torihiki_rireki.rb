class TorihikiRireki < ApplicationRecord

  # 銘柄毎の損益を算出する
  def self.get_soneki

    # SQL
    query = "SELECT code, MAX(torihiki) AS torihiki, SUM(kingaku) as kingaku " 
    query += "FROM torihiki_rirekis "
    query += "WHERE torihiki = ? "
    query += "GROUP BY code "
    query += "ORDER BY code "

    # 該当の証券コード毎に「株式現物買」の金額を取得する
    ret1 = TorihikiRireki.find_by_sql( [query, "株式現物買"] )

    # 「株式現物買」の金額　をハッシュに詰める
    genbutu_kai = {}
    ret1.each do |rec|
      genbutu_kai[rec[:code]] = rec[:kingaku] 
    end

#p "genbutu_kai = " , genbutu_kai

    # 該当の証券コード毎に「株式現物売」の金額を取得する
    ret2 = TorihikiRireki.find_by_sql( [query, "株式現物売"] )
    #p "ret2 =" ,ret2

    # 「株式現物売」の金額　をハッシュに詰める
    genbutu_uri = {}
    ret2.each do |rec|
      genbutu_uri[rec[:code]] = rec[:kingaku] 
    end
#p "genbutu_uri = " , genbutu_uri

    # 該当の証券コード毎に「現引」の金額を取得する
    ret3 = TorihikiRireki.find_by_sql( [query, "現引"] )
    #p "ret3 =" ,ret3

    # 「現引」の金額　をハッシュに詰める
    gen_biki = {}
    ret3.each do |rec|
      gen_biki[rec[:code]] = rec[:kingaku] 
    end

    # 計算用のキーとなる証券コードを取得する
    query_cd = "SELECT code " 
    query_cd += "FROM torihiki_rirekis "
    query_cd += "GROUP BY code "
    query_cd += "ORDER BY code "
    ret_cd = TorihikiRireki.find_by_sql( query_cd )
    
    # キーを元に「株式現物売」－「株式現物買」+ 「現引」の計算結果をハッシュに詰める
    keisan_kekka = {}

    ret_cd.each do |rec|
       #p "rec[:code] = " , rec[:code]
       #p "genbutu_uri[rec[:code]] = " , genbutu_uri[rec[:code]]
       #p "genbutu_kai[rec[:code]] = " , genbutu_kai[rec[:code]] 
       #p "gen_biki[rec[:code]] = " , gen_biki[rec[:code]]
       # nil だと計算式で落ちるので 0 設定する
       if genbutu_uri[rec[:code]].nil?
         wk_uri = 0
       else
         wk_uri = genbutu_uri[rec[:code]]
       end
         
       if genbutu_kai[rec[:code]].nil?
        wk_kai = 0
       else
        wk_kai = genbutu_kai[rec[:code]]
       end

       if gen_biki[rec[:code]].nil?
        wk_biki = 0
       else
        wk_biki = gen_biki[rec[:code]]
       end

       keisan_kekka[rec[:code]]  = wk_uri - wk_kai + wk_biki      
    end

    # HashのValueを降順にソート
    keisan_kekka = keisan_kekka.sort_by { |_, v| v }.reverse.to_h
  end

end
