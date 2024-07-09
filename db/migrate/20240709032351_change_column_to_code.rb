class ChangeColumnToCode < ActiveRecord::Migration[7.0]
  # 変更内容
  def up
    change_column :jyoto_eki_meisai2024s, :code, :string
  end

  # 変更前の状態
  def down
    change_column :jyoto_eki_meisai2024s, :code, :integer
  end
end
