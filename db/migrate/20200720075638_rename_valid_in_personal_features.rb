class RenameValidInPersonalFeatures < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_items, :valid, :boolean
    add_column :personal_items, :used, :boolean, default: false
    rename_column :personal_items, :key_string, :key
  end
end
