class CreateKigyoMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :kigyo_masters do |t|
      t.integer :code
      t.string :name
      t.string :market
      t.string :kind

      t.timestamps
    end
  end
end
