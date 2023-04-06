class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.string :message
      t.string :title
      t.string :reference_code

      t.belongs_to :user, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
