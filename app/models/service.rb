class Service < ActiveRecord::Base
  validates :name, presence: true
  validates :kind, presence: true
  validates :phone_number, presence: true
end
