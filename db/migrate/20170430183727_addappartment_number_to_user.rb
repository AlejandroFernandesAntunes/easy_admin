class AddappartmentNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :apartment_number, :string
  end
end
