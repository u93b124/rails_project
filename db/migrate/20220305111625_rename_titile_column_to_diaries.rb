class  RenameTitileColumnToDiaries < ActiveRecord::Migration[7.0]
  def change
    rename_column :diaries, :titile, :title
  end
end
