class CreateModerContestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :moder_contests_users do |t|

      t.timestamps
    end
  end
end
