class AddApprovedToReport < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :approved, :boolean, default: false
  end
end
