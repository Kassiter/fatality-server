class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :suspect_nickname, null: false
      t.text :details, null: false
      t.timestamps
    end
  end
end
