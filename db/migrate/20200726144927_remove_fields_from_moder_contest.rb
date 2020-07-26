class RemoveFieldsFromModerContest < ActiveRecord::Migration[6.0]
  def change
    remove_column :moder_contests, :age, :integer
    remove_column :moder_contests, :experience, :string
    remove_column :moder_contests, :reason, :string
  end
end
