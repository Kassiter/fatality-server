class AddOnDateToContestKeys < ActiveRecord::Migration[6.0]
  def change
    add_column :contest_keys, :on_date, :date, null: false
  end
end
