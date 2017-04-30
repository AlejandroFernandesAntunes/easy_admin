class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :body
      t.boolean :published

      t.timestamps null: false
    end
  end
end
