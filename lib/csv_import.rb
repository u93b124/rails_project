module CsvImport extend ActiveSupport::Concern

  #引数：file,gamen_kind(取引履歴:tori／企業マスタ:kigyo) , :nendo（年度）
  def import(file,gamen_kind, nendo)
    # インポート前に古いデータを一旦削除する
    if gamen_kind == "tori"
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE torihiki_rirekis;")
    elsif gamen_kind == "kigyo"
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE kigyo_masters;")
    elsif gamen_kind == "jyoto"
      case nendo
      when "2020" then
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE jyoto_eki_meisai2020s;")
        p "TRUNCATE TABLE jyoto_eki_meisai2020s"
      when "2021" then
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE jyoto_eki_meisai2021s;")
        p "TRUNCATE TABLE jyoto_eki_meisai2021s"
      when "2022" then
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE jyoto_eki_meisai2022s;")
        p "TRUNCATE TABLE jyoto_eki_meisai2022s"
      end
    end

    # CSVファイルを UTF8に変換して読み込む
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      # 取引履歴の場合
      if gamen_kind == "tori"
        torihiki_rireki = TorihikiRireki.new

        # CSVからデータを取得し、設定する
        torihiki_rireki.attributes = row.to_hash.slice(*updatable_attributes_tori)
        torihiki_rireki.save

      # 企業マスタの場合  
      elsif gamen_kind == "kigyo"
        kigyo_master = KigyoMaster.new

        # CSVからデータを取得し、設定する
        kigyo_master.attributes = row.to_hash.slice(*updatable_attributes_kigyo)
        kigyo_master.save
      
      # 譲渡益明細の場合  
      elsif gamen_kind == "jyoto"
        case nendo
        when "2020" then
          jyo_to_eki_meisai = JyotoEkiMeisai2020.new
          p "JyotoEkiMeisai2020.new"
        when "2021" then
          jyo_to_eki_meisai = JyotoEkiMeisai2021.new
          p "JyotoEkiMeisai2021.new"
        when "2022" then
          jyo_to_eki_meisai = JyotoEkiMeisai2022.new
          p "JyotoEkiMeisai2022.new"
        end

        # CSVからデータを取得し、設定する
        jyo_to_eki_meisai.attributes = row.to_hash.slice(*updatable_attributes_jyoto)
        jyo_to_eki_meisai.save
      end 
    end
  end

  # 更新を許可するカラムを定義（取引履歴）
  def updatable_attributes_tori
    ["yakujobi","meigara","code","market","torihiki","kigen","azukari","kazei",
      "count","tanka","tesuu","zeigaku","ukewatasi","kingaku"]
  end

  # 更新を許可するカラムを定義（企業マスタ）
  def updatable_attributes_kigyo
    ["code", "name", "market", "kind"]
  end

  # 更新を許可するカラムを定義（譲渡益明細）
  def updatable_attributes_jyoto
    ["code","name","torikesi","yakujo_bi","count","torihiki",
      "ukewatasi","baikyaku","hiyo","syutoku_bi","sinki_gaku","son_eki_gaku","chiho"]
  end

end