class CreatePersonalFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_features do |t|
      t.string :name, null: false
      t.string :img_url, null: false
      t.string :option_name_basic, null: false
      t.string :option_name_advanced, null: false
      t.string :option_basic_link, null: false
      t.string :option_advanced_link, null: false
      t.decimal :option_basic_cost, null: false
      t.decimal :option_advanced_cost, null: false
      t.timestamps
    end
  end
end
