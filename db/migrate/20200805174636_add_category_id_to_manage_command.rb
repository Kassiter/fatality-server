class AddCategoryIdToManageCommand < ActiveRecord::Migration[6.0]
  def change
    add_column :manage_commands, :manage_command_category_id, :integer, null: false
    change_column :manage_commands, :param, :string, null: true
  end
end
