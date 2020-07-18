class CreatePriviliegesFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :privilieges_features do |t|
      t.string :icon, null: false
      t.string :description, null: false
      t.string :misc, default: ""
      t.string :tooltip, default: ""
      t.timestamps
    end
  end
end