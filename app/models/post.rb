class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates_length_of :title, :minimum => 1
  validates_length_of :body, :minimum => 2
  has_many :comments
  accepts_nested_attributes_for :comments
  # before_destroy :to_log

  def publish!
    published = true
    save!
  end

  # private

  #   def to_log
  #     Rails.logger.info()
  #   end
end
