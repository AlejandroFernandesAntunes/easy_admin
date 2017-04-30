class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.roles
    ['admin', 'regular']
  end
end
