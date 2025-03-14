module CsvImport extend ActiveSupport::Concern
  UPLOAD_NEN =  [["2020年", "2020"], ["2021年", "2021"], 
                ["2022年", "2022"], ["2023年", "2023"], 
                ["2024年", "2024"], ["2025年", "2025"]]

  #引数：file,gamen_kind(取引履歴:tori／企業マスタ:kigyo) , :nendo（年度）
  def import(file,gamen_kind, nendo)

    # インポート前に古いデータを一旦削除する
    ActiveRecord::Base.connection.execute("DELETE FROM jyoto_eki_meisais WHERE ukewatasi BETWEEN " + nendo + "0101 AND " + nendo + "1231;")

    # CSVファイルを UTF8に変換して読み込む(lineno: 処理中の行番号1～)
    csv_contents = CSV.read(file.path, encoding: 'Shift_JIS:UTF-8')

    # CSVの最初の21行はコメントなので読み飛ばす
    21.times do
      csv_contents.shift
    end

    # 22行目からのCSV行を１行ずつ [データ,行番号] を取得する
    csv_contents.each.with_index do |row, lineno|

      begin
        # 処理対象でない行(CSVのA列がブランクまたは"税,額"が含まれるもの)を読み飛ばす
        next if row[0].blank?
        next if ( row[0].include?("税") || row[0].include?("額") )

        jyo_to_eki_meisai = JyotoEkiMeisai.new

        # JyotoEkiMeisaiテーブルの各項目にcsv値[0]～[12]をセット
        jyo_to_eki_meisai.code         = row[0]
        jyo_to_eki_meisai.name         = row[1]
        jyo_to_eki_meisai.torihiki     = row[2]
        jyo_to_eki_meisai.yakujo_bi    = row[3]
        jyo_to_eki_meisai.count        = row[4]
        jyo_to_eki_meisai.torihiki     = row[5]
        jyo_to_eki_meisai.ukewatasi    = row[6]
        jyo_to_eki_meisai.baikyaku     = row[7]
        jyo_to_eki_meisai.hiyo         = row[8]
        jyo_to_eki_meisai.syutoku_bi   = row[9]
        jyo_to_eki_meisai.sinki_gaku   = row[10]
        jyo_to_eki_meisai.son_eki_gaku = row[11]
        jyo_to_eki_meisai.chiho        = row[12]

        # レコードの INSERT
        jyo_to_eki_meisai.save

      rescue
        raise $!, "#{lineno} 行目を処理中にエラーが発生しました。\n#{$!.message}", $!.backtrace
      end

    end # csv_contentsの終わり

  end  # def importの終わり
end # module の終わり