class ChangeReportInContestKeys < ActiveRecord::Migration[6.0]
  def change
    remove_column :contest_keys, :report, :string
    add_column :contest_keys, :report, :text
  end
end
