class AddUserIdToPersonalItems < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_items, :user_id, :integer
  end
end
