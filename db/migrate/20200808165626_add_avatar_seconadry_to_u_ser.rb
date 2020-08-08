class AddAvatarSeconadryToUSer < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_secondary, :string, default: ''
    add_column :users, :position_name, :string, default: ''
  end
end
