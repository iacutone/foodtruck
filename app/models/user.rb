class User
	
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  has_secure_password
  
  field :name,            type: String
  field :email,           type: String
  field :password_digest, type: String
  
  def self.permitted_params
  	[
  		:name,
  		:email,
  		:password_conifmation
  	]
  end
end
