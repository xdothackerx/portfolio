class Project < ActiveRecord::Base
  validates :title, length: { minimum: 2 }
  validates :tech, presence: true
end
