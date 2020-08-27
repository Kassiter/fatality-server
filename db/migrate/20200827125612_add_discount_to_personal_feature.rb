class AddDiscountToPersonalFeature < ActiveRecord::Migration[6.0]
  def change
    add_column :privilieges, :discount, :integer
    add_column :personal_features, :discount, :integer
  end
end
