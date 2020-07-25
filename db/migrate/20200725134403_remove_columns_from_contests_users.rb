class RemoveColumnsFromContestsUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :contests_users, :title, :string
    remove_column :contests_users, :image, :string
    remove_column :contests_users, :description, :string
  end
end
