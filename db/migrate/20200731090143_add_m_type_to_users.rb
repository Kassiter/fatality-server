class AddMTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :m_type, :integer, default: 3
  end
end
