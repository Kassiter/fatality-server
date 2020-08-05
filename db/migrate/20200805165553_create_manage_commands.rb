class CreateManageCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :manage_commands do |t|
      t.string :group, null: false
      t.string :name, null: false
      t.string :target, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
