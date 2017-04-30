class Notification < ActiveRecord::Base
  validates :title, presence: true
end
