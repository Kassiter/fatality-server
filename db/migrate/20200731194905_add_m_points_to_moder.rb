class AddMPointsToModer < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :m_points, :decimal, default: 0.0 
  end
end
