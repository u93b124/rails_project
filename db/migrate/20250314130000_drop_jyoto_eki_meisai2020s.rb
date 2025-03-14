class DropJyotoEkiMeisai2020s < ActiveRecord::Migration[7.0]
  def change
    drop_table  :jyoto_eki_meisai2020s do |t|
      t.integer :code
      t.string :name
      t.string :torikesi
      t.date :yakujo_bi
      t.integer :count
      t.string :torihiki
      t.date :ukewatasi
      t.integer :baikyaku
      t.integer :hiyo
      t.date :syutoku_bi
      t.integer :sinki_gaku
      t.integer :son_eki_gaku
      t.integer :chiho
      t.timestamps
    end

    drop_table  :jyoto_eki_meisai2021s do |t|
      t.integer :code
      t.string :name
      t.string :torikesi
      t.date :yakujo_bi
      t.integer :count
      t.string :torihiki
      t.date :ukewatasi
      t.integer :baikyaku
      t.integer :hiyo
      t.date :syutoku_bi
      t.integer :sinki_gaku
      t.integer :son_eki_gaku
      t.integer :chiho
      t.timestamps
    end

    drop_table  :jyoto_eki_meisai2022s do |t|
      t.integer :code
      t.string :name
      t.string :torikesi
      t.date :yakujo_bi
      t.integer :count
      t.string :torihiki
      t.date :ukewatasi
      t.integer :baikyaku
      t.integer :hiyo
      t.date :syutoku_bi
      t.integer :sinki_gaku
      t.integer :son_eki_gaku
      t.integer :chiho
      t.timestamps
    end

    drop_table  :jyoto_eki_meisai2023s do |t|
      t.integer :code
      t.string :name
      t.string :torikesi
      t.date :yakujo_bi
      t.integer :count
      t.string :torihiki
      t.date :ukewatasi
      t.integer :baikyaku
      t.integer :hiyo
      t.date :syutoku_bi
      t.integer :sinki_gaku
      t.integer :son_eki_gaku
      t.integer :chiho
      t.timestamps
    end

    drop_table  :jyoto_eki_meisai2024s do |t|
      t.integer :code
      t.string :name
      t.string :torikesi
      t.date :yakujo_bi
      t.integer :count
      t.string :torihiki
      t.date :ukewatasi
      t.integer :baikyaku
      t.integer :hiyo
      t.date :syutoku_bi
      t.integer :sinki_gaku
      t.integer :son_eki_gaku
      t.integer :chiho
      t.timestamps
    end

    drop_table  :jyoto_eki_meisai2025s do |t|
      t.integer :code
      t.string :name
      t.string :torikesi
      t.date :yakujo_bi
      t.integer :count
      t.string :torihiki
      t.date :ukewatasi
      t.integer :baikyaku
      t.integer :hiyo
      t.date :syutoku_bi
      t.integer :sinki_gaku
      t.integer :son_eki_gaku
      t.integer :chiho
      t.timestamps
    end

  end
end
