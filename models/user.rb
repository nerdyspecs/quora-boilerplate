class User < ActiveRecord::Base
  has_secure_password
	# validates :username, uniqueness: true
	# validates :email, uniqueness: true
	# validates :password, length: {minimum: 8}
end