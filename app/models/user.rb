class User < ActiveRecord::Base
  has_many :jobs
  has_secure_password
  validates_presence_of :name
  validates_uniqueness_of :email




end
