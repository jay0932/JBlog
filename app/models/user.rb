class User < ActiveRecord::Base
	has_secure_password validation: false
  
  has_many :posts
  has_many :comments
end