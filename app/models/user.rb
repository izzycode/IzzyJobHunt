class User < ActiveRecord::Base
  has_many :jobs
  has_many :companies

  has_secure_password
  validates_uniqueness_of :email


end
