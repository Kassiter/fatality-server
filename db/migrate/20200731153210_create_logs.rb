class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.text :text, null: false
      t.date :on_date, null: false
      t.timestamps
    end
  end
end
