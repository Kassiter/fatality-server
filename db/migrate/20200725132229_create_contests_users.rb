class CreateContestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :contests_users do |t|
      t.integer :user_id, null: false
      t.integer :contest_id, null: false
      t.boolean :winner_id, null: false, default: false
      t.string :title, null: false
      t.string :description, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
