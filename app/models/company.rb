class Company < ActiveRecord::Base
  has_many :jobs
  has_many :honchos
end
