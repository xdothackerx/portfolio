class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  self.primary_key = "post_id"
end
