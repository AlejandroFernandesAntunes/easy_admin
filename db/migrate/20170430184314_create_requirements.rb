class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :title
      t.string :body
      t.string :resolution
      t.boolean :resolved, default: :false

      t.timestamps null: false
    end
  end
end
