class ChangeColumnToCodeMeigaraMemos < ActiveRecord::Migration[7.0]
  # 変更内容
  def up
    change_column :meigara_memos, :code, :string
  end

  # 変更前の状態
  def down
    change_column :meigara_memos, :code, :integer
  end
end
