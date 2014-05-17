class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates_length_of :title, :minimum => 1
  validates_length_of :body, :minimum => 2
end
