class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.belongs_to :user, index: true, foreign_key: true, type: :uuid
      t.decimal :balance, precision: 12, scale: 2

      t.timestamps
    end
  end
end
