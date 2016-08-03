class Company < ActiveRecord::Base
  has_one :job
  has_many :honchos
  # validates_presence_of :name
  belongs_to :user
end
