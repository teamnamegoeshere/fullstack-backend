class ChangeListsPublicToShared < ActiveRecord::Migration[6.1]
  def change
    rename_column :lists, :public, :shared
  end
end
