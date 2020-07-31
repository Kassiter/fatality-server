class AddKeyPharseToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :key_phrase, :string, default: ''
  end
end
