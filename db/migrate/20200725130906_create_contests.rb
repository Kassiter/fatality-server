class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
