class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :attempts
  validates_presence_of :position








end
