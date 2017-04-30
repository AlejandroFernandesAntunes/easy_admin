class AddAdmin < ActiveRecord::Migration
  def change
    User.create(
      email: 'default_admin@mail.com',
      password: 'password',
      password_confirmation: 'password',
      role: 'admin',
      name: 'Jhon Doe Admin (remove after config)'
    )
  end
end
