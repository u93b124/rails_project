class CreateMeigaraMemo < ActiveRecord::Migration[7.0]
  def change
    create_table :meigara_memos do |t|
      t.integer :code
      t.integer :nendo
      t.text :memo
      t.timestamps
    end
  end
end
