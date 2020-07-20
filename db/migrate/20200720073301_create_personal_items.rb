class CreatePersonalItems < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_items do |t|
      t.string :key, null: false
      t.string :description, default: ''
      t.boolean :done, default: false
      t.boolean :valid, default: true
      t.timestamps
    end
  end
end
