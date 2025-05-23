class CreateJyotoEkiMeisais < ActiveRecord::Migration[7.0]
  def change
    create_table :jyoto_eki_meisais do |t|
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
