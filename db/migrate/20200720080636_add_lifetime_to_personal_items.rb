class AddLifetimeToPersonalItems < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_items, :lifetime, :integer, default: 0
  end
end
