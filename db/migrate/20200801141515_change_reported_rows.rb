class ChangeReportedRows < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :reported_rows, :integer, array: true, null: false
  end
end
