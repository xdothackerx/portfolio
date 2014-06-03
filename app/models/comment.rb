class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates_length_of :content, :minimum =>1

  def approve!
    approved = true
    save!
  end

end
