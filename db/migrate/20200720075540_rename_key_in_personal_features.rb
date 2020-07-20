class RenameKeyInPersonalFeatures < ActiveRecord::Migration[6.0]
  def change
    rename_column :personal_items, :key, :key_string
  end
end
