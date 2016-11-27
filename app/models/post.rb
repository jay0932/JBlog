class Post < ActiveRecord::Base
  attr_accessor :category_name
  belongs_to :user
  has_many :comments
  
  has_many :connections
  has_many :categories, through: :connections

end
