class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :surname
      t.string :middle_name
      t.string :phone, null: false
      t.string :email
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
