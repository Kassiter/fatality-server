class CreatePrivilieges < ActiveRecord::Migration[6.0]
  def change
    create_table :privilieges do |t|
      t.string :name, null: false
      t.string :link_lifetime, null: false
      t.string :link_month, null: false
      t.decimal :cost_lifetime, null: false
      t.decimal :cost_month, null: false
      t.timestamps
    end
  end
end