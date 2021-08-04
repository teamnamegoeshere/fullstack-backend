class ChangePublicDefaultToFalseInLists < ActiveRecord::Migration[6.1]
  def change
    change_column_default(
      :lists,
      :public,
      false
    )
  end
end
