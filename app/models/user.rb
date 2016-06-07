class User < ActiveRecord::Base
  has_many :jobs
  has_many :companies

  validates_uniqueness_of :email


end
