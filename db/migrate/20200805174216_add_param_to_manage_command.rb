class AddParamToManageCommand < ActiveRecord::Migration[6.0]
  def change
    add_column :manage_commands, :param, :string, null: false
  end
end
