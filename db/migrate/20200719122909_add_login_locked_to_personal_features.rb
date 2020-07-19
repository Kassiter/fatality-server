class AddLoginLockedToPersonalFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_features, :login_locked, :boolean, default: false
  end
end
