class CreateJoinTablePrevilegiesFeatures < ActiveRecord::Migration[6.0]
  def change
    create_join_table :privilieges, :privilieges_features
  end
end
