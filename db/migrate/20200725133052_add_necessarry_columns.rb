class AddNecessarryColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :moder_contests_users, :user_id, :integer, null: false
    add_column :moder_contests_users, :moder_contest_id, :integer, null: false
    add_column :moder_contests_users, :winner, :boolean, null: false, defalult: false
    add_column :moder_contests_users, :age, :integer, null: false
    add_column :moder_contests_users, :experience, :string, null: false
    add_column :moder_contests_users, :reason, :string, null: false
  end
end
