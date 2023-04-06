class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.uuid :sender_id
      t.uuid :receiver_id
      t.decimal :amount, precision: 8, scale: 2
      t.integer :status

      t.timestamps
    end
  end
end
