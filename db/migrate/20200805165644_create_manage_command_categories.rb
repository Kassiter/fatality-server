class CreateManageCommandCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :manage_command_categories do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
