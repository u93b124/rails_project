class CreateTorihikiRirekis < ActiveRecord::Migration[7.0]
  def change
    create_table :torihiki_rirekis do |t|
      t.date :yakujobi
      t.string :meigara
      t.integer :code
      t.string :market
      t.string :torihiki
      t.string :kigen
      t.string :azukari
      t.string :kazei
      t.integer :count
      t.integer :tanka
      t.integer :tesuu
      t.integer :zeigaku
      t.date :ukewatasi
      t.integer :kingaku

      t.timestamps
    end
  end
end
