class ChangeWinnerId < ActiveRecord::Migration[6.0]
  def change
    remove_column :contests_users, :winner_id, :integer
    add_column :contests_users, :winner, :boolean, default: false
  end
end
