class CreateContestKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :contest_keys do |t|
      t.string :key, null: false
      t.string :report, default: ''
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
