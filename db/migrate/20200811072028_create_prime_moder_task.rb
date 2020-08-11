class CreatePrimeModerTask < ActiveRecord::Migration[6.0]
  def change
    create_table :prime_moder_tasks do |t|
      t.string :name, null: false
      t.text :report
      t.decimal :points_cost, default: 0.0
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
