class ChangeReportInContestKeys < ActiveRecord::Migration[6.0]
  def change
    add_column :contest_keys, :report, :text
  end
end
