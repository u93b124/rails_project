module CsvImport extend ActiveSupport::Concern

  #引数：file,gamen_kind(取引履歴:tori／企業マスタ:kigyo)
  def import(file,gamen_kind)
    # インポート前に古いデータを一旦削除する
    if gamen_kind == "tori"
      #TorihikiRireki.delete_all
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE torihiki_rirekis;")
    else
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE kigyo_masters;")
      #KigyoMaster.delete_all
    end
    CSV.foreach(file.path, headers: true) do |row|
      # 取引履歴の場合
      if gamen_kind == "tori"
        #p "import tori"
        torihiki_rireki = TorihikiRireki.new

        # CSVからデータを取得し、設定する
        torihiki_rireki.attributes = row.to_hash.slice(*updatable_attributes_tori)
        torihiki_rireki.save

      # 企業マスタの場合  
      else  
        #p "import kigyo"
        kigyo_master = KigyoMaster.new

        # CSVからデータを取得し、設定する
        kigyo_master.attributes = row.to_hash.slice(*updatable_attributes_kigyo)
        kigyo_master.save
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

end