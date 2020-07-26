class AddDueDateToModer < ActiveRecord::Migration[6.0]
  def change
    add_column :moder_contests, :due_date, :datetime
  end
end
