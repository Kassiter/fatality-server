class AddSteamDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :steamID, :string, default: ''
    add_column :users, :nickname, :string, default: ''
    add_column :users, :profile_url, :string, default: ''
    add_column :users, :steamID64, :string, default: ''
    add_column :users, :avatar_url, :string, default: ''
  end
end
