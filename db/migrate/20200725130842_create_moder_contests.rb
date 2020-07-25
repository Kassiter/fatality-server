class CreateModerContests < ActiveRecord::Migration[6.0]
  def change
    create_table :moder_contests do |t|
      t.integer :age, null: false
      t.string :experience, null: false
      t.string :reason, null: false
      t.timestamps
    end
  end
end
