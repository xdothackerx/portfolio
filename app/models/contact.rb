class Contact < ActiveRecord::Base
  attr_accessor :name, :email, :message
  validates_length_of :name, :message, :minimum => 1
  validates_presence_of :email
end
