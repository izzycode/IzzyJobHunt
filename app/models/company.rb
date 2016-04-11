class Company < ActiveRecord::Base
  has_many :jobs
  has_many :honchos
  validates_presence_of :name

end
