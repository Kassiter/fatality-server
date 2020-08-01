class AddKeyToContest < ActiveRecord::Migration[6.0]
  def change
    add_column :contests, :con_key, :string, default: '' 
  end
end
