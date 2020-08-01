class AddReportedAndApprovedToLog < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :reported, :boolean, default: false
  end
end
