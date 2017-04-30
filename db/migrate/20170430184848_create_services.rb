class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :kind
      t.string :phone_number
      t.string :observation
      t.string :name

      t.timestamps null: false
    end
  end
end
