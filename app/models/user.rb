class User < ActiveRecord::Base
  has_many :jobs
  has_one :company, through: :job
  has_many :attempts, through: :jobs
  has_many :honchos, through: :companies
  has_secure_password








end
