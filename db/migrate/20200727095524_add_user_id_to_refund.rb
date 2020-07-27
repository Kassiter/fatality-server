class AddUserIdToRefund < ActiveRecord::Migration[6.0]
  def change
    add_column :refunds, :user_id, :integer
  end
end
