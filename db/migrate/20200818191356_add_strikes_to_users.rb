class AddStrikesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :strikes, :integer, default: 0
  end
end
