class CreateTopUps < ActiveRecord::Migration[7.0]
  def change
    create_table :top_ups, id: :uuid do |t|
      t.belongs_to :account, index: true, foreign_key: true, type: :uuid
      t.decimal :amount, precision: 8, scale: 2
      t.integer :status
      t.string :reference_code

      t.timestamps
    end
  end
end
