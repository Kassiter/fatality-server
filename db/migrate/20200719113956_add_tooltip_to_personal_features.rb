class AddTooltipToPersonalFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_features, :tooltip, :string, default: ''
  end
end
