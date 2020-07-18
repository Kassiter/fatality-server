class AddVipTypeToPriviliegesFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :privilieges_features, :vip_type, :string, default: ''
  end
end
