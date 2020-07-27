class CreateRefunds < ActiveRecord::Migration[6.0]
  def change
    create_table :refunds do |t|
      t.string :when_buyed
      t.string :buyer_nickname
      t.string :priviliege_type
      t.string :proofs
      t.timestamps
    end
  end
end
