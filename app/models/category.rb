class Category < ActiveRecord::Base
  has_many :posts , through :connections
end