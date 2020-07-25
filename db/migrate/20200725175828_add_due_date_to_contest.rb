class AddDueDateToContest < ActiveRecord::Migration[6.0]
  def change
    add_column :contests, :due_date, :datetime
  end
end
